import { useSearchParams, Link } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import { Check, X, ExternalLink } from 'lucide-react'

export default function ComparePage() {
  const [searchParams] = useSearchParams()
  const ids = searchParams.get('ids') || ''

  const { data, isLoading } = useQuery({
    queryKey: ['compare', ids],
    queryFn: () => api.get(`/compare?ids=${ids}`).then(r => r.data.tools),
    enabled: ids.length > 0,
  })

  if (!ids) return (
    <div className="max-w-5xl mx-auto px-4 py-20 text-center">
      <p className="text-slate-500 text-lg mb-4">No tools selected for comparison</p>
      <Link to="/tools" className="text-[#6366F1] hover:underline">Browse Tools →</Link>
    </div>
  )

  if (isLoading) return (
    <div className="max-w-5xl mx-auto px-4 py-12 animate-pulse">
      <div className="grid grid-cols-3 gap-4">
        {Array(3).fill(0).map((_, i) => <div key={i} className="h-40 bg-slate-200 rounded-xl" />)}
      </div>
    </div>
  )

  const tools = data || []
  if (!tools.length) return (
    <div className="text-center py-20">
      <p className="text-slate-500">Tools not found</p>
      <Link to="/tools" className="text-[#6366F1] mt-4 inline-block">← Browse Tools</Link>
    </div>
  )

  const shareUrl = `${window.location.origin}/compare?ids=${ids}`

  return (
    <div className="max-w-6xl mx-auto px-4 py-8 pb-24 overflow-x-auto">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Compare Tools</h1>
        <button onClick={() => navigator.clipboard.writeText(shareUrl)} className="text-sm text-[#6366F1] border border-indigo-200 px-3 py-1.5 rounded-lg hover:bg-indigo-50">
          Copy Share Link
        </button>
      </div>

      <div className="min-w-max">
        {/* Header row */}
        <div className="grid gap-4 mb-6" style={{ gridTemplateColumns: `180px repeat(${tools.length}, 1fr)` }}>
          <div />
          {tools.map(tool => (
            <div key={tool.id} className="bg-white rounded-xl border border-slate-200 p-5 text-center">
              {tool.logo_url
                ? <img src={tool.logo_url} alt={tool.name} className="w-14 h-14 rounded-xl mx-auto mb-3 object-cover border border-slate-100" />
                : <div className="w-14 h-14 rounded-xl bg-gradient-to-br from-[#6366F1] to-[#06B6D4] flex items-center justify-center text-white text-xl font-bold mx-auto mb-3">{tool.name[0]}</div>
              }
              <h3 className="font-bold text-slate-900 mb-1">{tool.name}</h3>
              <p className="text-xs text-slate-500 line-clamp-2 mb-3">{tool.tagline}</p>
              {tool.website_url && (
                <a href={tool.website_url} target="_blank" rel="noopener noreferrer" className="text-xs text-[#6366F1] flex items-center justify-center gap-1">
                  Visit <ExternalLink size={10} />
                </a>
              )}
            </div>
          ))}
        </div>

        {/* Category */}
        <CompareRow label="Category" tools={tools} render={t => t.categories?.name || '-'} />

        {/* Platforms */}
        <CompareRow label="Platforms" tools={tools} render={t => (t.platforms || []).join(', ') || '-'} />

        {/* Rating */}
        <CompareRow label="Rating" tools={tools} render={t => t.avg_rating ? `${parseFloat(t.avg_rating).toFixed(1)} ★` : 'No ratings'} />

        {/* Starting Price */}
        <CompareRow label="Starting Price" tools={tools} render={t => {
          const freeTier = t.pricing_tiers?.find(pt => pt.price_label?.toLowerCase().includes('free') || pt.tier_name?.toLowerCase() === 'free')
          return freeTier ? 'Free tier available' : t.pricing_tiers?.[0]?.price_label || 'Contact for pricing'
        }} />

        {/* Features */}
        <div className="grid gap-4 mb-2" style={{ gridTemplateColumns: `180px repeat(${tools.length}, 1fr)` }}>
          <div className="py-3 text-sm font-semibold text-slate-700 border-t border-slate-100 flex items-center">Features</div>
          {tools.map(tool => (
            <div key={tool.id} className="py-3 border-t border-slate-100">
              <ul className="space-y-1">
                {(tool.tool_features || []).slice(0, 6).map((f, i) => (
                  <li key={i} className="flex items-start gap-2 text-xs text-slate-600">
                    <Check size={12} className="text-green-500 flex-shrink-0 mt-0.5" />
                    {f.feature}
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}

function CompareRow({ label, tools, render }) {
  return (
    <div className="grid gap-4 mb-2" style={{ gridTemplateColumns: `180px repeat(${tools.length}, 1fr)` }}>
      <div className="py-3 text-sm font-semibold text-slate-700 border-t border-slate-100 flex items-center">{label}</div>
      {tools.map(tool => (
        <div key={tool.id} className="py-3 border-t border-slate-100 text-sm text-slate-600">{render(tool)}</div>
      ))}
    </div>
  )
}
