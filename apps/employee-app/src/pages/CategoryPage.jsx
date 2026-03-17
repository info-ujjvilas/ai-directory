import { useParams } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import ToolCard from '../components/ToolCard'
import SkeletonCard from '../components/SkeletonCard'

export default function CategoryPage() {
  const { slug } = useParams()

  const { data, isLoading } = useQuery({
    queryKey: ['tools', { category: slug }],
    queryFn: () => api.get(`/tools?category=${slug}&limit=50`).then(r => r.data),
  })

  const { data: categories } = useQuery({
    queryKey: ['categories'],
    queryFn: () => api.get('/categories').then(r => r.data),
  })

  const { data: bookmarksData } = useQuery({
    queryKey: ['bookmarks'],
    queryFn: () => api.get('/bookmarks').then(r => r.data.bookmarks),
  })

  const bookmarkedIds = new Set(bookmarksData?.map(b => b.tools?.id) || [])
  const category = categories?.find(c => c.slug === slug)

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 pb-24">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">{category?.name || 'Category'} Tools</h1>
        {category?.description && <p className="text-slate-500 text-sm mt-1">{category.description}</p>}
      </div>

      {isLoading ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {Array(6).fill(0).map((_, i) => <SkeletonCard key={i} />)}
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {data?.tools?.map(tool => (
            <ToolCard key={tool.id} tool={tool} isBookmarked={bookmarkedIds.has(tool.id)} />
          ))}
        </div>
      )}
    </div>
  )
}
