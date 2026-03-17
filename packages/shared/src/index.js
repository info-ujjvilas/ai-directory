// Pricing tier types
export const PRICING_TYPES = {
  FREE: 'free',
  FREEMIUM: 'freemium',
  PAID: 'paid',
  ENTERPRISE: 'enterprise',
};

export const PRICING_COLORS = {
  free: 'bg-green-100 text-green-800',
  freemium: 'bg-blue-100 text-blue-800',
  paid: 'bg-orange-100 text-orange-800',
  enterprise: 'bg-purple-100 text-purple-800',
};

export const PLATFORMS = ['Web', 'API', 'Desktop', 'Mobile', 'CLI'];

export const CATEGORY_ICONS = {
  writing: 'PenLine',
  coding: 'Code2',
  design: 'Palette',
  productivity: 'Zap',
  research: 'Search',
  'video-audio': 'Video',
  'data-analytics': 'BarChart2',
  marketing: 'Megaphone',
  'hr-recruitment': 'Users',
  'customer-support': 'Headphones',
};

export const SORT_OPTIONS = [
  { value: 'newest', label: 'Newest' },
  { value: 'most_reviewed', label: 'Most Reviewed' },
  { value: 'alphabetical', label: 'Alphabetical' },
  { value: 'top_rated', label: 'Top Rated' },
];
