import { Routes, Route, Navigate } from 'react-router-dom'
import { AuthProvider, useAuth } from './context/AuthContext'
import LoginPage from './pages/LoginPage'
import DashboardPage from './pages/DashboardPage'
import ToolsPage from './pages/ToolsPage'
import AddToolPage from './pages/AddToolPage'
import EditToolPage from './pages/EditToolPage'
import CategoriesPage from './pages/CategoriesPage'
import ReviewsPage from './pages/ReviewsPage'
import UsersPage from './pages/UsersPage'
import Sidebar from './components/Sidebar'

function AdminRoute({ children }) {
  const { user, profile, loading } = useAuth()
  if (loading) return (
    <div className="min-h-screen bg-[#0F172A] flex items-center justify-center">
      <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-[#6366F1]" />
    </div>
  )
  if (!user) return <Navigate to="/login" replace />
  if (profile && profile.role !== 'admin') return (
    <div className="min-h-screen flex items-center justify-center">
      <p className="text-red-600">Access denied. Admin only.</p>
    </div>
  )
  return children
}

function AdminLayout({ children }) {
  return (
    <div className="flex min-h-screen bg-slate-100">
      <Sidebar />
      <main className="flex-1 ml-64 p-8 overflow-auto">{children}</main>
    </div>
  )
}

export default function App() {
  return (
    <AuthProvider>
      <Routes>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/" element={<AdminRoute><AdminLayout><DashboardPage /></AdminLayout></AdminRoute>} />
        <Route path="/tools" element={<AdminRoute><AdminLayout><ToolsPage /></AdminLayout></AdminRoute>} />
        <Route path="/tools/new" element={<AdminRoute><AdminLayout><AddToolPage /></AdminLayout></AdminRoute>} />
        <Route path="/tools/:id/edit" element={<AdminRoute><AdminLayout><EditToolPage /></AdminLayout></AdminRoute>} />
        <Route path="/categories" element={<AdminRoute><AdminLayout><CategoriesPage /></AdminLayout></AdminRoute>} />
        <Route path="/reviews" element={<AdminRoute><AdminLayout><ReviewsPage /></AdminLayout></AdminRoute>} />
        <Route path="/users" element={<AdminRoute><AdminLayout><UsersPage /></AdminLayout></AdminRoute>} />
      </Routes>
    </AuthProvider>
  )
}
