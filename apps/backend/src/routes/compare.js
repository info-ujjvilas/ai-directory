const express = require('express');
const router = express.Router();
const { supabaseAdmin } = require('../config/supabase');

router.get('/', async (req, res, next) => {
  try {
    const { ids } = req.query;
    if (!ids) return res.json({ tools: [] });

    const idList = ids.split(',').slice(0, 3);

    const { data, error } = await supabaseAdmin
      .from('tools')
      .select(`
        *,
        categories(id, name, slug),
        tool_features(feature, sort_order),
        pricing_tiers(tier_name, price_label, billing_cycle, features, is_popular),
        tool_tags(tags(name, slug))
      `)
      .in('id', idList)
      .eq('is_active', true);

    if (error) throw error;
    res.json({ tools: data });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
