import { useState } from 'react'
import { Navigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

export default function LoginPage() {
  const { user, signIn, signInWithMicrosoft } = useAuth()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  if (user) return <Navigate to="/" replace />

  async function handleSubmit(e) {
    e.preventDefault()
    setError('')
    setLoading(true)
    try {
      await signIn(email, password)
    } catch (err) {
      setError(err.message || 'Failed to sign in')
    } finally {
      setLoading(false)
    }
  }

  async function handleMicrosoft() {
    setError('')
    try {
      await signInWithMicrosoft()
    } catch (err) {
      setError(err.message || 'Microsoft sign-in failed')
    }
  }

  return (
    <div className="min-h-screen bg-[#0F172A] flex items-center justify-center px-4">
      <div className="w-full max-w-md">
        {/* Logo */}
        <div className="text-center mb-8">
          <div className="inline-flex items-center gap-3 mb-4">
            <div className="w-12 h-12 bg-[#6366F1] rounded-xl flex items-center justify-center font-bold text-xl text-white">AI</div>
            <div className="text-left">
              <h1 className="text-white font-bold text-2xl">ITARIUM <span className="text-[#6366F1]">AI Hub</span></h1>
              <p className="text-slate-400 text-sm">GTT / ITARIUM Technologies</p>
            </div>
          </div>
          <p className="text-slate-400">Discover the Right AI Tool for Every Task</p>
        </div>

        <div className="bg-slate-800 rounded-2xl p-8 border border-slate-700">
          <h2 className="text-white font-semibold text-xl mb-6 text-center">Sign In</h2>

          {error && (
            <div className="bg-red-900/30 border border-red-700 text-red-300 rounded-lg px-4 py-3 mb-4 text-sm" role="alert">
              {error}
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="text-slate-300 text-sm font-medium block mb-1.5" htmlFor="email">Email</label>
              <input
                id="email"
                type="email"
                value={email}
                onChange={e => setEmail(e.target.value)}
                required
                className="w-full bg-slate-700 border border-slate-600 text-white rounded-lg px-4 py-3 text-sm focus:outline-none focus:border-[#6366F1] placeholder-slate-500"
                placeholder="you@company.com"
              />
            </div>
            <div>
              <label className="text-slate-300 text-sm font-medium block mb-1.5" htmlFor="password">Password</label>
              <input
                id="password"
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value)}
                required
                className="w-full bg-slate-700 border border-slate-600 text-white rounded-lg px-4 py-3 text-sm focus:outline-none focus:border-[#6366F1] placeholder-slate-500"
                placeholder="••••••••"
              />
            </div>
            <button
              type="submit"
              disabled={loading}
              className="w-full bg-[#6366F1] hover:bg-indigo-600 disabled:opacity-50 text-white font-semibold py-3 rounded-lg transition-colors"
            >
              {loading ? 'Signing in...' : 'Sign In'}
            </button>
          </form>

          <div className="flex items-center gap-3 my-5">
            <div className="flex-1 h-px bg-slate-600" />
            <span className="text-slate-500 text-xs">OR</span>
            <div className="flex-1 h-px bg-slate-600" />
          </div>

          <button
            onClick={handleMicrosoft}
            className="w-full flex items-center justify-center gap-3 bg-white hover:bg-slate-50 text-slate-800 font-medium py-3 rounded-lg transition-colors border border-slate-200"
          >
            <svg viewBox="0 0 21 21" width="20" height="20"><rect x="1" y="1" width="9" height="9" fill="#f25022"/><rect x="11" y="1" width="9" height="9" fill="#7fba00"/><rect x="1" y="11" width="9" height="9" fill="#00a4ef"/><rect x="11" y="11" width="9" height="9" fill="#ffb900"/></svg>
            Sign in with Microsoft
          </button>
        </div>

        <p className="text-slate-600 text-xs text-center mt-6">
          &copy; {new Date().getFullYear()} GTT / ITARIUM Technologies India Pvt. Ltd.
        </p>
      </div>
    </div>
  )
}
