const express = require('express');
const router = express.Router();
const { supabaseAdmin } = require('../config/supabase');

router.get('/', async (req, res, next) => {
  try {
    const { q } = req.query;
    if (!q || q.length < 2) return res.json({ results: [] });

    const { data, error } = await supabaseAdmin
      .from('tools')
      .select('id, name, slug, tagline, logo_url, categories(name, slug)')
      .eq('is_active', true)
      .or(`name.ilike.%${q}%,tagline.ilike.%${q}%,description.ilike.%${q}%`)
      .limit(10);

    if (error) throw error;
    res.json({ results: data });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
