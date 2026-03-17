import { Link } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import ToolCard from '../components/ToolCard'
import SkeletonCard from '../components/SkeletonCard'
import { ArrowRight, Code2, PenLine, Palette, Zap, Search, Video, BarChart2, Megaphone, Users, Headphones } from 'lucide-react'

const CATEGORY_ICON_MAP = {
  writing: PenLine,
  coding: Code2,
  design: Palette,
  productivity: Zap,
  research: Search,
  'video-audio': Video,
  'data-analytics': BarChart2,
  marketing: Megaphone,
  'hr-recruitment': Users,
  'customer-support': Headphones,
}

export default function HomePage() {
  const { data: categories, isLoading: catLoading } = useQuery({
    queryKey: ['categories'],
    queryFn: () => api.get('/categories').then(r => r.data),
  })

  const { data: featuredData, isLoading: featuredLoading } = useQuery({
    queryKey: ['tools', 'featured'],
    queryFn: () => api.get('/tools?sort=newest&limit=6').then(r => r.data.tools?.filter(t => t.is_featured)?.slice(0, 6) || r.data.tools?.slice(0, 6)),
  })

  const { data: newArrivalsData, isLoading: newLoading } = useQuery({
    queryKey: ['tools', 'new'],
    queryFn: () => api.get('/tools?sort=newest&limit=6').then(r => r.data.tools?.slice(0, 6)),
  })

  const { data: bookmarksData } = useQuery({
    queryKey: ['bookmarks'],
    queryFn: () => api.get('/bookmarks').then(r => r.data.bookmarks),
  })

  const bookmarkedIds = new Set(bookmarksData?.map(b => b.tools?.id) || [])

  return (
    <div className="pb-20">
      {/* Hero */}
      <div className="bg-[#0F172A] text-white py-16 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">
            Discover the Right <span className="text-[#6366F1]">AI Tool</span><br />for Every Task
          </h1>
          <p className="text-slate-400 text-lg mb-8 max-w-2xl mx-auto">
            Your company's curated directory of 55+ AI tools. Browse, compare, bookmark, and share with your team.
          </p>
          <div className="flex gap-3 justify-center">
            <Link to="/tools" className="bg-[#6366F1] hover:bg-indigo-600 text-white font-semibold px-6 py-3 rounded-xl transition-colors">
              Browse All Tools →
            </Link>
            <Link to="/compare" className="border border-slate-600 hover:border-slate-500 text-slate-300 hover:text-white px-6 py-3 rounded-xl transition-colors">
              Compare Tools
            </Link>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Categories */}
        <section className="py-12">
          <div className="flex items-center justify-between mb-6">
            <h2 className="text-xl font-bold text-slate-900">Browse by Category</h2>
            <Link to="/tools" className="text-[#6366F1] text-sm font-medium hover:underline flex items-center gap-1">View all <ArrowRight size={14} /></Link>
          </div>
          {catLoading ? (
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-4">
              {Array(10).fill(0).map((_, i) => (
                <div key={i} className="bg-white rounded-xl border border-slate-200 p-4 animate-pulse">
                  <div className="w-10 h-10 bg-slate-200 rounded-lg mb-3" />
                  <div className="h-4 bg-slate-200 rounded mb-1 w-3/4" />
                  <div className="h-3 bg-slate-200 rounded w-1/2" />
                </div>
              ))}
            </div>
          ) : (
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-4">
              {categories?.map(cat => {
                const Icon = CATEGORY_ICON_MAP[cat.slug] || Zap
                return (
                  <Link
                    key={cat.id}
                    to={`/category/${cat.slug}`}
                    className="bg-white rounded-xl border border-slate-200 p-4 hover:shadow-md hover:border-[#6366F1] transition-all group"
                  >
                    <div className="w-10 h-10 rounded-lg bg-indigo-50 group-hover:bg-[#6366F1] flex items-center justify-center mb-3 transition-colors">
                      <Icon size={20} className="text-[#6366F1] group-hover:text-white transition-colors" />
                    </div>
                    <p className="font-medium text-slate-900 text-sm mb-0.5">{cat.name}</p>
                    <p className="text-xs text-slate-500">{cat.tools?.[0]?.count || 0} tools</p>
                  </Link>
                )
              })}
            </div>
          )}
        </section>

        {/* Featured Tools */}
        <section className="py-8 border-t border-slate-200">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h2 className="text-xl font-bold text-slate-900">Featured Tools</h2>
              <p className="text-slate-500 text-sm">Hand-picked by your admin team</p>
            </div>
            <Link to="/tools" className="text-[#6366F1] text-sm font-medium hover:underline flex items-center gap-1">View all <ArrowRight size={14} /></Link>
          </div>
          {featuredLoading ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {Array(6).fill(0).map((_, i) => <SkeletonCard key={i} />)}
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {featuredData?.map(tool => (
                <ToolCard key={tool.id} tool={tool} isBookmarked={bookmarkedIds.has(tool.id)} />
              ))}
            </div>
          )}
        </section>

        {/* New Arrivals */}
        <section className="py-8 border-t border-slate-200">
          <div className="flex items-center justify-between mb-6">
            <div>
              <h2 className="text-xl font-bold text-slate-900">New Arrivals</h2>
              <p className="text-slate-500 text-sm">Recently added to the directory</p>
            </div>
            <Link to="/tools?sort=newest" className="text-[#6366F1] text-sm font-medium hover:underline flex items-center gap-1">View all <ArrowRight size={14} /></Link>
          </div>
          {newLoading ? (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {Array(6).fill(0).map((_, i) => <SkeletonCard key={i} />)}
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {newArrivalsData?.map(tool => (
                <ToolCard key={tool.id} tool={tool} isBookmarked={bookmarkedIds.has(tool.id)} />
              ))}
            </div>
          )}
        </section>
      </div>
    </div>
  )
}
