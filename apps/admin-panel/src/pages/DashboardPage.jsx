import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import { Wrench, Tag, Star, TrendingUp } from 'lucide-react'

export default function DashboardPage() {
  const { data: stats, isLoading } = useQuery({
    queryKey: ['admin', 'stats'],
    queryFn: () => api.get('/admin/stats').then(r => r.data),
  })

  const STAT_CARDS = [
    { label: 'Total Tools', value: stats?.totalTools, icon: Wrench, color: 'bg-indigo-500' },
    { label: 'Categories', value: stats?.totalCategories, icon: Tag, color: 'bg-cyan-500' },
    { label: 'Pending Reviews', value: stats?.pendingReviews, icon: Star, color: 'bg-yellow-500' },
    { label: 'New This Month', value: stats?.newThisMonth, icon: TrendingUp, color: 'bg-green-500' },
  ]

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-2">Dashboard</h1>
      <p className="text-slate-500 text-sm mb-8">Welcome to ITARIUM AI Hub Admin Panel</p>

      {isLoading ? (
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
          {Array(4).fill(0).map((_, i) => <div key={i} className="bg-white rounded-xl border border-slate-200 p-5 animate-pulse h-28" />)}
        </div>
      ) : (
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
          {STAT_CARDS.map(({ label, value, icon: Icon, color }) => (
            <div key={label} className="bg-white rounded-xl border border-slate-200 p-5">
              <div className={`w-10 h-10 ${color} rounded-lg flex items-center justify-center mb-3`}>
                <Icon size={20} className="text-white" />
              </div>
              <p className="text-2xl font-bold text-slate-900">{value ?? '–'}</p>
              <p className="text-sm text-slate-500">{label}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
