import { Link } from 'react-router-dom'
import { Star, Bookmark, BookmarkCheck, Plus } from 'lucide-react'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import { useCompare } from '../context/CompareContext'
import api from '../lib/api'

const PRICING_BADGE = {
  free: 'bg-green-100 text-green-700 border-green-200',
  freemium: 'bg-blue-100 text-blue-700 border-blue-200',
  paid: 'bg-orange-100 text-orange-700 border-orange-200',
  enterprise: 'bg-purple-100 text-purple-700 border-purple-200',
}

function getPricingType(tiers) {
  if (!tiers || tiers.length === 0) return 'paid'
  const labels = tiers.map(t => (t.price_label || t.tier_name || '').toLowerCase())
  if (labels.some(l => l.includes('enterprise') || l.includes('custom'))) return 'enterprise'
  if (labels.some(l => l.includes('free') && labels.some(l2 => !l2.includes('free')))) return 'freemium'
  if (labels.every(l => l.includes('free') || l === '$0')) return 'free'
  return 'paid'
}

export default function ToolCard({ tool, isBookmarked }) {
  const queryClient = useQueryClient()
  const { addToCompare, compareList } = useCompare()
  const inCompare = compareList.some(t => t.id === tool.id)

  const bookmarkMutation = useMutation({
    mutationFn: () => isBookmarked
      ? api.delete(`/bookmarks/${tool.id}`)
      : api.post(`/bookmarks/${tool.id}`),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['bookmarks'] }),
  })

  const pricingType = getPricingType(tool.pricing_tiers)

  return (
    <div className="bg-white rounded-xl border border-slate-200 hover:shadow-lg transition-all duration-200 group overflow-hidden">
      <div className="p-5">
        <div className="flex items-start justify-between mb-3">
          <div className="flex items-center gap-3">
            {tool.logo_url
              ? <img src={tool.logo_url} alt={tool.name} className="w-12 h-12 rounded-xl object-cover border border-slate-100" />
              : <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-[#6366F1] to-[#06B6D4] flex items-center justify-center text-white font-bold text-lg">{tool.name[0]}</div>
            }
            <div>
              <span className={`text-xs px-2 py-0.5 rounded-full border font-medium ${PRICING_BADGE[pricingType]}`}>
                {pricingType.charAt(0).toUpperCase() + pricingType.slice(1)}
              </span>
            </div>
          </div>
          <div className="flex items-center gap-1">
            <button
              onClick={() => addToCompare(tool)}
              disabled={inCompare || compareList.length >= 3}
              className={`p-1.5 rounded-lg text-slate-400 hover:text-[#6366F1] transition-colors ${inCompare ? 'text-[#6366F1]' : ''}`}
              aria-label="Add to compare"
              title={inCompare ? 'Added to compare' : 'Add to compare'}
            >
              <Plus size={16} />
            </button>
            <button
              onClick={() => bookmarkMutation.mutate()}
              className={`p-1.5 rounded-lg transition-colors ${isBookmarked ? 'text-[#6366F1]' : 'text-slate-400 hover:text-[#6366F1]'}`}
              aria-label={isBookmarked ? 'Remove bookmark' : 'Add bookmark'}
            >
              {isBookmarked ? <BookmarkCheck size={16} /> : <Bookmark size={16} />}
            </button>
          </div>
        </div>

        <Link to={`/tools/${tool.slug}`}>
          <h3 className="font-semibold text-slate-900 group-hover:text-[#6366F1] transition-colors mb-1">{tool.name}</h3>
          <p className="text-sm text-slate-500 line-clamp-2 mb-3">{tool.tagline}</p>
        </Link>

        <div className="flex items-center justify-between">
          <div className="flex items-center gap-1">
            <Star size={14} className="text-yellow-400 fill-yellow-400" />
            <span className="text-sm font-medium text-slate-700">{tool.avg_rating ? parseFloat(tool.avg_rating).toFixed(1) : 'New'}</span>
            {tool.review_count > 0 && <span className="text-xs text-slate-400">({tool.review_count})</span>}
          </div>
          {tool.categories && (
            <Link to={`/category/${tool.categories.slug}`} className="text-xs text-slate-500 bg-slate-100 px-2 py-1 rounded-full hover:bg-slate-200 transition-colors">
              {tool.categories.name}
            </Link>
          )}
        </div>
      </div>
    </div>
  )
}
