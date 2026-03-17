import { useState } from 'react'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import api from '../lib/api'
import { Plus, Edit, Trash2, X } from 'lucide-react'

export default function CategoriesPage() {
  const qc = useQueryClient()
  const [modal, setModal] = useState(null) // null | { mode: 'add' | 'edit', data: {} }
  const [form, setForm] = useState({ name: '', description: '', icon: '', sort_order: 0 })
  const [error, setError] = useState('')

  const { data: categories, isLoading } = useQuery({
    queryKey: ['categories'],
    queryFn: () => api.get('/categories').then(r => r.data),
  })

  const saveMutation = useMutation({
    mutationFn: data => modal?.mode === 'edit'
      ? api.put(`/admin/categories/${modal.data.id}`, data)
      : api.post('/admin/categories', data),
    onSuccess: () => { qc.invalidateQueries({ queryKey: ['categories'] }); setModal(null); setError('') },
    onError: err => setError(err.response?.data?.error || 'Failed'),
  })

  const deleteMutation = useMutation({
    mutationFn: id => api.delete(`/admin/categories/${id}`),
    onSuccess: () => qc.invalidateQueries({ queryKey: ['categories'] }),
  })

  function openAdd() { setForm({ name: '', description: '', icon: '', sort_order: 0 }); setModal({ mode: 'add' }); setError('') }
  function openEdit(cat) { setForm({ name: cat.name, description: cat.description || '', icon: cat.icon || '', sort_order: cat.sort_order || 0 }); setModal({ mode: 'edit', data: cat }); setError('') }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Categories</h1>
        <button onClick={openAdd} className="flex items-center gap-2 bg-[#6366F1] hover:bg-indigo-600 text-white px-4 py-2 rounded-lg text-sm font-medium">
          <Plus size={16} /> Add Category
        </button>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-slate-50 text-slate-600 text-xs uppercase tracking-wide">
            <tr>
              <th className="text-left px-4 py-3">Name</th>
              <th className="text-left px-4 py-3">Slug</th>
              <th className="text-left px-4 py-3">Description</th>
              <th className="text-center px-4 py-3">Order</th>
              <th className="text-right px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {isLoading ? Array(5).fill(0).map((_, i) => (
              <tr key={i} className="animate-pulse"><td className="px-4 py-3"><div className="h-4 bg-slate-200 rounded w-24" /></td><td /><td /><td /><td /></tr>
            )) : categories?.map(cat => (
              <tr key={cat.id} className="hover:bg-slate-50">
                <td className="px-4 py-3 font-medium text-slate-900">{cat.name}</td>
                <td className="px-4 py-3 text-slate-500 font-mono text-xs">{cat.slug}</td>
                <td className="px-4 py-3 text-slate-600 max-w-xs truncate">{cat.description || '–'}</td>
                <td className="px-4 py-3 text-center text-slate-600">{cat.sort_order}</td>
                <td className="px-4 py-3 text-right">
                  <div className="flex items-center justify-end gap-2">
                    <button onClick={() => openEdit(cat)} className="p-1.5 text-slate-400 hover:text-[#6366F1] hover:bg-indigo-50 rounded-lg"><Edit size={15} /></button>
                    <button onClick={() => window.confirm('Delete this category?') && deleteMutation.mutate(cat.id)} className="p-1.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg"><Trash2 size={15} /></button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Modal */}
      {modal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl w-full max-w-md p-6">
            <div className="flex items-center justify-between mb-5">
              <h2 className="font-bold text-slate-900">{modal.mode === 'add' ? 'Add Category' : 'Edit Category'}</h2>
              <button onClick={() => setModal(null)} className="text-slate-400 hover:text-slate-600"><X size={20} /></button>
            </div>
            {error && <div className="text-red-600 text-sm mb-3">{error}</div>}
            <div className="space-y-3">
              {[
                { label: 'Name *', key: 'name' },
                { label: 'Description', key: 'description' },
                { label: 'Icon (lucide name)', key: 'icon' },
                { label: 'Sort Order', key: 'sort_order', type: 'number' },
              ].map(({ label, key, type = 'text' }) => (
                <div key={key}>
                  <label className="text-sm font-medium text-slate-700 block mb-1">{label}</label>
                  <input type={type} value={form[key]} onChange={e => setForm(f => ({ ...f, [key]: type === 'number' ? parseInt(e.target.value) || 0 : e.target.value }))}
                    className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
                </div>
              ))}
            </div>
            <div className="flex gap-3 mt-5">
              <button onClick={() => setModal(null)} className="flex-1 border border-slate-300 text-slate-700 rounded-lg py-2 text-sm hover:bg-slate-50">Cancel</button>
              <button onClick={() => saveMutation.mutate(form)} disabled={saveMutation.isPending}
                className="flex-1 bg-[#6366F1] hover:bg-indigo-600 disabled:opacity-50 text-white rounded-lg py-2 text-sm font-medium">
                {saveMutation.isPending ? 'Saving...' : 'Save'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
