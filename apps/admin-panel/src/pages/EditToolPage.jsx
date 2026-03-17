import { useState, useEffect } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import api from '../lib/api'
import { Save } from 'lucide-react'

export default function EditToolPage() {
  const { id } = useParams()
  const navigate = useNavigate()
  const qc = useQueryClient()
  const [form, setForm] = useState(null)
  const [error, setError] = useState('')

  const { data: tool } = useQuery({
    queryKey: ['tool-detail', id],
    queryFn: () => api.get(`/tools?id=${id}&limit=1`).then(r => r.data.tools?.[0]),
  })

  useEffect(() => {
    if (tool) setForm({
      name: tool.name,
      tagline: tool.tagline || '',
      description: tool.description || '',
      logo_url: tool.logo_url || '',
      website_url: tool.website_url || '',
      is_featured: tool.is_featured,
      is_new: tool.is_new,
      is_active: tool.is_active
    })
  }, [tool])

  const mutation = useMutation({
    mutationFn: data => api.put(`/admin/tools/${id}`, data),
    onSuccess: () => { qc.invalidateQueries({ queryKey: ['admin', 'tools'] }); navigate('/tools') },
    onError: err => setError(err.response?.data?.error || 'Failed to update'),
  })

  if (!form) return <div className="animate-pulse h-64 bg-white rounded-xl border border-slate-200" />

  return (
    <div className="max-w-2xl">
      <h1 className="text-2xl font-bold text-slate-900 mb-6">Edit Tool: {tool?.name}</h1>
      {error && <div className="bg-red-50 border border-red-200 text-red-700 rounded-lg px-4 py-3 mb-4 text-sm">{error}</div>}
      <div className="bg-white rounded-xl border border-slate-200 p-6 space-y-4">
        {[
          { label: 'Name', key: 'name' },
          { label: 'Tagline', key: 'tagline' },
          { label: 'Logo URL', key: 'logo_url' },
          { label: 'Website URL', key: 'website_url' },
        ].map(({ label, key }) => (
          <div key={key}>
            <label className="text-sm font-medium text-slate-700 block mb-1">{label}</label>
            <input value={form[key] || ''} onChange={e => setForm(f => ({ ...f, [key]: e.target.value }))}
              className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
          </div>
        ))}
        <div>
          <label className="text-sm font-medium text-slate-700 block mb-1">Description</label>
          <textarea value={form.description || ''} onChange={e => setForm(f => ({ ...f, description: e.target.value }))}
            rows={4} className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1] resize-none" />
        </div>
        <div className="flex gap-4">
          {['is_featured', 'is_new', 'is_active'].map(k => (
            <label key={k} className="flex items-center gap-2 text-sm text-slate-600 cursor-pointer">
              <input type="checkbox" checked={form[k]} onChange={e => setForm(f => ({ ...f, [k]: e.target.checked }))} className="rounded text-[#6366F1]" />
              {k.replace('is_', '').charAt(0).toUpperCase() + k.replace('is_', '').slice(1)}
            </label>
          ))}
        </div>
        <div className="flex gap-3 pt-2">
          <button onClick={() => navigate('/tools')} className="px-4 py-2 border border-slate-300 text-slate-700 rounded-lg text-sm hover:bg-slate-50">Cancel</button>
          <button onClick={() => mutation.mutate(form)} disabled={mutation.isPending}
            className="flex items-center gap-2 bg-[#6366F1] hover:bg-indigo-600 disabled:opacity-50 text-white px-5 py-2 rounded-lg text-sm font-medium">
            <Save size={16} /> {mutation.isPending ? 'Saving...' : 'Save Changes'}
          </button>
        </div>
      </div>
    </div>
  )
}
