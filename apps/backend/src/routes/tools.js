const express = require('express');
const router = express.Router();
const { supabaseAdmin } = require('../config/supabase');

// GET /api/tools
router.get('/', async (req, res, next) => {
  try {
    const {
      category,
      platform,
      tag,
      sort = 'newest',
      page = 1,
      limit = 12,
      q,
    } = req.query;

    let query = supabaseAdmin
      .from('tools')
      .select(`
        *,
        categories(id, name, slug, icon),
        tool_tags(tags(id, name, slug))
      `)
      .eq('is_active', true);

    if (category) query = query.eq('categories.slug', category);
    if (platform) query = query.contains('platforms', [platform]);
    if (tag) query = query.eq('tool_tags.tags.slug', tag);
    if (q) query = query.or(`name.ilike.%${q}%,tagline.ilike.%${q}%,description.ilike.%${q}%`);

    if (sort === 'newest') query = query.order('created_at', { ascending: false });
    else if (sort === 'most_reviewed') query = query.order('review_count', { ascending: false });
    else if (sort === 'alphabetical') query = query.order('name');
    else if (sort === 'top_rated') query = query.order('avg_rating', { ascending: false });

    const from = (page - 1) * limit;
    const to = from + parseInt(limit) - 1;
    query = query.range(from, to);

    const { data, error, count } = await query;
    if (error) throw error;

    res.json({ tools: data, total: count, page: parseInt(page), limit: parseInt(limit) });
  } catch (err) {
    next(err);
  }
});

// GET /api/tools/:slug
router.get('/:slug', async (req, res, next) => {
  try {
    const { data: tool, error } = await supabaseAdmin
      .from('tools')
      .select(`
        *,
        categories(id, name, slug, icon),
        tool_features(id, feature, sort_order),
        pricing_tiers(id, tier_name, price_label, billing_cycle, features, is_popular, sort_order),
        tool_tags(tags(id, name, slug)),
        reviews(id, rating, comment, status, created_at, profiles(id, full_name, avatar_url))
      `)
      .eq('slug', req.params.slug)
      .eq('is_active', true)
      .single();

    if (error || !tool) return res.status(404).json({ error: 'Tool not found' });

    res.json(tool);
  } catch (err) {
    next(err);
  }
});

module.exports = router;
