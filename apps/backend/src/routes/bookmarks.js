const express = require('express');
const router = express.Router();
const { supabaseAdmin } = require('../config/supabase');
const auth = require('../middleware/auth');

router.get('/', auth, async (req, res, next) => {
  try {
    const { data, error } = await supabaseAdmin
      .from('bookmarks')
      .select(`
        created_at,
        tools(
          id, name, slug, tagline, logo_url, avg_rating, review_count, platforms,
          categories(name, slug),
          tool_tags(tags(name, slug))
        )
      `)
      .eq('user_id', req.user.id)
      .order('created_at', { ascending: false });

    if (error) throw error;
    res.json({ bookmarks: data });
  } catch (err) {
    next(err);
  }
});

router.post('/:toolId', auth, async (req, res, next) => {
  try {
    const { data, error } = await supabaseAdmin
      .from('bookmarks')
      .insert({ user_id: req.user.id, tool_id: req.params.toolId })
      .select()
      .single();

    if (error) {
      if (error.code === '23505') return res.status(409).json({ error: 'Already bookmarked' });
      throw error;
    }
    res.status(201).json(data);
  } catch (err) {
    next(err);
  }
});

router.delete('/:toolId', auth, async (req, res, next) => {
  try {
    const { error } = await supabaseAdmin
      .from('bookmarks')
      .delete()
      .eq('user_id', req.user.id)
      .eq('tool_id', req.params.toolId);

    if (error) throw error;
    res.json({ success: true });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
