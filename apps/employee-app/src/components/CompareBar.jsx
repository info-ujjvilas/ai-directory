import { Link } from 'react-router-dom'
import { useCompare } from '../context/CompareContext'
import { X } from 'lucide-react'

export default function CompareBar() {
  const { compareList, removeFromCompare, clearCompare } = useCompare()

  if (compareList.length === 0) return null

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-[#0F172A] border-t border-slate-700 z-40 shadow-2xl">
      <div className="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <span className="text-white text-sm font-medium">Compare ({compareList.length}/3):</span>
          <div className="flex items-center gap-2">
            {compareList.map(tool => (
              <div key={tool.id} className="flex items-center gap-1 bg-slate-700 rounded-lg px-3 py-1.5">
                <span className="text-white text-sm">{tool.name}</span>
                <button onClick={() => removeFromCompare(tool.id)} className="text-slate-400 hover:text-white ml-1" aria-label={`Remove ${tool.name}`}>
                  <X size={14} />
                </button>
              </div>
            ))}
          </div>
        </div>
        <div className="flex items-center gap-2">
          <button onClick={clearCompare} className="text-slate-400 hover:text-white text-sm px-3 py-1.5">Clear</button>
          <Link
            to={`/compare?ids=${compareList.map(t => t.id).join(',')}`}
            className="bg-[#6366F1] hover:bg-indigo-600 text-white px-4 py-1.5 rounded-lg text-sm font-medium transition-colors"
          >
            Compare Now →
          </Link>
        </div>
      </div>
    </div>
  )
}
