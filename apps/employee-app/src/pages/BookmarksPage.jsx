import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import ToolCard from '../components/ToolCard'
import SkeletonCard from '../components/SkeletonCard'
import { Bookmark } from 'lucide-react'
import { Link } from 'react-router-dom'

export default function BookmarksPage() {
  const { data, isLoading } = useQuery({
    queryKey: ['bookmarks'],
    queryFn: () => api.get('/bookmarks').then(r => r.data.bookmarks),
  })

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 pb-24">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">My Bookmarks</h1>
        <p className="text-slate-500 text-sm mt-1">{data?.length || 0} saved tools</p>
      </div>

      {isLoading ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {Array(6).fill(0).map((_, i) => <SkeletonCard key={i} />)}
        </div>
      ) : data?.length === 0 ? (
        <div className="text-center py-20">
          <Bookmark size={48} className="text-slate-300 mx-auto mb-4" />
          <p className="text-slate-500 text-lg mb-2">No bookmarks yet</p>
          <p className="text-slate-400 text-sm mb-6">Save tools you'd like to revisit</p>
          <Link to="/tools" className="bg-[#6366F1] text-white px-6 py-2 rounded-lg text-sm font-medium hover:bg-indigo-600">Browse Tools</Link>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {data?.map(b => b.tools && (
            <ToolCard key={b.tools.id} tool={b.tools} isBookmarked={true} />
          ))}
        </div>
      )}
    </div>
  )
}
