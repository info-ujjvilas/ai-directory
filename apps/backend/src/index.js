require('dotenv').config();
const express = require('express');
const cors = require('cors');
const errorHandler = require('./middleware/errorHandler');
const auth = require('./middleware/auth');

const toolsRouter = require('./routes/tools');
const categoriesRouter = require('./routes/categories');
const searchRouter = require('./routes/search');
const compareRouter = require('./routes/compare');
const reviewsRouter = require('./routes/reviews');
const bookmarksRouter = require('./routes/bookmarks');
const adminRouter = require('./routes/admin');

const app = express();

const corsOrigins = (process.env.CORS_ORIGINS || 'http://localhost:5300,http://localhost:5301').split(',');

const corsOptions = {
  origin: function (origin, callback) {
    // Allow requests with no origin (mobile, curl, etc.)
    if (!origin) return callback(null, true);
    // Allow any vercel.app subdomain or localhost
    if (
      corsOrigins.includes(origin) ||
      origin.endsWith('.vercel.app') ||
      origin.startsWith('http://localhost')
    ) {
      return callback(null, true);
    }
    return callback(new Error('Not allowed by CORS'));
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization'],
};

app.use(cors(corsOptions));
app.options('*', cors(corsOptions));
app.use(express.json());

// Public routes (still need auth for some)
app.use('/api/tools', auth, toolsRouter);
app.use('/api/categories', auth, categoriesRouter);
app.use('/api/search', auth, searchRouter);
app.use('/api/compare', auth, compareRouter);

// Protected routes
app.use('/api/reviews', reviewsRouter);
app.use('/api/bookmarks', bookmarksRouter);

// Admin routes
app.use('/api/admin', adminRouter);

app.get('/health', (req, res) => res.json({ status: 'ok' }));

app.use(errorHandler);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`ITARIUM AI Hub API running on port ${PORT}`);
});

module.exports = app;
