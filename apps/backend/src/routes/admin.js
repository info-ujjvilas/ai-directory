const express = require('express');
const router = express.Router();
const { supabaseAdmin } = require('../config/supabase');
const auth = require('../middleware/auth');
const adminOnly = require('../middleware/adminOnly');
const { slugify } = require('../utils/slugify');
const { body, validationResult } = require('express-validator');

router.use(auth, adminOnly);

// GET /api/admin/stats
router.get('/stats', async (req, res, next) => {
  try {
    const [
      { count: totalTools },
      { count: totalCategories },
      { count: pendingReviews },
      { count: newThisMonth },
      { data: topBookmarked },
    ] = await Promise.all([
      supabaseAdmin.from('tools').select('*', { count: 'exact', head: true }).eq('is_active', true),
      supabaseAdmin.from('categories').select('*', { count: 'exact', head: true }),
      supabaseAdmin.from('reviews').select('*', { count: 'exact', head: true }).eq('status', 'pending'),
      supabaseAdmin
        .from('tools')
        .select('*', { count: 'exact', head: true })
        .eq('is_new', true)
        .gte('created_at', new Date(new Date().setDate(1)).toISOString()),
      supabaseAdmin
        .from('bookmarks')
        .select('tool_id, tools(id, name, slug, logo_url)', { count: 'exact' })
        .limit(5),
    ]);

    res.json({ totalTools, totalCategories, pendingReviews, newThisMonth, topBookmarked });
  } catch (err) {
    next(err);
  }
});

// GET /api/admin/reviews
router.get('/reviews', async (req, res, next) => {
  try {
    const { status = 'pending', page = 1, limit = 20 } = req.query;
    const from = (page - 1) * limit;
    const to = from + parseInt(limit) - 1;

    const { data, error, count } = await supabaseAdmin
      .from('reviews')
      .select('*, tools(name, slug), profiles(full_name, email)', { count: 'exact' })
      .eq('status', status)
      .order('created_at', { ascending: false })
      .range(from, to);

    if (error) throw error;
    res.json({ reviews: data, total: count });
  } catch (err) {
    next(err);
  }
});

// PUT /api/admin/reviews/:id
router.put('/reviews/:id', async (req, res, next) => {
  try {
    const { status } = req.body;
    if (!['approved', 'rejected'].includes(status)) {
      return res.status(400).json({ error: 'Invalid status' });
    }

    const { data, error } = await supabaseAdmin
      .from('reviews')
      .update({ status })
      .eq('id', req.params.id)
      .select()
      .single();

    if (error) throw error;

    // Update avg_rating if approved
    if (status === 'approved') {
      const { data: ratings } = await supabaseAdmin
        .from('reviews')
        .select('rating')
        .eq('tool_id', data.tool_id)
        .eq('status', 'approved');

      if (ratings && ratings.length > 0) {
        const avg = ratings.reduce((sum, r) => sum + r.rating, 0) / ratings.length;
        await supabaseAdmin
          .from('tools')
          .update({ avg_rating: avg.toFixed(2), review_count: ratings.length })
          .eq('id', data.tool_id);
      }
    }

    res.json(data);
  } catch (err) {
    next(err);
  }
});

// GET /api/admin/users
router.get('/users', async (req, res, next) => {
  try {
    const { page = 1, limit = 20 } = req.query;
    const from = (page - 1) * limit;
    const to = from + parseInt(limit) - 1;

    const { data, error, count } = await supabaseAdmin
      .from('profiles')
      .select('*', { count: 'exact' })
      .order('created_at', { ascending: false })
      .range(from, to);

    if (error) throw error;
    res.json({ users: data, total: count });
  } catch (err) {
    next(err);
  }
});

// PUT /api/admin/users/:id
router.put('/users/:id', async (req, res, next) => {
  try {
    const { is_active } = req.body;
    const { data, error } = await supabaseAdmin
      .from('profiles')
      .update({ is_active })
      .eq('id', req.params.id)
      .select()
      .single();

    if (error) throw error;
    res.json(data);
  } catch (err) {
    next(err);
  }
});

// POST /api/admin/tools
router.post('/tools', async (req, res, next) => {
  try {
    const { name, tagline, description, logo_url, website_url, category_id, platforms, features, pricing_tiers, tags, is_featured, is_new, is_active } = req.body;

    const slug = slugify(name);

    const { data: tool, error: toolError } = await supabaseAdmin
      .from('tools')
      .insert({ name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active })
      .select()
      .single();

    if (toolError) throw toolError;

    if (features && features.length > 0) {
      await supabaseAdmin.from('tool_features').insert(
        features.map((f, i) => ({ tool_id: tool.id, feature: f.feature || f, sort_order: i }))
      );
    }

    if (pricing_tiers && pricing_tiers.length > 0) {
      await supabaseAdmin.from('pricing_tiers').insert(
        pricing_tiers.map((t, i) => ({ ...t, tool_id: tool.id, sort_order: i }))
      );
    }

    if (tags && tags.length > 0) {
      for (const tagName of tags) {
        const tagSlug = slugify(tagName);
        const { data: existingTag } = await supabaseAdmin.from('tags').select('id').eq('slug', tagSlug).single();
        let tagId;
        if (existingTag) {
          tagId = existingTag.id;
        } else {
          const { data: newTag } = await supabaseAdmin.from('tags').insert({ name: tagName, slug: tagSlug }).select('id').single();
          tagId = newTag.id;
        }
        await supabaseAdmin.from('tool_tags').insert({ tool_id: tool.id, tag_id: tagId });
      }
    }

    res.status(201).json(tool);
  } catch (err) {
    next(err);
  }
});

// PUT /api/admin/tools/:id
router.put('/tools/:id', async (req, res, next) => {
  try {
    const { name, tagline, description, logo_url, website_url, category_id, platforms, features, pricing_tiers, tags, is_featured, is_new, is_active } = req.body;

    const updates = { tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active, updated_at: new Date().toISOString() };
    if (name) updates.name = name;

    const { data: tool, error } = await supabaseAdmin
      .from('tools')
      .update(updates)
      .eq('id', req.params.id)
      .select()
      .single();

    if (error) throw error;

    if (features) {
      await supabaseAdmin.from('tool_features').delete().eq('tool_id', tool.id);
      if (features.length > 0) {
        await supabaseAdmin.from('tool_features').insert(
          features.map((f, i) => ({ tool_id: tool.id, feature: f.feature || f, sort_order: i }))
        );
      }
    }

    if (pricing_tiers) {
      await supabaseAdmin.from('pricing_tiers').delete().eq('tool_id', tool.id);
      if (pricing_tiers.length > 0) {
        await supabaseAdmin.from('pricing_tiers').insert(
          pricing_tiers.map((t, i) => ({ ...t, tool_id: tool.id, sort_order: i }))
        );
      }
    }

    res.json(tool);
  } catch (err) {
    next(err);
  }
});

// DELETE /api/admin/tools/:id
router.delete('/tools/:id', async (req, res, next) => {
  try {
    const { error } = await supabaseAdmin.from('tools').delete().eq('id', req.params.id);
    if (error) throw error;
    res.json({ success: true });
  } catch (err) {
    next(err);
  }
});

// POST /api/admin/categories
router.post('/categories', async (req, res, next) => {
  try {
    const { name, description, icon, sort_order } = req.body;
    const slug = slugify(name);
    const { data, error } = await supabaseAdmin
      .from('categories')
      .insert({ name, slug, description, icon, sort_order })
      .select()
      .single();
    if (error) throw error;
    res.status(201).json(data);
  } catch (err) {
    next(err);
  }
});

// PUT /api/admin/categories/:id
router.put('/categories/:id', async (req, res, next) => {
  try {
    const { name, description, icon, sort_order } = req.body;
    const updates = { description, icon, sort_order };
    if (name) { updates.name = name; updates.slug = slugify(name); }
    const { data, error } = await supabaseAdmin
      .from('categories')
      .update(updates)
      .eq('id', req.params.id)
      .select()
      .single();
    if (error) throw error;
    res.json(data);
  } catch (err) {
    next(err);
  }
});

// DELETE /api/admin/categories/:id
router.delete('/categories/:id', async (req, res, next) => {
  try {
    const { error } = await supabaseAdmin.from('categories').delete().eq('id', req.params.id);
    if (error) throw error;
    res.json({ success: true });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
