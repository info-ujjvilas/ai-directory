import { useState, useEffect } from 'react'
import { useSearchParams } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import ToolCard from '../components/ToolCard'
import SkeletonCard from '../components/SkeletonCard'
import { Filter, ChevronDown, ChevronUp } from 'lucide-react'

const SORT_OPTIONS = [
  { value: 'newest', label: 'Newest' },
  { value: 'most_reviewed', label: 'Most Reviewed' },
  { value: 'alphabetical', label: 'A-Z' },
  { value: 'top_rated', label: 'Top Rated' },
]

export default function ToolsPage() {
  const [searchParams, setSearchParams] = useSearchParams()
  const [showFilters, setShowFilters] = useState(false)
  const [page, setPage] = useState(1)

  const q = searchParams.get('q') || ''
  const category = searchParams.get('category') || ''
  const platform = searchParams.get('platform') || ''
  const sort = searchParams.get('sort') || 'newest'

  const { data: categories } = useQuery({
    queryKey: ['categories'],
    queryFn: () => api.get('/categories').then(r => r.data),
  })

  const { data, isLoading } = useQuery({
    queryKey: ['tools', { q, category, platform, sort, page }],
    queryFn: () => {
      const params = new URLSearchParams()
      if (q) params.set('q', q)
      if (category) params.set('category', category)
      if (platform) params.set('platform', platform)
      params.set('sort', sort)
      params.set('page', page)
      params.set('limit', 12)
      return api.get(`/tools?${params}`).then(r => r.data)
    },
  })

  const { data: bookmarksData } = useQuery({
    queryKey: ['bookmarks'],
    queryFn: () => api.get('/bookmarks').then(r => r.data.bookmarks),
  })

  const bookmarkedIds = new Set(bookmarksData?.map(b => b.tools?.id) || [])

  function updateFilter(key, value) {
    const params = new URLSearchParams(searchParams)
    if (value) params.set(key, value)
    else params.delete(key)
    params.delete('page')
    setPage(1)
    setSearchParams(params)
  }

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 pb-24">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">
            {q ? `Results for "${q}"` : category ? `${category.charAt(0).toUpperCase() + category.slice(1)} Tools` : 'All AI Tools'}
          </h1>
          {data && <p className="text-slate-500 text-sm mt-1">{data.total || data.tools?.length || 0} tools found</p>}
        </div>
        <div className="flex items-center gap-3">
          <button
            onClick={() => setShowFilters(!showFilters)}
            className="flex items-center gap-2 border border-slate-300 text-slate-700 px-3 py-2 rounded-lg text-sm hover:bg-slate-50 md:hidden"
          >
            <Filter size={16} /> Filters {showFilters ? <ChevronUp size={14} /> : <ChevronDown size={14} />}
          </button>
          <select
            value={sort}
            onChange={e => updateFilter('sort', e.target.value)}
            className="border border-slate-300 rounded-lg px-3 py-2 text-sm text-slate-700 bg-white focus:outline-none focus:border-[#6366F1]"
          >
            {SORT_OPTIONS.map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
          </select>
        </div>
      </div>

      <div className="flex gap-6">
        {/* Sidebar */}
        <aside className={`w-56 flex-shrink-0 ${showFilters ? 'block' : 'hidden'} md:block`}>
          <div className="bg-white rounded-xl border border-slate-200 p-4 sticky top-20">
            <h3 className="font-semibold text-slate-900 mb-4">Filters</h3>

            <div className="mb-5">
              <p className="text-xs font-medium text-slate-500 uppercase tracking-wide mb-2">Category</p>
              <div className="space-y-1">
                <button
                  onClick={() => updateFilter('category', '')}
                  className={`w-full text-left text-sm px-2 py-1.5 rounded-lg ${!category ? 'bg-indigo-50 text-[#6366F1] font-medium' : 'text-slate-600 hover:bg-slate-50'}`}
                >
                  All Categories
                </button>
                {categories?.map(cat => (
                  <button
                    key={cat.id}
                    onClick={() => updateFilter('category', cat.slug)}
                    className={`w-full text-left text-sm px-2 py-1.5 rounded-lg ${category === cat.slug ? 'bg-indigo-50 text-[#6366F1] font-medium' : 'text-slate-600 hover:bg-slate-50'}`}
                  >
                    {cat.name}
                  </button>
                ))}
              </div>
            </div>

            <div>
              <p className="text-xs font-medium text-slate-500 uppercase tracking-wide mb-2">Platform</p>
              <div className="space-y-1">
                {['', 'Web', 'API', 'Desktop', 'Mobile'].map(p => (
                  <button
                    key={p || 'all'}
                    onClick={() => updateFilter('platform', p)}
                    className={`w-full text-left text-sm px-2 py-1.5 rounded-lg ${platform === p ? 'bg-indigo-50 text-[#6366F1] font-medium' : 'text-slate-600 hover:bg-slate-50'}`}
                  >
                    {p || 'All Platforms'}
                  </button>
                ))}
              </div>
            </div>
          </div>
        </aside>

        {/* Grid */}
        <div className="flex-1">
          {isLoading ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {Array(12).fill(0).map((_, i) => <SkeletonCard key={i} />)}
            </div>
          ) : data?.tools?.length === 0 ? (
            <div className="text-center py-20">
              <p className="text-slate-400 text-lg mb-2">No tools found</p>
              <p className="text-slate-500 text-sm">Try adjusting your filters or search query</p>
            </div>
          ) : (
            <>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                {data?.tools?.map(tool => (
                  <ToolCard key={tool.id} tool={tool} isBookmarked={bookmarkedIds.has(tool.id)} />
                ))}
              </div>
              {/* Pagination */}
              {data?.total > 12 && (
                <div className="flex items-center justify-center gap-2 mt-8">
                  <button onClick={() => setPage(p => Math.max(1, p - 1))} disabled={page === 1} className="px-4 py-2 border border-slate-300 rounded-lg text-sm disabled:opacity-40 hover:bg-slate-50">Previous</button>
                  <span className="text-sm text-slate-600">Page {page} of {Math.ceil(data.total / 12)}</span>
                  <button onClick={() => setPage(p => p + 1)} disabled={page * 12 >= data.total} className="px-4 py-2 border border-slate-300 rounded-lg text-sm disabled:opacity-40 hover:bg-slate-50">Next</button>
                </div>
              )}
            </>
          )}
        </div>
      </div>
    </div>
  )
}
