import { Link, useLocation } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { LayoutDashboard, Wrench, Tag, Star, Users, LogOut } from 'lucide-react'

const NAV_ITEMS = [
  { to: '/', label: 'Dashboard', icon: LayoutDashboard },
  { to: '/tools', label: 'Tools', icon: Wrench },
  { to: '/categories', label: 'Categories', icon: Tag },
  { to: '/reviews', label: 'Reviews', icon: Star },
  { to: '/users', label: 'Users', icon: Users },
]

export default function Sidebar() {
  const { signOut, profile } = useAuth()
  const location = useLocation()

  return (
    <aside className="fixed left-0 top-0 h-full w-64 bg-[#0F172A] text-white flex flex-col z-30">
      <div className="p-6 border-b border-slate-700">
        <div className="flex items-center gap-2 mb-1">
          <div className="w-8 h-8 bg-[#6366F1] rounded-lg flex items-center justify-center font-bold text-sm">AI</div>
          <span className="font-bold">ITARIUM <span className="text-[#6366F1]">Admin</span></span>
        </div>
        <p className="text-xs text-slate-500 ml-10">Management Panel</p>
      </div>

      <nav className="flex-1 p-4 space-y-1">
        {NAV_ITEMS.map(({ to, label, icon: Icon }) => {
          const active = to === '/' ? location.pathname === '/' : location.pathname.startsWith(to)
          return (
            <Link
              key={to}
              to={to}
              className={`flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors ${active ? 'bg-[#6366F1] text-white' : 'text-slate-400 hover:text-white hover:bg-slate-700'}`}
            >
              <Icon size={18} />
              {label}
            </Link>
          )
        })}
      </nav>

      <div className="p-4 border-t border-slate-700">
        <div className="flex items-center gap-2 mb-3">
          <div className="w-8 h-8 rounded-full bg-[#6366F1] flex items-center justify-center text-sm font-medium">
            {profile?.full_name?.[0] || 'A'}
          </div>
          <div>
            <p className="text-sm font-medium text-white">{profile?.full_name || 'Admin'}</p>
            <p className="text-xs text-slate-500">Administrator</p>
          </div>
        </div>
        <button onClick={signOut} className="w-full flex items-center gap-2 px-3 py-2 rounded-lg text-slate-400 hover:text-red-400 hover:bg-red-900/20 text-sm transition-colors">
          <LogOut size={16} /> Sign Out
        </button>
      </div>
    </aside>
  )
}
