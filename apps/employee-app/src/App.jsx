import { Routes, Route, Navigate } from 'react-router-dom'
import { AuthProvider, useAuth } from './context/AuthContext'
import { CompareProvider } from './context/CompareContext'
import LoginPage from './pages/LoginPage'
import HomePage from './pages/HomePage'
import ToolsPage from './pages/ToolsPage'
import ToolDetailPage from './pages/ToolDetailPage'
import BookmarksPage from './pages/BookmarksPage'
import ComparePage from './pages/ComparePage'
import CategoryPage from './pages/CategoryPage'
import Navbar from './components/Navbar'
import CompareBar from './components/CompareBar'

function ProtectedRoute({ children }) {
  const { user, loading } = useAuth()
  if (loading) return (
    <div className="min-h-screen flex items-center justify-center bg-[#0F172A]">
      <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-[#6366F1]" />
    </div>
  )
  if (!user) return <Navigate to="/login" replace />
  return children
}

function AppLayout({ children }) {
  return (
    <div className="min-h-screen bg-slate-50">
      <Navbar />
      <main>{children}</main>
      <CompareBar />
    </div>
  )
}

export default function App() {
  return (
    <AuthProvider>
      <CompareProvider>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/" element={<ProtectedRoute><AppLayout><HomePage /></AppLayout></ProtectedRoute>} />
          <Route path="/tools" element={<ProtectedRoute><AppLayout><ToolsPage /></AppLayout></ProtectedRoute>} />
          <Route path="/tools/:slug" element={<ProtectedRoute><AppLayout><ToolDetailPage /></AppLayout></ProtectedRoute>} />
          <Route path="/bookmarks" element={<ProtectedRoute><AppLayout><BookmarksPage /></AppLayout></ProtectedRoute>} />
          <Route path="/compare" element={<ProtectedRoute><AppLayout><ComparePage /></AppLayout></ProtectedRoute>} />
          <Route path="/category/:slug" element={<ProtectedRoute><AppLayout><CategoryPage /></AppLayout></ProtectedRoute>} />
        </Routes>
      </CompareProvider>
    </AuthProvider>
  )
}
