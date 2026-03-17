const express = require('express');
const router = express.Router();
const { supabaseAdmin } = require('../config/supabase');
const auth = require('../middleware/auth');
const { body, validationResult } = require('express-validator');

router.post(
  '/',
  auth,
  [
    body('tool_id').isUUID(),
    body('rating').isInt({ min: 1, max: 5 }),
    body('comment').optional().isString().isLength({ max: 1000 }),
  ],
  async (req, res, next) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

      const { tool_id, rating, comment } = req.body;

      // Check existing review
      const { data: existing } = await supabaseAdmin
        .from('reviews')
        .select('id')
        .eq('tool_id', tool_id)
        .eq('user_id', req.user.id)
        .single();

      if (existing) {
        return res.status(409).json({ error: 'You have already reviewed this tool' });
      }

      const { data, error } = await supabaseAdmin
        .from('reviews')
        .insert({ tool_id, user_id: req.user.id, rating, comment, status: 'pending' })
        .select()
        .single();

      if (error) throw error;
      res.status(201).json(data);
    } catch (err) {
      next(err);
    }
  }
);

module.exports = router;
