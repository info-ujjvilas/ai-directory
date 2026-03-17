import { useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import api from '../lib/api'
import { Star, Bookmark, BookmarkCheck, ExternalLink, Check } from 'lucide-react'

export default function ToolDetailPage() {
  const { slug } = useParams()
  const [activeTab, setActiveTab] = useState('overview')
  const [rating, setRating] = useState(0)
  const [comment, setComment] = useState('')
  const [reviewError, setReviewError] = useState('')
  const queryClient = useQueryClient()

  const { data: tool, isLoading } = useQuery({
    queryKey: ['tool', slug],
    queryFn: () => api.get(`/tools/${slug}`).then(r => r.data),
  })

  const { data: bookmarksData } = useQuery({
    queryKey: ['bookmarks'],
    queryFn: () => api.get('/bookmarks').then(r => r.data.bookmarks),
  })

  const isBookmarked = bookmarksData?.some(b => b.tools?.id === tool?.id)

  const bookmarkMutation = useMutation({
    mutationFn: () => isBookmarked
      ? api.delete(`/bookmarks/${tool.id}`)
      : api.post(`/bookmarks/${tool.id}`),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['bookmarks'] }),
  })

  const reviewMutation = useMutation({
    mutationFn: () => api.post('/reviews', { tool_id: tool.id, rating, comment }),
    onSuccess: () => {
      setRating(0); setComment(''); setReviewError('')
      queryClient.invalidateQueries({ queryKey: ['tool', slug] })
    },
    onError: (err) => setReviewError(err.response?.data?.error || 'Failed to submit review'),
  })

  if (isLoading) return (
    <div className="max-w-4xl mx-auto px-4 py-12 animate-pulse">
      <div className="h-8 bg-slate-200 rounded w-1/3 mb-4" />
      <div className="h-4 bg-slate-200 rounded w-2/3 mb-8" />
      <div className="h-64 bg-slate-200 rounded" />
    </div>
  )

  if (!tool) return (
    <div className="text-center py-20">
      <p className="text-slate-500">Tool not found</p>
      <Link to="/tools" className="text-[#6366F1] mt-4 inline-block">← Back to Tools</Link>
    </div>
  )

  const approvedReviews = tool.reviews?.filter(r => r.status === 'approved') || []

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-8 pb-24">
      {/* Header */}
      <div className="bg-white rounded-2xl border border-slate-200 p-6 mb-6">
        <div className="flex items-start gap-4">
          {tool.logo_url
            ? <img src={tool.logo_url} alt={tool.name} className="w-16 h-16 rounded-xl border border-slate-200 object-cover" />
            : <div className="w-16 h-16 rounded-xl bg-gradient-to-br from-[#6366F1] to-[#06B6D4] flex items-center justify-center text-white text-2xl font-bold">{tool.name[0]}</div>
          }
          <div className="flex-1">
            <div className="flex items-start justify-between">
              <div>
                <h1 className="text-2xl font-bold text-slate-900 mb-1">{tool.name}</h1>
                <p className="text-slate-500 mb-2">{tool.tagline}</p>
                <div className="flex items-center flex-wrap gap-2">
                  {tool.categories && (
                    <Link to={`/category/${tool.categories.slug}`} className="text-xs bg-slate-100 text-slate-600 px-2 py-1 rounded-full hover:bg-slate-200">
                      {tool.categories.name}
                    </Link>
                  )}
                  {tool.tool_tags?.map(tt => (
                    <span key={tt.tags?.id} className="text-xs bg-indigo-50 text-[#6366F1] px-2 py-1 rounded-full">
                      {tt.tags?.name}
                    </span>
                  ))}
                  {tool.platforms?.map(p => (
                    <span key={p} className="text-xs border border-slate-200 text-slate-500 px-2 py-1 rounded-full">{p}</span>
                  ))}
                </div>
              </div>
              <div className="flex items-center gap-2">
                <button
                  onClick={() => bookmarkMutation.mutate()}
                  className={`flex items-center gap-2 px-4 py-2 rounded-lg border text-sm font-medium transition-colors ${isBookmarked ? 'bg-indigo-50 border-indigo-200 text-[#6366F1]' : 'border-slate-300 text-slate-700 hover:bg-slate-50'}`}
                >
                  {isBookmarked ? <BookmarkCheck size={16} /> : <Bookmark size={16} />}
                  {isBookmarked ? 'Saved' : 'Save'}
                </button>
                {tool.website_url && (
                  <a href={tool.website_url} target="_blank" rel="noopener noreferrer"
                    className="flex items-center gap-2 bg-[#6366F1] hover:bg-indigo-600 text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors"
                  >
                    Visit Site <ExternalLink size={14} />
                  </a>
                )}
              </div>
            </div>
          </div>
        </div>
        {/* Rating */}
        {tool.avg_rating > 0 && (
          <div className="flex items-center gap-2 mt-4 pt-4 border-t border-slate-100">
            <div className="flex">
              {[1,2,3,4,5].map(s => (
                <Star key={s} size={16} className={s <= Math.round(tool.avg_rating) ? 'text-yellow-400 fill-yellow-400' : 'text-slate-300'} />
              ))}
            </div>
            <span className="font-semibold text-slate-900">{parseFloat(tool.avg_rating).toFixed(1)}</span>
            <span className="text-slate-500 text-sm">({tool.review_count} reviews)</span>
          </div>
        )}
      </div>

      {/* Tabs */}
      <div className="border-b border-slate-200 mb-6">
        <nav className="flex gap-0" role="tablist">
          {['overview', 'features', 'pricing', 'reviews'].map(tab => (
            <button
              key={tab}
              role="tab"
              aria-selected={activeTab === tab}
              onClick={() => setActiveTab(tab)}
              className={`px-5 py-3 text-sm font-medium border-b-2 transition-colors capitalize ${activeTab === tab ? 'border-[#6366F1] text-[#6366F1]' : 'border-transparent text-slate-500 hover:text-slate-700'}`}
            >
              {tab}
            </button>
          ))}
        </nav>
      </div>

      {/* Tab Content */}
      {activeTab === 'overview' && (
        <div className="bg-white rounded-xl border border-slate-200 p-6">
          <h2 className="font-semibold text-slate-900 text-lg mb-4">About {tool.name}</h2>
          <p className="text-slate-600 leading-relaxed whitespace-pre-wrap">{tool.description}</p>
        </div>
      )}

      {activeTab === 'features' && (
        <div className="bg-white rounded-xl border border-slate-200 p-6">
          <h2 className="font-semibold text-slate-900 text-lg mb-4">Key Features</h2>
          <ul className="space-y-3">
            {(tool.tool_features || []).sort((a,b) => a.sort_order - b.sort_order).map(f => (
              <li key={f.id} className="flex items-start gap-3">
                <div className="w-5 h-5 rounded-full bg-indigo-100 flex-shrink-0 flex items-center justify-center mt-0.5">
                  <Check size={12} className="text-[#6366F1]" />
                </div>
                <span className="text-slate-600">{f.feature}</span>
              </li>
            ))}
          </ul>
        </div>
      )}

      {activeTab === 'pricing' && (
        <div>
          <h2 className="font-semibold text-slate-900 text-lg mb-4">Pricing Plans</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {(tool.pricing_tiers || []).sort((a,b) => a.sort_order - b.sort_order).map(tier => (
              <div key={tier.id} className={`bg-white rounded-xl border-2 p-5 relative ${tier.is_popular ? 'border-[#6366F1]' : 'border-slate-200'}`}>
                {tier.is_popular && (
                  <span className="absolute -top-3 left-1/2 -translate-x-1/2 bg-[#6366F1] text-white text-xs font-semibold px-3 py-1 rounded-full">Most Popular</span>
                )}
                <h3 className="font-bold text-slate-900 mb-1">{tier.tier_name}</h3>
                <div className="mb-1">
                  <span className="text-2xl font-bold text-slate-900">{tier.price_label}</span>
                  {tier.billing_cycle && <span className="text-slate-500 text-sm">/{tier.billing_cycle}</span>}
                </div>
                <ul className="space-y-2 mt-4">
                  {tier.features?.map((f, i) => (
                    <li key={i} className="flex items-start gap-2 text-sm text-slate-600">
                      <Check size={14} className="text-green-500 flex-shrink-0 mt-0.5" />
                      {f}
                    </li>
                  ))}
                </ul>
                {tool.website_url && (
                  <a href={tool.website_url} target="_blank" rel="noopener noreferrer"
                    className={`mt-5 block text-center py-2 rounded-lg text-sm font-medium transition-colors ${tier.is_popular ? 'bg-[#6366F1] text-white hover:bg-indigo-600' : 'border border-slate-300 text-slate-700 hover:bg-slate-50'}`}
                  >
                    Get Started
                  </a>
                )}
              </div>
            ))}
          </div>
        </div>
      )}

      {activeTab === 'reviews' && (
        <div className="space-y-6">
          {/* Submit Review */}
          <div className="bg-white rounded-xl border border-slate-200 p-6">
            <h3 className="font-semibold text-slate-900 mb-4">Write a Review</h3>
            {reviewError && <p className="text-red-600 text-sm mb-3">{reviewError}</p>}
            <div className="mb-4">
              <p className="text-sm text-slate-600 mb-2">Your Rating</p>
              <div className="flex gap-1">
                {[1,2,3,4,5].map(s => (
                  <button key={s} onClick={() => setRating(s)} aria-label={`Rate ${s} stars`}>
                    <Star size={24} className={s <= rating ? 'text-yellow-400 fill-yellow-400' : 'text-slate-300'} />
                  </button>
                ))}
              </div>
            </div>
            <textarea
              value={comment}
              onChange={e => setComment(e.target.value)}
              placeholder="Share your experience with this tool..."
              className="w-full border border-slate-200 rounded-lg p-3 text-sm text-slate-700 focus:outline-none focus:border-[#6366F1] resize-none"
              rows={4}
            />
            <button
              onClick={() => reviewMutation.mutate()}
              disabled={!rating || reviewMutation.isPending}
              className="mt-3 bg-[#6366F1] hover:bg-indigo-600 disabled:opacity-50 text-white px-5 py-2 rounded-lg text-sm font-medium transition-colors"
            >
              {reviewMutation.isPending ? 'Submitting...' : 'Submit Review'}
            </button>
          </div>

          {/* Approved Reviews */}
          {approvedReviews.length === 0 ? (
            <div className="text-center py-10 text-slate-400">No reviews yet. Be the first!</div>
          ) : (
            <div className="space-y-4">
              {approvedReviews.map(review => (
                <div key={review.id} className="bg-white rounded-xl border border-slate-200 p-5">
                  <div className="flex items-start justify-between mb-2">
                    <div className="flex items-center gap-2">
                      <div className="w-8 h-8 rounded-full bg-indigo-100 flex items-center justify-center text-[#6366F1] font-semibold text-sm">
                        {review.profiles?.full_name?.[0] || 'U'}
                      </div>
                      <div>
                        <p className="text-sm font-medium text-slate-900">{review.profiles?.full_name || 'Anonymous'}</p>
                        <p className="text-xs text-slate-500">{new Date(review.created_at).toLocaleDateString()}</p>
                      </div>
                    </div>
                    <div className="flex">
                      {[1,2,3,4,5].map(s => (
                        <Star key={s} size={14} className={s <= review.rating ? 'text-yellow-400 fill-yellow-400' : 'text-slate-200'} />
                      ))}
                    </div>
                  </div>
                  {review.comment && <p className="text-sm text-slate-600">{review.comment}</p>}
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
