import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import api from '../lib/api'
import { Plus, Trash2, ChevronRight, ChevronLeft, Check } from 'lucide-react'

const PLATFORMS = ['Web', 'API', 'Desktop', 'Mobile', 'CLI']
const STEPS = ['Basic Info', 'Features', 'Pricing Tiers', 'Tags & Settings']

export default function AddToolPage() {
  const navigate = useNavigate()
  const qc = useQueryClient()
  const [step, setStep] = useState(0)
  const [error, setError] = useState('')

  const [form, setForm] = useState({
    name: '', tagline: '', description: '', logo_url: '', website_url: '',
    category_id: '', platforms: [],
    features: [{ feature: '' }],
    pricing_tiers: [{ tier_name: '', price_label: '', billing_cycle: '', features: [''], is_popular: false }],
    tags: [],
    is_featured: false, is_new: true, is_active: true,
  })
  const [tagInput, setTagInput] = useState('')

  const { data: categories } = useQuery({
    queryKey: ['categories'],
    queryFn: () => api.get('/categories').then(r => r.data),
  })

  const mutation = useMutation({
    mutationFn: data => api.post('/admin/tools', data),
    onSuccess: () => { qc.invalidateQueries({ queryKey: ['admin', 'tools'] }); navigate('/tools') },
    onError: err => setError(err.response?.data?.error || 'Failed to create tool'),
  })

  function handlePlatform(p) {
    setForm(f => ({
      ...f,
      platforms: f.platforms.includes(p) ? f.platforms.filter(x => x !== p) : [...f.platforms, p],
    }))
  }

  function addFeature() { setForm(f => ({ ...f, features: [...f.features, { feature: '' }] })) }
  function removeFeature(i) { setForm(f => ({ ...f, features: f.features.filter((_, idx) => idx !== i) })) }
  function updateFeature(i, val) {
    setForm(f => { const features = [...f.features]; features[i] = { feature: val }; return { ...f, features } })
  }

  function addTier() {
    setForm(f => ({ ...f, pricing_tiers: [...f.pricing_tiers, { tier_name: '', price_label: '', billing_cycle: '', features: [''], is_popular: false }] }))
  }
  function removeTier(i) { setForm(f => ({ ...f, pricing_tiers: f.pricing_tiers.filter((_, idx) => idx !== i) })) }
  function updateTier(i, field, val) {
    setForm(f => { const t = [...f.pricing_tiers]; t[i] = { ...t[i], [field]: val }; return { ...f, pricing_tiers: t } })
  }
  function addTierFeature(ti) {
    setForm(f => { const t = [...f.pricing_tiers]; t[ti] = { ...t[ti], features: [...t[ti].features, ''] }; return { ...f, pricing_tiers: t } })
  }
  function updateTierFeature(ti, fi, val) {
    setForm(f => { const t = [...f.pricing_tiers]; const tf = [...t[ti].features]; tf[fi] = val; t[ti] = { ...t[ti], features: tf }; return { ...f, pricing_tiers: t } })
  }
  function removeTierFeature(ti, fi) {
    setForm(f => { const t = [...f.pricing_tiers]; t[ti] = { ...t[ti], features: t[ti].features.filter((_, i) => i !== fi) }; return { ...f, pricing_tiers: t } })
  }

  function addTag(e) {
    e.preventDefault()
    const tag = tagInput.trim()
    if (tag && !form.tags.includes(tag)) {
      setForm(f => ({ ...f, tags: [...f.tags, tag] }))
      setTagInput('')
    }
  }
  function removeTag(t) { setForm(f => ({ ...f, tags: f.tags.filter(x => x !== t) })) }

  function handleSubmit() {
    setError('')
    mutation.mutate(form)
  }

  return (
    <div className="max-w-2xl">
      <div className="flex items-center gap-2 mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Add New Tool</h1>
      </div>

      {/* Step indicator */}
      <div className="flex items-center mb-8">
        {STEPS.map((s, i) => (
          <div key={i} className="flex items-center">
            <div className={`flex items-center gap-2 ${i <= step ? 'text-[#6366F1]' : 'text-slate-400'}`}>
              <div className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold ${i < step ? 'bg-[#6366F1] text-white' : i === step ? 'border-2 border-[#6366F1] text-[#6366F1]' : 'border-2 border-slate-300 text-slate-400'}`}>
                {i < step ? <Check size={14} /> : i + 1}
              </div>
              <span className="text-sm font-medium hidden sm:block">{s}</span>
            </div>
            {i < STEPS.length - 1 && <div className={`h-0.5 w-8 mx-2 ${i < step ? 'bg-[#6366F1]' : 'bg-slate-200'}`} />}
          </div>
        ))}
      </div>

      {error && <div className="bg-red-50 border border-red-200 text-red-700 rounded-lg px-4 py-3 mb-4 text-sm">{error}</div>}

      <div className="bg-white rounded-xl border border-slate-200 p-6">
        {/* Step 1: Basic Info */}
        {step === 0 && (
          <div className="space-y-4">
            <h2 className="font-semibold text-slate-900 mb-4">Basic Information</h2>
            {[
              { label: 'Tool Name *', key: 'name', type: 'text', placeholder: 'e.g. ChatGPT' },
              { label: 'Tagline *', key: 'tagline', type: 'text', placeholder: 'Short description' },
              { label: 'Logo URL', key: 'logo_url', type: 'url', placeholder: 'https://...' },
              { label: 'Website URL', key: 'website_url', type: 'url', placeholder: 'https://...' },
            ].map(({ label, key, type, placeholder }) => (
              <div key={key}>
                <label className="text-sm font-medium text-slate-700 block mb-1">{label}</label>
                <input type={type} value={form[key]} onChange={e => setForm(f => ({ ...f, [key]: e.target.value }))}
                  placeholder={placeholder}
                  className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
              </div>
            ))}
            <div>
              <label className="text-sm font-medium text-slate-700 block mb-1">Description</label>
              <textarea value={form.description} onChange={e => setForm(f => ({ ...f, description: e.target.value }))}
                rows={4} className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1] resize-none" />
            </div>
            <div>
              <label className="text-sm font-medium text-slate-700 block mb-1">Category</label>
              <select value={form.category_id} onChange={e => setForm(f => ({ ...f, category_id: e.target.value }))}
                className="w-full border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]">
                <option value="">Select category...</option>
                {categories?.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </div>
            <div>
              <label className="text-sm font-medium text-slate-700 block mb-2">Platforms</label>
              <div className="flex flex-wrap gap-2">
                {PLATFORMS.map(p => (
                  <button key={p} type="button" onClick={() => handlePlatform(p)}
                    className={`px-3 py-1.5 rounded-lg text-sm font-medium border transition-colors ${form.platforms.includes(p) ? 'bg-[#6366F1] text-white border-[#6366F1]' : 'border-slate-300 text-slate-600 hover:border-[#6366F1]'}`}>
                    {p}
                  </button>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* Step 2: Features */}
        {step === 1 && (
          <div>
            <h2 className="font-semibold text-slate-900 mb-4">Tool Features</h2>
            <div className="space-y-2">
              {form.features.map((f, i) => (
                <div key={i} className="flex items-center gap-2">
                  <input value={f.feature} onChange={e => updateFeature(i, e.target.value)}
                    placeholder={`Feature ${i + 1}`}
                    className="flex-1 border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
                  <button type="button" onClick={() => removeFeature(i)} disabled={form.features.length === 1}
                    className="p-2 text-slate-400 hover:text-red-500 disabled:opacity-30">
                    <Trash2 size={16} />
                  </button>
                </div>
              ))}
            </div>
            <button type="button" onClick={addFeature}
              className="mt-3 flex items-center gap-2 text-sm text-[#6366F1] hover:text-indigo-700 font-medium">
              <Plus size={16} /> Add Feature
            </button>
          </div>
        )}

        {/* Step 3: Pricing */}
        {step === 2 && (
          <div>
            <h2 className="font-semibold text-slate-900 mb-4">Pricing Tiers</h2>
            <div className="space-y-6">
              {form.pricing_tiers.map((tier, ti) => (
                <div key={ti} className="border border-slate-200 rounded-lg p-4">
                  <div className="flex items-center justify-between mb-3">
                    <span className="text-sm font-semibold text-slate-700">Tier {ti + 1}</span>
                    <button type="button" onClick={() => removeTier(ti)} disabled={form.pricing_tiers.length === 1}
                      className="text-slate-400 hover:text-red-500 disabled:opacity-30">
                      <Trash2 size={15} />
                    </button>
                  </div>
                  <div className="grid grid-cols-2 gap-3 mb-3">
                    <div>
                      <label className="text-xs text-slate-600 block mb-1">Tier Name</label>
                      <input value={tier.tier_name} onChange={e => updateTier(ti, 'tier_name', e.target.value)}
                        placeholder="Free / Pro / Enterprise"
                        className="w-full border border-slate-300 rounded px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
                    </div>
                    <div>
                      <label className="text-xs text-slate-600 block mb-1">Price Label</label>
                      <input value={tier.price_label} onChange={e => updateTier(ti, 'price_label', e.target.value)}
                        placeholder="$0 / $20 / Custom"
                        className="w-full border border-slate-300 rounded px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
                    </div>
                    <div>
                      <label className="text-xs text-slate-600 block mb-1">Billing Cycle</label>
                      <input value={tier.billing_cycle} onChange={e => updateTier(ti, 'billing_cycle', e.target.value)}
                        placeholder="month / year"
                        className="w-full border border-slate-300 rounded px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
                    </div>
                    <div className="flex items-end">
                      <label className="flex items-center gap-2 text-sm text-slate-600 cursor-pointer">
                        <input type="checkbox" checked={tier.is_popular} onChange={e => updateTier(ti, 'is_popular', e.target.checked)}
                          className="rounded border-slate-300 text-[#6366F1]" />
                        Most Popular
                      </label>
                    </div>
                  </div>
                  <div>
                    <label className="text-xs text-slate-600 block mb-1">Features</label>
                    <div className="space-y-2">
                      {tier.features.map((f, fi) => (
                        <div key={fi} className="flex gap-2">
                          <input value={f} onChange={e => updateTierFeature(ti, fi, e.target.value)}
                            placeholder={`Feature ${fi+1}`}
                            className="flex-1 border border-slate-200 rounded px-3 py-1.5 text-xs focus:outline-none focus:border-[#6366F1]" />
                          <button type="button" onClick={() => removeTierFeature(ti, fi)} disabled={tier.features.length === 1}
                            className="text-slate-400 hover:text-red-500 disabled:opacity-30">
                            <Trash2 size={13} />
                          </button>
                        </div>
                      ))}
                      <button type="button" onClick={() => addTierFeature(ti)}
                        className="text-xs text-[#6366F1] hover:text-indigo-700 font-medium flex items-center gap-1">
                        <Plus size={12} /> Add feature
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
            <button type="button" onClick={addTier}
              className="mt-4 flex items-center gap-2 text-sm text-[#6366F1] hover:text-indigo-700 font-medium">
              <Plus size={16} /> Add Pricing Tier
            </button>
          </div>
        )}

        {/* Step 4: Tags & Settings */}
        {step === 3 && (
          <div className="space-y-5">
            <h2 className="font-semibold text-slate-900 mb-4">Tags &amp; Settings</h2>
            <div>
              <label className="text-sm font-medium text-slate-700 block mb-1">Tags</label>
              <form onSubmit={addTag} className="flex gap-2 mb-2">
                <input value={tagInput} onChange={e => setTagInput(e.target.value)}
                  placeholder="Add a tag and press Enter"
                  className="flex-1 border border-slate-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:border-[#6366F1]" />
                <button type="submit" className="bg-[#6366F1] text-white px-3 py-2 rounded-lg text-sm">Add</button>
              </form>
              <div className="flex flex-wrap gap-2">
                {form.tags.map(tag => (
                  <span key={tag} className="flex items-center gap-1 bg-indigo-50 text-[#6366F1] text-xs px-3 py-1 rounded-full">
                    {tag}
                    <button onClick={() => removeTag(tag)} className="ml-1 hover:text-red-500">&times;</button>
                  </span>
                ))}
              </div>
            </div>
            <div className="space-y-3">
              {[
                { key: 'is_featured', label: 'Featured Tool', desc: 'Show on homepage featured section' },
                { key: 'is_new', label: 'New Arrival', desc: 'Mark as newly added' },
                { key: 'is_active', label: 'Active', desc: 'Visible to employees' },
              ].map(({ key, label, desc }) => (
                <label key={key} className="flex items-center justify-between p-3 border border-slate-200 rounded-lg cursor-pointer hover:bg-slate-50">
                  <div>
                    <p className="text-sm font-medium text-slate-900">{label}</p>
                    <p className="text-xs text-slate-500">{desc}</p>
                  </div>
                  <input type="checkbox" checked={form[key]} onChange={e => setForm(f => ({ ...f, [key]: e.target.checked }))}
                    className="w-4 h-4 rounded text-[#6366F1]" />
                </label>
              ))}
            </div>
          </div>
        )}
      </div>

      {/* Navigation */}
      <div className="flex items-center justify-between mt-5">
        <button onClick={() => setStep(s => s - 1)} disabled={step === 0}
          className="flex items-center gap-2 px-4 py-2 border border-slate-300 text-slate-700 rounded-lg text-sm disabled:opacity-40 hover:bg-slate-50">
          <ChevronLeft size={16} /> Previous
        </button>
        {step < STEPS.length - 1 ? (
          <button onClick={() => setStep(s => s + 1)}
            className="flex items-center gap-2 bg-[#6366F1] hover:bg-indigo-600 text-white px-5 py-2 rounded-lg text-sm font-medium">
            Next <ChevronRight size={16} />
          </button>
        ) : (
          <button onClick={handleSubmit} disabled={mutation.isPending}
            className="flex items-center gap-2 bg-green-600 hover:bg-green-700 disabled:opacity-50 text-white px-5 py-2 rounded-lg text-sm font-medium">
            {mutation.isPending ? 'Creating...' : 'Create Tool'} <Check size={16} />
          </button>
        )}
      </div>
    </div>
  )
}
