import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import api from '../lib/api'
import { Plus, Edit, Trash2, Search } from 'lucide-react'

export default function ToolsPage() {
  const [q, setQ] = useState('')
  const [page, setPage] = useState(1)
  const qc = useQueryClient()

  const { data, isLoading } = useQuery({
    queryKey: ['admin', 'tools', q, page],
    queryFn: () => api.get(`/tools?q=${q}&page=${page}&limit=20`).then(r => r.data),
  })

  const deleteMutation = useMutation({
    mutationFn: id => api.delete(`/admin/tools/${id}`),
    onSuccess: () => qc.invalidateQueries({ queryKey: ['admin', 'tools'] }),
  })

  const toggleMutation = useMutation({
    mutationFn: ({ id, field, value }) => api.put(`/admin/tools/${id}`, { [field]: value }),
    onSuccess: () => qc.invalidateQueries({ queryKey: ['admin', 'tools'] }),
  })

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Tools Management</h1>
        <Link to="/tools/new" className="flex items-center gap-2 bg-[#6366F1] hover:bg-indigo-600 text-white px-4 py-2 rounded-lg text-sm font-medium">
          <Plus size={16} /> Add Tool
        </Link>
      </div>

      <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
        <div className="p-4 border-b border-slate-200">
          <div className="relative">
            <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
            <input
              type="text" value={q} onChange={e => { setQ(e.target.value); setPage(1) }}
              placeholder="Search tools..."
              className="pl-9 pr-4 py-2 border border-slate-300 rounded-lg text-sm w-72 focus:outline-none focus:border-[#6366F1]"
            />
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead className="bg-slate-50 text-slate-600 text-xs uppercase tracking-wide">
              <tr>
                <th className="text-left px-4 py-3">Tool</th>
                <th className="text-left px-4 py-3">Category</th>
                <th className="text-center px-4 py-3">Featured</th>
                <th className="text-center px-4 py-3">New</th>
                <th className="text-center px-4 py-3">Active</th>
                <th className="text-right px-4 py-3">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {isLoading ? (
                Array(10).fill(0).map((_, i) => (
                  <tr key={i} className="animate-pulse">
                    <td className="px-4 py-3"><div className="h-4 bg-slate-200 rounded w-32" /></td>
                    <td className="px-4 py-3"><div className="h-4 bg-slate-200 rounded w-20" /></td>
                    <td className="px-4 py-3" /><td className="px-4 py-3" /><td className="px-4 py-3" />
                    <td className="px-4 py-3" />
                  </tr>
                ))
              ) : (
                data?.tools?.map(tool => (
                  <tr key={tool.id} className="hover:bg-slate-50">
                    <td className="px-4 py-3">
                      <div className="flex items-center gap-2">
                        {tool.logo_url
                          ? <img src={tool.logo_url} alt="" className="w-8 h-8 rounded-lg object-cover" />
                          : <div className="w-8 h-8 rounded-lg bg-indigo-100 flex items-center justify-center text-[#6366F1] font-bold text-xs">{tool.name[0]}</div>
                        }
                        <div>
                          <p className="font-medium text-slate-900">{tool.name}</p>
                          <p className="text-xs text-slate-500 truncate max-w-xs">{tool.tagline}</p>
                        </div>
                      </div>
                    </td>
                    <td className="px-4 py-3 text-slate-600">{tool.categories?.name || '–'}</td>
                    <td className="px-4 py-3 text-center">
                      <button onClick={() => toggleMutation.mutate({ id: tool.id, field: 'is_featured', value: !tool.is_featured })}
                        className={`w-9 h-5 rounded-full transition-colors ${tool.is_featured ? 'bg-[#6366F1]' : 'bg-slate-300'}`} aria-label="Toggle featured">
                        <div className={`w-4 h-4 rounded-full bg-white shadow mx-0.5 transition-transform ${tool.is_featured ? 'translate-x-4' : 'translate-x-0'}`} />
                      </button>
                    </td>
                    <td className="px-4 py-3 text-center">
                      <button onClick={() => toggleMutation.mutate({ id: tool.id, field: 'is_new', value: !tool.is_new })}
                        className={`w-9 h-5 rounded-full transition-colors ${tool.is_new ? 'bg-green-500' : 'bg-slate-300'}`} aria-label="Toggle new">
                        <div className={`w-4 h-4 rounded-full bg-white shadow mx-0.5 transition-transform ${tool.is_new ? 'translate-x-4' : 'translate-x-0'}`} />
                      </button>
                    </td>
                    <td className="px-4 py-3 text-center">
                      <span className={`text-xs px-2 py-1 rounded-full font-medium ${tool.is_active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                        {tool.is_active ? 'Active' : 'Inactive'}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-right">
                      <div className="flex items-center justify-end gap-2">
                        <Link to={`/tools/${tool.id}/edit`} className="p-1.5 text-slate-400 hover:text-[#6366F1] hover:bg-indigo-50 rounded-lg" aria-label="Edit">
                          <Edit size={16} />
                        </Link>
                        <button
                          onClick={() => window.confirm('Delete this tool?') && deleteMutation.mutate(tool.id)}
                          className="p-1.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg" aria-label="Delete"
                        >
                          <Trash2 size={16} />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {data?.total > 20 && (
          <div className="flex items-center justify-between px-4 py-3 border-t border-slate-200">
            <p className="text-sm text-slate-500">Showing {(page-1)*20+1}–{Math.min(page*20, data.total)} of {data.total}</p>
            <div className="flex gap-2">
              <button onClick={() => setPage(p => Math.max(1, p-1))} disabled={page===1} className="px-3 py-1.5 border rounded text-sm disabled:opacity-40">Prev</button>
              <button onClick={() => setPage(p => p+1)} disabled={page*20 >= data.total} className="px-3 py-1.5 border rounded text-sm disabled:opacity-40">Next</button>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
