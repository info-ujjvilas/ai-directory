# ITARIUM AI Hub

A full-stack monorepo application for GTT / ITARIUM Technologies — a curated internal AI tools directory enabling employees to discover, compare, bookmark, and review 55+ AI tools across 10 categories.

---

## Project Overview

ITARIUM AI Hub is an employee-facing AI tools directory with:
- **Employee App** — Browse, search, compare, and bookmark AI tools
- **Admin Panel** — Manage tools, categories, reviews, and users
- **Backend API** — RESTful Express.js server with Supabase integration
- **Microsoft SSO** — Azure AD authentication via Supabase OAuth

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend (Employee) | React 18, Vite, TailwindCSS, TanStack Query |
| Frontend (Admin) | React 18, Vite, TailwindCSS, TanStack Query |
| Backend | Node.js, Express.js |
| Database | Supabase (PostgreSQL) |
| Auth | Supabase Auth + Azure AD (Microsoft SSO) |
| Deployment | Vercel (frontend + backend) |
| Monorepo | npm workspaces |

---

## Monorepo Structure

```
itarium-ai-hub/
├── apps/
│   ├── employee-app/          # React + Vite (port 5173)
│   ├── admin-panel/           # React + Vite (port 5174)
│   └── backend/               # Express.js (port 3001)
│       └── supabase/
│           ├── migrations/    # SQL migrations
│           └── seed.sql       # 55 tools seed data
├── packages/
│   └── shared/                # Shared constants and utilities
├── package.json               # Root workspace config
└── README.md
```

---

## Local Development Setup

### Prerequisites

- Node.js 18+ and npm 9+
- A [Supabase](https://supabase.com) project (free tier works)
- Git

### Step 1: Clone and Install

```bash
git clone <your-repo-url>
cd itarium-ai-hub
npm install
```

This installs dependencies for all workspaces simultaneously.

### Step 2: Configure Environment Variables

**Backend** (`apps/backend/.env`):
```env
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
SUPABASE_ANON_KEY=your_anon_key
JWT_SECRET=any_random_secret_string
PORT=3001
CORS_ORIGINS=http://localhost:5173,http://localhost:5174
```

**Employee App** (`apps/employee-app/.env.local`):
```env
VITE_API_URL=http://localhost:3001/api
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your_anon_key
VITE_MICROSOFT_CLIENT_ID=your_azure_client_id
```

**Admin Panel** (`apps/admin-panel/.env.local`):
```env
VITE_API_URL=http://localhost:3001/api
VITE_SUPABASE_URL=https://your-project-id.supabase.co
VITE_SUPABASE_ANON_KEY=your_anon_key
```

### Step 3: Run the Applications

Open three terminal windows:

```bash
# Terminal 1 — Backend API
npm run dev:backend

# Terminal 2 — Employee App
npm run dev:employee

# Terminal 3 — Admin Panel
npm run dev:admin
```

Access points:
- Employee App: http://localhost:5173
- Admin Panel: http://localhost:5174
- Backend API: http://localhost:3001
- Health Check: http://localhost:3001/health

---

## Database Setup

### Step 1: Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Note your Project URL and API keys from **Settings → API**

### Step 2: Run Database Migration

In your Supabase project, go to **SQL Editor** and run the migration file:

```bash
# Copy content from:
apps/backend/supabase/migrations/001_initial.sql
```

This creates all tables, indexes, RLS policies, and triggers.

### Step 3: Seed the Database

After running the migration, run the seed file:

```bash
# Copy content from:
apps/backend/supabase/seed.sql
```

This inserts:
- 10 categories (Writing, Coding, Design, Productivity, Research, Video & Audio, Data & Analytics, Marketing, HR & Recruitment, Customer Support)
- 55 AI tools with complete data
- Tool features (8 per tool)
- Pricing tiers for each tool
- 20 tags with tool associations

---

## Environment Variables Reference

### Backend

| Variable | Description | Required |
|----------|-------------|----------|
| `SUPABASE_URL` | Your Supabase project URL | Yes |
| `SUPABASE_SERVICE_ROLE_KEY` | Service role key (bypasses RLS) | Yes |
| `SUPABASE_ANON_KEY` | Anonymous/public key | Yes |
| `JWT_SECRET` | Secret for JWT signing | Yes |
| `PORT` | Server port (default: 3001) | No |
| `CORS_ORIGINS` | Comma-separated allowed origins | No |

### Frontend Apps

| Variable | Description | Required |
|----------|-------------|----------|
| `VITE_API_URL` | Backend API base URL | Yes |
| `VITE_SUPABASE_URL` | Supabase project URL | Yes |
| `VITE_SUPABASE_ANON_KEY` | Supabase anonymous key | Yes |
| `VITE_MICROSOFT_CLIENT_ID` | Azure AD app client ID (employee app only) | For Microsoft SSO |

---

## Deployment Guide (Vercel + Supabase)

### Deploy Backend to Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. Navigate to backend: `cd apps/backend`
3. Deploy: `vercel --prod`
4. Add environment variables in Vercel dashboard:
   - `SUPABASE_URL`
   - `SUPABASE_SERVICE_ROLE_KEY`
   - `SUPABASE_ANON_KEY`
   - `JWT_SECRET`
   - `CORS_ORIGINS` (set to your Vercel frontend URLs)

### Deploy Employee App to Vercel

1. Navigate to employee app: `cd apps/employee-app`
2. Build: `npm run build`
3. Deploy: `vercel --prod`
4. Add environment variables:
   - `VITE_API_URL` (your backend Vercel URL + `/api`)
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
   - `VITE_MICROSOFT_CLIENT_ID`

### Deploy Admin Panel to Vercel

1. Navigate to admin panel: `cd apps/admin-panel`
2. Build: `npm run build`
3. Deploy: `vercel --prod`
4. Add environment variables:
   - `VITE_API_URL`
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`

### Supabase Production Settings

1. Go to **Authentication → URL Configuration**
2. Add your Vercel URLs to **Site URL** and **Redirect URLs**:
   ```
   https://your-employee-app.vercel.app
   https://your-admin-panel.vercel.app
   ```

---

## Microsoft SSO Setup Guide

### Step 1: Register Azure AD App

1. Go to [Azure Portal](https://portal.azure.com) → **Azure Active Directory** → **App registrations**
2. Click **New registration**
3. Fill in:
   - **Name**: ITARIUM AI Hub
   - **Supported account types**: Accounts in this organizational directory only
   - **Redirect URI**: Web → `https://your-supabase-project.supabase.co/auth/v1/callback`
4. Click **Register**
5. Note the **Application (client) ID** — this is your `VITE_MICROSOFT_CLIENT_ID`

### Step 2: Create Client Secret

1. In your Azure app, go to **Certificates & secrets**
2. Click **New client secret**
3. Set expiry (24 months recommended)
4. Copy the **Value** immediately (won't be shown again)

### Step 3: Add API Permissions

1. Go to **API permissions** → **Add a permission** → **Microsoft Graph**
2. Add **Delegated permissions**: `email`, `openid`, `profile`, `User.Read`
3. Click **Grant admin consent**

### Step 4: Configure Supabase

1. Go to Supabase **Authentication → Providers**
2. Enable **Azure** provider
3. Enter:
   - **Azure Application ID**: Your Azure app client ID
   - **Azure Secret**: Your client secret
4. Click **Save**

### Step 5: Update Employee App

Set `VITE_MICROSOFT_CLIENT_ID` in your environment to the Azure Application ID.

---

## Admin User Creation Guide

### Method 1: Supabase Dashboard (Recommended)

1. Go to Supabase **Authentication → Users**
2. Click **Invite user** or **Add user**
3. Enter admin email and password
4. After creation, go to **Table Editor → profiles**
5. Find the user row and update `role` from `'employee'` to `'admin'`

### Method 2: SQL Command

```sql
-- First create the user through Supabase Auth UI, then:
UPDATE profiles
SET role = 'admin'
WHERE email = 'admin@yourcompany.com';
```

### Method 3: Supabase SQL Editor

```sql
-- Create profile directly (user must be created in Auth first)
UPDATE public.profiles
SET role = 'admin', is_active = true
WHERE id = 'auth-user-uuid-here';
```

---

## API Endpoints Reference

### Public (requires authentication)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/tools` | List tools with filters |
| GET | `/api/tools/:slug` | Get tool details |
| GET | `/api/categories` | List all categories |
| GET | `/api/search?q=` | Search tools |
| GET | `/api/compare?ids=` | Compare up to 3 tools |

### Protected (requires auth)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/bookmarks` | Get user bookmarks |
| POST | `/api/bookmarks/:toolId` | Add bookmark |
| DELETE | `/api/bookmarks/:toolId` | Remove bookmark |
| POST | `/api/reviews` | Submit review |

### Admin (requires admin role)
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/admin/stats` | Dashboard statistics |
| GET | `/api/admin/tools` | List all tools |
| POST | `/api/admin/tools` | Create tool |
| PUT | `/api/admin/tools/:id` | Update tool |
| DELETE | `/api/admin/tools/:id` | Delete tool |
| GET | `/api/admin/reviews` | List reviews |
| PUT | `/api/admin/reviews/:id` | Approve/reject review |
| GET | `/api/admin/users` | List users |
| PUT | `/api/admin/users/:id` | Update user status |
| GET | `/api/admin/categories` | List categories |
| POST | `/api/admin/categories` | Create category |
| PUT | `/api/admin/categories/:id` | Update category |
| DELETE | `/api/admin/categories/:id` | Delete category |

---

## Features

### Employee App
- Browse 55+ AI tools across 10 categories
- Real-time search with instant results
- Filter by category and platform
- Sort by newest, top rated, most reviewed, alphabetical
- Tool detail pages with overview, features, pricing, and reviews
- Side-by-side tool comparison (up to 3 tools)
- Bookmark/save favorite tools
- Submit ratings and reviews (pending admin approval)
- Microsoft SSO and email/password authentication
- Shareable comparison links
- Fully responsive mobile design

### Admin Panel
- Dashboard with key metrics
- Multi-step tool creation form
- Toggle featured, new, and active status
- Review moderation (approve/reject)
- Category management with modal editor
- User management with activate/deactivate
- Full CRUD for all entities

---

## License

Copyright 2025 GTT / ITARIUM Technologies India Pvt. Ltd. All rights reserved.
