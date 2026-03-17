import { useState, useRef, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useQuery } from '@tanstack/react-query'
import api from '../lib/api'
import { Bookmark, ChevronDown, LogOut, User, Search, X } from 'lucide-react'

export default function Navbar() {
  const { user, profile, signOut } = useAuth()
  const navigate = useNavigate()
  const [searchQuery, setSearchQuery] = useState('')
  const [showSearch, setShowSearch] = useState(false)
  const [showUserMenu, setShowUserMenu] = useState(false)
  const [debouncedQuery, setDebouncedQuery] = useState('')
  const searchRef = useRef(null)

  useEffect(() => {
    const timer = setTimeout(() => setDebouncedQuery(searchQuery), 300)
    return () => clearTimeout(timer)
  }, [searchQuery])

  const { data: searchResults } = useQuery({
    queryKey: ['search', debouncedQuery],
    queryFn: () => api.get(`/search?q=${debouncedQuery}`).then(r => r.data.results),
    enabled: debouncedQuery.length >= 2,
  })

  const { data: bookmarksData } = useQuery({
    queryKey: ['bookmarks'],
    queryFn: () => api.get('/bookmarks').then(r => r.data.bookmarks),
  })

  function handleSearchSubmit(e) {
    e.preventDefault()
    if (searchQuery.trim()) {
      navigate(`/tools?q=${encodeURIComponent(searchQuery.trim())}`)
      setSearchQuery('')
      setShowSearch(false)
    }
  }

  return (
    <nav className="bg-[#0F172A] text-white sticky top-0 z-50 shadow-lg">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Link to="/" className="flex items-center gap-2">
            <div className="w-8 h-8 bg-[#6366F1] rounded-lg flex items-center justify-center font-bold text-sm">AI</div>
            <span className="font-bold text-lg hidden sm:block">ITARIUM <span className="text-[#6366F1]">AI Hub</span></span>
          </Link>

          {/* Nav Links */}
          <div className="hidden md:flex items-center gap-6 text-sm font-medium text-slate-300">
            <Link to="/" className="hover:text-white transition-colors">Home</Link>
            <Link to="/tools" className="hover:text-white transition-colors">Browse Tools</Link>
            <Link to="/compare" className="hover:text-white transition-colors">Compare</Link>
          </div>

          {/* Search + Actions */}
          <div className="flex items-center gap-3">
            {/* Search */}
            <div className="relative">
              {showSearch ? (
                <div ref={searchRef}>
                  <form onSubmit={handleSearchSubmit} className="flex items-center gap-2">
                    <input
                      autoFocus
                      type="text"
                      value={searchQuery}
                      onChange={e => setSearchQuery(e.target.value)}
                      placeholder="Search AI tools..."
                      className="bg-slate-800 text-white placeholder-slate-400 rounded-lg px-4 py-2 text-sm w-64 border border-slate-600 focus:outline-none focus:border-[#6366F1]"
                    />
                    <button type="button" onClick={() => setShowSearch(false)} className="text-slate-400 hover:text-white">
                      <X size={18} />
                    </button>
                  </form>
                  {searchResults && searchResults.length > 0 && (
                    <div className="absolute top-full mt-2 left-0 w-72 bg-white rounded-lg shadow-xl border border-slate-200 overflow-hidden z-50">
                      {searchResults.map(tool => (
                        <Link
                          key={tool.id}
                          to={`/tools/${tool.slug}`}
                          onClick={() => { setShowSearch(false); setSearchQuery('') }}
                          className="flex items-center gap-3 px-4 py-3 hover:bg-slate-50 border-b border-slate-100 last:border-0"
                        >
                          {tool.logo_url
                            ? <img src={tool.logo_url} alt={tool.name} className="w-8 h-8 rounded object-cover" />
                            : <div className="w-8 h-8 bg-[#6366F1] rounded flex items-center justify-center text-white text-xs font-bold">{tool.name[0]}</div>
                          }
                          <div>
                            <p className="text-sm font-medium text-slate-900">{tool.name}</p>
                            <p className="text-xs text-slate-500">{tool.categories?.name}</p>
                          </div>
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              ) : (
                <button onClick={() => setShowSearch(true)} className="text-slate-300 hover:text-white p-1" aria-label="Search">
                  <Search size={20} />
                </button>
              )}
            </div>

            {/* Bookmarks */}
            <Link to="/bookmarks" className="relative text-slate-300 hover:text-white p-1" aria-label="Bookmarks">
              <Bookmark size={20} />
              {bookmarksData && bookmarksData.length > 0 && (
                <span className="absolute -top-1 -right-1 bg-[#6366F1] text-white text-xs rounded-full w-4 h-4 flex items-center justify-center">
                  {bookmarksData.length}
                </span>
              )}
            </Link>

            {/* User Menu */}
            <div className="relative">
              <button
                onClick={() => setShowUserMenu(!showUserMenu)}
                className="flex items-center gap-2 text-slate-300 hover:text-white"
              >
                <div className="w-8 h-8 rounded-full bg-[#6366F1] flex items-center justify-center text-sm font-medium">
                  {profile?.full_name?.[0] || user?.email?.[0]?.toUpperCase() || 'U'}
                </div>
                <ChevronDown size={16} />
              </button>
              {showUserMenu && (
                <div className="absolute right-0 top-full mt-2 w-48 bg-white rounded-lg shadow-xl border border-slate-200 py-1 z-50">
                  <div className="px-4 py-2 border-b border-slate-100">
                    <p className="text-sm font-medium text-slate-900">{profile?.full_name || 'User'}</p>
                    <p className="text-xs text-slate-500 truncate">{user?.email}</p>
                  </div>
                  <button
                    onClick={() => { signOut(); setShowUserMenu(false) }}
                    className="w-full flex items-center gap-2 px-4 py-2 text-sm text-red-600 hover:bg-red-50"
                  >
                    <LogOut size={16} /> Sign Out
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </nav>
  )
}
