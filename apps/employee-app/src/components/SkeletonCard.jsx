export default function SkeletonCard() {
  return (
    <div className="bg-white rounded-xl border border-slate-200 p-5 animate-pulse">
      <div className="flex items-start justify-between mb-3">
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 bg-slate-200 rounded-xl" />
          <div className="w-16 h-5 bg-slate-200 rounded-full" />
        </div>
      </div>
      <div className="h-5 bg-slate-200 rounded mb-2 w-3/4" />
      <div className="h-4 bg-slate-200 rounded mb-1" />
      <div className="h-4 bg-slate-200 rounded mb-3 w-2/3" />
      <div className="flex justify-between">
        <div className="h-4 bg-slate-200 rounded w-16" />
        <div className="h-4 bg-slate-200 rounded w-20" />
      </div>
    </div>
  )
}
