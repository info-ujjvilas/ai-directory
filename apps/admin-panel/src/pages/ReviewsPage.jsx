import { useState } from 'react'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import api from '../lib/api'
import { Check, X, Star } from 'lucide-react'

export default function ReviewsPage() {
  const [status, setStatus] = useState('pending')
  const qc = useQueryClient()

  const { data, isLoading } = useQuery({
    queryKey: ['admin', 'reviews', status],
    queryFn: () => api.get(`/admin/reviews?status=${status}&limit=50`).then(r => r.data),
  })

  const updateMutation = useMutation({
    mutationFn: ({ id, status }) => api.put(`/admin/reviews/${id}`, { status }),
    onSuccess: () => qc.invalidateQueries({ queryKey: ['admin', 'reviews'] }),
  })

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">Reviews Moderation</h1>

      <div className="flex gap-2 mb-6">
        {['pending', 'approved', 'rejected'].map(s => (
          <button key={s} onClick={() => setStatus(s)}
            className={`px-4 py-2 rounded-lg text-sm font-medium capitalize transition-colors ${status === s ? 'bg-[#6366F1] text-white' : 'border border-slate-300 text-slate-600 hover:bg-slate-50'}`}>
            {s}
          </button>
        ))}
      </div>

      <div className="space-y-3">
        {isLoading ? Array(5).fill(0).map((_, i) => <div key={i} className="bg-white rounded-xl border border-slate-200 p-5 h-24 animate-pulse" />) :
          data?.reviews?.length === 0 ? (
            <div className="text-center py-16 text-slate-400">No {status} reviews</div>
          ) : data?.reviews?.map(review => (
            <div key={review.id} className="bg-white rounded-xl border border-slate-200 p-5">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <div className="flex items-center gap-3 mb-2">
                    <div className="flex">{[1,2,3,4,5].map(s => <Star key={s} size={14} className={s <= review.rating ? 'text-yellow-400 fill-yellow-400' : 'text-slate-200'} />)}</div>
                    <span className="text-sm font-medium text-slate-900">{review.profiles?.full_name || review.profiles?.email}</span>
                    <span className="text-slate-400">•</span>
                    <span className="text-sm text-[#6366F1]">{review.tools?.name}</span>
                    <span className="text-xs text-slate-400">{new Date(review.created_at).toLocaleDateString()}</span>
                  </div>
                  {review.comment && <p className="text-sm text-slate-600">{review.comment}</p>}
                </div>
                {status === 'pending' && (
                  <div className="flex items-center gap-2 ml-4">
                    <button onClick={() => updateMutation.mutate({ id: review.id, status: 'approved' })}
                      className="flex items-center gap-1.5 bg-green-600 hover:bg-green-700 text-white px-3 py-1.5 rounded-lg text-xs font-medium">
                      <Check size={13} /> Approve
                    </button>
                    <button onClick={() => updateMutation.mutate({ id: review.id, status: 'rejected' })}
                      className="flex items-center gap-1.5 bg-red-600 hover:bg-red-700 text-white px-3 py-1.5 rounded-lg text-xs font-medium">
                      <X size={13} /> Reject
                    </button>
                  </div>
                )}
              </div>
            </div>
          ))}
      </div>
    </div>
  )
}
