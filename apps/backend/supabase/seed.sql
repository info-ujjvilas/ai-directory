-- =============================================
-- ITARIUM AI Hub — Comprehensive Seed Data
-- 10 Categories + 55 AI Tools
-- =============================================

DO $$
DECLARE
  -- Category IDs
  cat_writing UUID;
  cat_coding UUID;
  cat_design UUID;
  cat_productivity UUID;
  cat_research UUID;
  cat_video UUID;
  cat_data UUID;
  cat_marketing UUID;
  cat_hr UUID;
  cat_support UUID;

  -- Tool IDs
  tool_chatgpt UUID;
  tool_claude UUID;
  tool_gemini UUID;
  tool_jasper UUID;
  tool_grammarly UUID;
  tool_github_copilot UUID;
  tool_cursor UUID;
  tool_tabnine UUID;
  tool_codeium UUID;
  tool_replit UUID;
  tool_midjourney UUID;
  tool_dalle UUID;
  tool_stable_diffusion UUID;
  tool_canva_ai UUID;
  tool_adobe_firefly UUID;
  tool_notion_ai UUID;
  tool_otter_ai UUID;
  tool_reclaim_ai UUID;
  tool_motion UUID;
  tool_mem_ai UUID;
  tool_perplexity UUID;
  tool_elicit UUID;
  tool_consensus UUID;
  tool_scite UUID;
  tool_semantic_scholar UUID;
  tool_runway UUID;
  tool_synthesia UUID;
  tool_descript UUID;
  tool_elevenlabs UUID;
  tool_mubert UUID;
  tool_tableau_ai UUID;
  tool_julius_ai UUID;
  tool_obviously_ai UUID;
  tool_polymer UUID;
  tool_pecan_ai UUID;
  tool_copy_ai UUID;
  tool_persado UUID;
  tool_albert_ai UUID;
  tool_phrasee UUID;
  tool_brandwatch UUID;
  tool_manatal UUID;
  tool_fetcher UUID;
  tool_paradox UUID;
  tool_pymetrics UUID;
  tool_humanly UUID;
  tool_intercom_ai UUID;
  tool_tidio UUID;
  tool_freshdesk_ai UUID;
  tool_zendesk_ai UUID;
  tool_forethought UUID;
  tool_writesonic UUID;
  tool_rytr UUID;
  tool_sudowrite UUID;
  tool_wordtune UUID;
  tool_quillbot UUID;

  -- Tag IDs
  tag_nlp UUID;
  tag_generative UUID;
  tag_automation UUID;
  tag_collaboration UUID;
  tag_api UUID;
  tag_mobile UUID;
  tag_enterprise UUID;
  tag_open_source UUID;
  tag_real_time UUID;
  tag_multimodal UUID;
  tag_code_review UUID;
  tag_image_gen UUID;
  tag_video_gen UUID;
  tag_voice UUID;
  tag_analytics UUID;
  tag_seo UUID;
  tag_recruiting UUID;
  tag_chatbot UUID;
  tag_summarization UUID;
  tag_translation UUID;

BEGIN

-- =============================================
-- INSERT CATEGORIES
-- =============================================
INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Writing', 'writing', 'AI tools for content creation, copywriting, and text generation', 'PenLine', 1)
  RETURNING id INTO cat_writing;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Coding', 'coding', 'AI-powered coding assistants, code generation, and developer tools', 'Code2', 2)
  RETURNING id INTO cat_coding;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Design', 'design', 'AI tools for graphic design, image generation, and visual creation', 'Palette', 3)
  RETURNING id INTO cat_design;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Productivity', 'productivity', 'AI tools for task management, scheduling, and workflow optimization', 'Zap', 4)
  RETURNING id INTO cat_productivity;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Research', 'research', 'AI tools for research, academic papers, and knowledge discovery', 'Search', 5)
  RETURNING id INTO cat_research;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Video & Audio', 'video-audio', 'AI tools for video editing, voice synthesis, and audio production', 'Video', 6)
  RETURNING id INTO cat_video;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Data & Analytics', 'data-analytics', 'AI tools for data analysis, visualization, and predictive analytics', 'BarChart2', 7)
  RETURNING id INTO cat_data;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Marketing', 'marketing', 'AI tools for marketing campaigns, SEO, and brand management', 'Megaphone', 8)
  RETURNING id INTO cat_marketing;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'HR & Recruitment', 'hr-recruitment', 'AI tools for talent acquisition, screening, and HR management', 'Users', 9)
  RETURNING id INTO cat_hr;

INSERT INTO categories (id, name, slug, description, icon, sort_order) VALUES
  (gen_random_uuid(), 'Customer Support', 'customer-support', 'AI tools for customer service, helpdesks, and support automation', 'Headphones', 10)
  RETURNING id INTO cat_support;

-- =============================================
-- INSERT TAGS
-- =============================================
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'NLP', 'nlp') RETURNING id INTO tag_nlp;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Generative AI', 'generative-ai') RETURNING id INTO tag_generative;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Automation', 'automation') RETURNING id INTO tag_automation;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Collaboration', 'collaboration') RETURNING id INTO tag_collaboration;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'API Access', 'api-access') RETURNING id INTO tag_api;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Mobile App', 'mobile-app') RETURNING id INTO tag_mobile;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Enterprise', 'enterprise') RETURNING id INTO tag_enterprise;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Open Source', 'open-source') RETURNING id INTO tag_open_source;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Real-time', 'real-time') RETURNING id INTO tag_real_time;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Multimodal', 'multimodal') RETURNING id INTO tag_multimodal;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Code Review', 'code-review') RETURNING id INTO tag_code_review;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Image Generation', 'image-generation') RETURNING id INTO tag_image_gen;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Video Generation', 'video-generation') RETURNING id INTO tag_video_gen;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Voice Synthesis', 'voice-synthesis') RETURNING id INTO tag_voice;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Analytics', 'analytics') RETURNING id INTO tag_analytics;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'SEO', 'seo') RETURNING id INTO tag_seo;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Recruiting', 'recruiting') RETURNING id INTO tag_recruiting;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Chatbot', 'chatbot') RETURNING id INTO tag_chatbot;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Summarization', 'summarization') RETURNING id INTO tag_summarization;
INSERT INTO tags (id, name, slug) VALUES
  (gen_random_uuid(), 'Translation', 'translation') RETURNING id INTO tag_translation;

-- =============================================
-- INSERT TOOLS — WRITING CATEGORY (7 tools)
-- =============================================

-- 1. ChatGPT
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'ChatGPT', 'chatgpt',
  'The world''s most popular AI chatbot for writing and content creation',
  'ChatGPT by OpenAI is a large language model chatbot that can assist with writing articles, emails, reports, creative content, and much more. It understands context, follows instructions, and can produce high-quality text across virtually any topic. With GPT-4, it supports multimodal inputs including images. Widely used for drafting, editing, brainstorming, and summarizing content.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1200px-ChatGPT_logo.svg.png',
  'https://chat.openai.com',
  cat_writing,
  ARRAY['Web', 'API', 'Mobile'],
  true, false, true)
RETURNING id INTO tool_chatgpt;

-- 2. Claude
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Claude', 'claude',
  'Anthropic''s safe, helpful AI assistant for long-form writing and analysis',
  'Claude by Anthropic is an AI assistant designed to be helpful, harmless, and honest. It excels at long-form writing, complex analysis, summarizing lengthy documents, and nuanced conversations. Claude supports very long context windows (up to 200K tokens), making it ideal for processing entire books, legal documents, or codebases. Known for its thoughtful, well-reasoned responses.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Claude_AI_logo.svg/1200px-Claude_AI_logo.svg.png',
  'https://claude.ai',
  cat_writing,
  ARRAY['Web', 'API'],
  true, false, true)
RETURNING id INTO tool_claude;

-- 3. Gemini
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Gemini', 'gemini',
  'Google''s most capable multimodal AI model for writing and reasoning',
  'Google Gemini is a family of multimodal large language models designed to understand and generate text, code, images, audio, and video. Gemini Ultra excels at complex reasoning, creative writing, and coding tasks. It integrates seamlessly with Google Workspace, allowing AI-powered drafting in Docs, Gmail, and Slides. Available via Google AI Studio and the Gemini app.',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Google_Gemini_logo.svg/1200px-Google_Gemini_logo.svg.png',
  'https://gemini.google.com',
  cat_writing,
  ARRAY['Web', 'API', 'Mobile'],
  true, true, true)
RETURNING id INTO tool_gemini;

-- 4. Jasper AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Jasper AI', 'jasper-ai',
  'Enterprise AI writing platform for marketing and content teams',
  'Jasper is an enterprise-grade AI content platform built for marketing teams. It offers over 50 writing templates covering blog posts, social media copy, ad headlines, email campaigns, and product descriptions. Jasper integrates with SEO tools like Surfer SEO and supports brand voice training so all content remains on-brand. Includes a Chrome extension and collaboration features for teams.',
  NULL,
  'https://www.jasper.ai',
  cat_writing,
  ARRAY['Web', 'API'],
  false, false, true)
RETURNING id INTO tool_jasper;

-- 5. Grammarly
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Grammarly', 'grammarly',
  'AI writing assistant for grammar, clarity, and tone improvement',
  'Grammarly uses AI to help users write with confidence. It checks grammar, spelling, punctuation, and style in real-time across all platforms. GrammarlyGO provides generative AI features for rewriting, drafting, and ideation. Ideal for professionals who need polished communication in emails, documents, and social posts. Offers browser extension, desktop app, and Microsoft Office integration.',
  NULL,
  'https://www.grammarly.com',
  cat_writing,
  ARRAY['Web', 'Desktop', 'Mobile'],
  true, false, true)
RETURNING id INTO tool_grammarly;

-- 6. Writesonic
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Writesonic', 'writesonic',
  'AI writing tool for SEO-optimized blog posts and marketing content',
  'Writesonic is an AI-powered writing platform that generates SEO-optimized content at scale. It features Chatsonic (an AI chatbot), Botsonic (custom chatbots), and an Article Writer that produces long-form content with real-time web access. Writesonic supports 25+ languages and integrates with Surfer SEO for optimized articles. Ideal for content marketers and bloggers.',
  NULL,
  'https://writesonic.com',
  cat_writing,
  ARRAY['Web', 'API'],
  false, true, true)
RETURNING id INTO tool_writesonic;

-- 7. Rytr
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Rytr', 'rytr',
  'Affordable AI writing assistant with 40+ use cases and templates',
  'Rytr is an affordable AI writing assistant designed for individuals and small businesses. It offers 40+ use cases including blog writing, email drafting, ad copy, product descriptions, and social media posts. Rytr supports 30+ languages and 20+ tones of voice. The Chrome extension enables AI writing directly in Gmail, WordPress, and other platforms. Simple interface with a generous free tier.',
  NULL,
  'https://rytr.me',
  cat_writing,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_rytr;

-- =============================================
-- INSERT TOOLS — CODING CATEGORY (6 tools)
-- =============================================

-- 8. GitHub Copilot
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'GitHub Copilot', 'github-copilot',
  'AI pair programmer that suggests code and entire functions in real-time',
  'GitHub Copilot is an AI coding assistant powered by OpenAI Codex that integrates directly into VS Code, JetBrains, and other IDEs. It suggests entire lines, functions, and boilerplate code as you type. Copilot understands context from comments and existing code, making it effective for multiple programming languages. GitHub Copilot Chat enables conversational coding assistance and debugging.',
  NULL,
  'https://github.com/features/copilot',
  cat_coding,
  ARRAY['Desktop', 'API'],
  true, false, true)
RETURNING id INTO tool_github_copilot;

-- 9. Cursor
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Cursor', 'cursor',
  'AI-first code editor built on VS Code for pair programming with GPT-4',
  'Cursor is an AI-native code editor built as a fork of VS Code, deeply integrating GPT-4 and Claude for an advanced pair programming experience. It can edit multiple lines simultaneously, understand your entire codebase, and apply diffs across files. Cursor''s Chat mode lets you ask questions about your code, and it can generate entire features from natural language descriptions.',
  NULL,
  'https://cursor.sh',
  cat_coding,
  ARRAY['Desktop'],
  true, true, true)
RETURNING id INTO tool_cursor;

-- 10. Tabnine
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Tabnine', 'tabnine',
  'AI code completion tool with privacy-first, on-premise deployment options',
  'Tabnine is an AI coding assistant specializing in code completion with a strong focus on privacy and security. It offers cloud-based and on-premise deployment, making it suitable for enterprises with strict data policies. Tabnine learns from your codebase and team patterns to provide personalized suggestions. Supports 80+ programming languages and integrates with all major IDEs.',
  NULL,
  'https://www.tabnine.com',
  cat_coding,
  ARRAY['Desktop', 'API'],
  false, false, true)
RETURNING id INTO tool_tabnine;

-- 11. Codeium
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Codeium', 'codeium',
  'Free AI coding assistant with autocomplete and chat for 70+ languages',
  'Codeium is a free AI-powered code acceleration toolkit that provides intelligent autocomplete, code generation, and a conversational chat interface. It supports 70+ programming languages and integrates with 40+ IDEs. Codeium offers enterprise plans with self-hosted deployment. Unlike competitors, its individual use is completely free with no usage limits. Notable for fast completion speed and accuracy.',
  NULL,
  'https://codeium.com',
  cat_coding,
  ARRAY['Desktop', 'Web'],
  false, false, true)
RETURNING id INTO tool_codeium;

-- 12. Replit AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Replit AI', 'replit-ai',
  'Cloud-based AI coding environment for building and deploying apps instantly',
  'Replit is an AI-powered cloud development environment that lets you code, collaborate, and deploy apps from any browser. Replit AI (Ghostwriter) provides code completion, code explanation, and AI-generated code from natural language. It supports 50+ languages, instant deployment, and collaborative multiplayer coding. Ideal for rapid prototyping, learning, and sharing code projects.',
  NULL,
  'https://replit.com',
  cat_coding,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_replit;

-- 13. Sudowrite
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Sudowrite', 'sudowrite',
  'AI writing partner designed specifically for fiction and creative writers',
  'Sudowrite is an AI writing tool built specifically for fiction writers. It offers unique features like Describe (sensory details), Brainstorm (plot ideas), Rewrite (alternative phrasing), and Story Engine (full novel generation). Powered by GPT-4, it understands narrative structure and character voice. Sudowrite helps overcome writer''s block and accelerates the creative writing process.',
  NULL,
  'https://www.sudowrite.com',
  cat_writing,
  ARRAY['Web'],
  false, true, true)
RETURNING id INTO tool_sudowrite;

-- =============================================
-- INSERT TOOLS — DESIGN CATEGORY (5 tools)
-- =============================================

-- 14. Midjourney
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Midjourney', 'midjourney',
  'Stunning AI image generation through Discord with artistic quality',
  'Midjourney is an AI image generation service accessible through Discord that creates highly artistic, photorealistic images from text prompts. Known for its distinctive aesthetic quality and ability to generate complex compositions, it is widely used by designers, artists, and marketers. Version 6 supports text rendering in images, style references, and character consistency across generations.',
  NULL,
  'https://www.midjourney.com',
  cat_design,
  ARRAY['Web'],
  true, false, true)
RETURNING id INTO tool_midjourney;

-- 15. DALL-E 3
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'DALL-E 3', 'dall-e-3',
  'OpenAI''s image generation model with superior prompt adherence',
  'DALL-E 3 by OpenAI generates highly accurate images from detailed text descriptions. It integrates natively with ChatGPT Plus, allowing conversational refinement of images. DALL-E 3 excels at following complex prompts accurately, rendering text in images, and producing consistent characters. Available through the OpenAI API for developers and via Bing Image Creator for free.',
  NULL,
  'https://openai.com/dall-e-3',
  cat_design,
  ARRAY['Web', 'API'],
  false, false, true)
RETURNING id INTO tool_dalle;

-- 16. Stable Diffusion
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Stable Diffusion', 'stable-diffusion',
  'Open-source AI image generator with unlimited local generation capabilities',
  'Stable Diffusion is an open-source latent text-to-image diffusion model that can run locally on consumer hardware. With thousands of fine-tuned community models on Civitai and HuggingFace, it offers unparalleled customization. Supports image-to-image, inpainting, upscaling, and ControlNet for precise composition control. Available as Stable Diffusion XL (SDXL) and Stable Diffusion 3.',
  NULL,
  'https://stability.ai',
  cat_design,
  ARRAY['Desktop', 'API', 'Web'],
  false, false, true)
RETURNING id INTO tool_stable_diffusion;

-- 17. Canva AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Canva AI', 'canva-ai',
  'Design platform with AI-powered tools for creating stunning visuals',
  'Canva has integrated powerful AI features including Magic Studio, Text to Image, Magic Write (AI copywriting), Background Remover, Magic Eraser, and AI-powered design suggestions. With over 100 million templates, Canva AI helps non-designers create professional-quality graphics, presentations, social posts, and videos. The Magic Design feature generates complete designs from a single prompt.',
  NULL,
  'https://www.canva.com',
  cat_design,
  ARRAY['Web', 'Mobile', 'Desktop'],
  true, false, true)
RETURNING id INTO tool_canva_ai;

-- 18. Adobe Firefly
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Adobe Firefly', 'adobe-firefly',
  'Adobe''s generative AI for creative professionals, commercially safe',
  'Adobe Firefly is a family of creative generative AI models integrated into Adobe Creative Cloud products including Photoshop, Illustrator, and Premiere Pro. Trained on Adobe Stock images and public domain content, Firefly is commercially safe to use. Features include Generative Fill, Generative Expand, Text to Image, Text Effects, and Recolor. Designed for professional creative workflows.',
  NULL,
  'https://firefly.adobe.com',
  cat_design,
  ARRAY['Web', 'Desktop'],
  false, true, true)
RETURNING id INTO tool_adobe_firefly;

-- =============================================
-- INSERT TOOLS — PRODUCTIVITY CATEGORY (5 tools)
-- =============================================

-- 19. Notion AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Notion AI', 'notion-ai',
  'AI assistant built into Notion for writing, summarizing, and organizing',
  'Notion AI is embedded directly within the Notion workspace, enabling users to draft content, summarize meeting notes, extract action items, translate text, and brainstorm ideas without leaving their workflow. It can analyze existing databases and documents to answer questions. Ideal for teams already using Notion for project management, wikis, and documentation.',
  NULL,
  'https://www.notion.so/product/ai',
  cat_productivity,
  ARRAY['Web', 'Desktop', 'Mobile'],
  true, false, true)
RETURNING id INTO tool_notion_ai;

-- 20. Otter.ai
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Otter.ai', 'otter-ai',
  'AI meeting assistant that transcribes, summarizes, and captures action items',
  'Otter.ai is an AI meeting assistant that automatically transcribes audio from meetings in real-time, identifies speakers, generates meeting summaries, and extracts action items. It integrates with Zoom, Microsoft Teams, Google Meet, and calendar apps to join meetings automatically. Otter AI Chat lets you ask questions about any past meeting. Supports multiple languages and offers team collaboration features.',
  NULL,
  'https://otter.ai',
  cat_productivity,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_otter_ai;

-- 21. Reclaim AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Reclaim AI', 'reclaim-ai',
  'AI scheduling assistant that automatically protects time for your priorities',
  'Reclaim AI is an intelligent calendar assistant that automatically schedules tasks, habits, and focus time around your existing meetings. It integrates with Google Calendar and analyzes your calendar patterns to find the best time slots. Features include smart 1:1 meeting scheduling, habit tracking, task prioritization, and team scheduling analytics. Helps maintain work-life balance by protecting personal time.',
  NULL,
  'https://reclaim.ai',
  cat_productivity,
  ARRAY['Web'],
  false, true, true)
RETURNING id INTO tool_reclaim_ai;

-- 22. Motion
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Motion', 'motion',
  'AI project manager that automatically plans your day and reschedules tasks',
  'Motion uses AI to automatically build and manage your daily schedule, prioritizing tasks by deadline and importance. When meetings change or new tasks arrive, Motion instantly rebuilds your plan. It combines task management, project planning, and calendar into one unified tool. Particularly effective for busy professionals juggling multiple projects with tight deadlines.',
  NULL,
  'https://www.usemotion.com',
  cat_productivity,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_motion;

-- 23. Mem.ai
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Mem.ai', 'mem-ai',
  'AI-powered personal knowledge base that organizes and surfaces your notes',
  'Mem is a self-organizing workspace that uses AI to connect your notes, ideas, and information without manual tagging or folder organization. Its AI can find relevant notes, summarize your knowledge on any topic, and draft new content based on your existing notes. Mem Chat allows conversational access to your entire knowledge base. Integrates with email, Slack, and calendar.',
  NULL,
  'https://mem.ai',
  cat_productivity,
  ARRAY['Web', 'Mobile'],
  false, true, true)
RETURNING id INTO tool_mem_ai;

-- =============================================
-- INSERT TOOLS — RESEARCH CATEGORY (5 tools)
-- =============================================

-- 24. Perplexity AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Perplexity AI', 'perplexity-ai',
  'AI-powered search engine with cited answers and real-time web access',
  'Perplexity AI is an AI-powered answer engine that provides cited, real-time responses to research questions by searching the web. Unlike traditional search engines, it provides synthesized answers with source citations rather than a list of links. Supports follow-up questions, file uploads for analysis, and Collections for organizing research. Perplexity Pro includes access to GPT-4, Claude, and Llama models.',
  NULL,
  'https://www.perplexity.ai',
  cat_research,
  ARRAY['Web', 'Mobile', 'API'],
  true, false, true)
RETURNING id INTO tool_perplexity;

-- 25. Elicit
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Elicit', 'elicit',
  'AI research assistant for finding, summarizing, and analyzing academic papers',
  'Elicit is an AI research assistant designed to accelerate literature reviews and academic research. It can find relevant research papers without exact keyword matches, automatically extract key data from papers, and synthesize findings across multiple studies. Elicit''s workflow features include paper summarization, data extraction tables, and concept mapping. Built specifically for researchers and scientists.',
  NULL,
  'https://elicit.com',
  cat_research,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_elicit;

-- 26. Consensus
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Consensus', 'consensus',
  'AI search engine for scientific research with consensus meters',
  'Consensus is an AI-powered search engine specifically for scientific papers. It extracts and synthesizes findings from peer-reviewed research, providing a "consensus meter" that shows what percentage of studies agree or disagree on a topic. Ideal for evidence-based decision making, medical research, and policy analysis. Offers AI-generated study snapshots and citation export.',
  NULL,
  'https://consensus.app',
  cat_research,
  ARRAY['Web'],
  false, true, true)
RETURNING id INTO tool_consensus;

-- 27. Scite.ai
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Scite.ai', 'scite-ai',
  'AI tool that shows how scientific papers are cited and supported',
  'Scite is an AI platform that helps researchers evaluate the credibility of scientific claims by showing how papers cite each other — whether they support, contradict, or simply mention a claim. It features a Smart Citations database of over 1.2 billion citations. Scite Assistant provides AI-powered research assistance grounded in scientific literature. Browser extension for instant citation context.',
  NULL,
  'https://scite.ai',
  cat_research,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_scite;

-- 28. Semantic Scholar
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Semantic Scholar', 'semantic-scholar',
  'Free AI-powered academic search engine with paper recommendations',
  'Semantic Scholar is a free AI-powered research tool built by the Allen Institute for AI. It uses machine learning to analyze and understand scientific literature, offering intelligent search, paper recommendations, citation graphs, and author disambiguation. The TLDR feature provides one-sentence summaries of papers. Its open research corpus includes over 200 million papers across all fields.',
  NULL,
  'https://www.semanticscholar.org',
  cat_research,
  ARRAY['Web', 'API'],
  false, false, true)
RETURNING id INTO tool_semantic_scholar;

-- =============================================
-- INSERT TOOLS — VIDEO & AUDIO CATEGORY (5 tools)
-- =============================================

-- 29. Runway ML
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Runway ML', 'runway-ml',
  'AI-powered video generation and editing for creative professionals',
  'Runway is an AI creative platform offering Gen-2 (text/image to video), Magic Tools (background removal, inpainting, slow motion), and a full AI video editor. Used by major studios and independent creators, Runway enables creation of professional video content without traditional filming. Supports motion brush for targeted animation, camera controls for cinematic movements, and 4K export.',
  NULL,
  'https://runwayml.com',
  cat_video,
  ARRAY['Web'],
  true, false, true)
RETURNING id INTO tool_runway;

-- 30. Synthesia
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Synthesia', 'synthesia',
  'AI video platform for creating professional videos with AI avatars',
  'Synthesia enables creation of professional AI videos using lifelike AI avatars and text-to-speech technology. Simply type a script, choose an avatar and language, and Synthesia generates a professional video in minutes. Supports 140+ languages, 230+ AI avatars, custom avatar creation, and branded templates. Widely used for corporate training, onboarding, marketing, and e-learning content.',
  NULL,
  'https://www.synthesia.io',
  cat_video,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_synthesia;

-- 31. Descript
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Descript', 'descript',
  'AI-powered podcast and video editor that works like a text document',
  'Descript revolutionizes audio and video editing by allowing you to edit media as if it were a text document. Delete words from the transcript to remove them from the recording. Features include Overdub (AI voice cloning), automatic transcription, filler word removal, eye contact correction, Studio Sound (noise removal), and Green Screen. Ideal for podcasters, YouTubers, and video marketers.',
  NULL,
  'https://www.descript.com',
  cat_video,
  ARRAY['Desktop', 'Web'],
  true, false, true)
RETURNING id INTO tool_descript;

-- 32. ElevenLabs
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'ElevenLabs', 'elevenlabs',
  'Leading AI voice synthesis platform with ultra-realistic text-to-speech',
  'ElevenLabs offers the most realistic AI voice synthesis available, with 29 languages, 1000+ voices, and voice cloning from as little as 1 minute of audio. Its text-to-speech API is widely used for audiobooks, dubbing, voiceovers, and conversational AI applications. Features include Voice Design (create voices from description), Dubbing (translate videos while preserving speaker voices), and Projects for long-form audio.',
  NULL,
  'https://elevenlabs.io',
  cat_video,
  ARRAY['Web', 'API'],
  true, true, true)
RETURNING id INTO tool_elevenlabs;

-- 33. Mubert
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Mubert', 'mubert',
  'AI music generation platform for royalty-free background music',
  'Mubert uses AI to generate unique, royalty-free music tracks for content creators, developers, and brands. Simply describe the mood, genre, and duration, and Mubert generates a custom track instantly. It also offers a developer API for integrating generative music into apps and games, a personal playlist app, and B2B licensing for commercial use. Supports continuous ambient music streams.',
  NULL,
  'https://mubert.com',
  cat_video,
  ARRAY['Web', 'API', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_mubert;

-- =============================================
-- INSERT TOOLS — DATA & ANALYTICS CATEGORY (5 tools)
-- =============================================

-- 34. Tableau AI (Einstein)
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Tableau AI', 'tableau-ai',
  'AI-powered analytics platform for enterprise data visualization',
  'Tableau AI (powered by Einstein) brings generative AI capabilities to the leading data visualization platform. It enables natural language queries for data exploration, automatic chart generation, AI-powered insights, and predictive analytics. Tableau integrates with Salesforce Einstein and can analyze data from hundreds of sources. Ideal for enterprise data teams needing self-service analytics at scale.',
  NULL,
  'https://www.tableau.com/ai',
  cat_data,
  ARRAY['Web', 'Desktop'],
  false, false, true)
RETURNING id INTO tool_tableau_ai;

-- 35. Julius AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Julius AI', 'julius-ai',
  'Conversational AI data analyst for non-technical users',
  'Julius AI is a data analysis tool that lets you upload spreadsheets, databases, or connect to data sources and analyze them through natural language conversation. Ask questions about your data, request visualizations, perform statistical analysis, and get plain-English explanations of findings. Julius can write and execute Python code under the hood, making advanced data science accessible to non-technical users.',
  NULL,
  'https://julius.ai',
  cat_data,
  ARRAY['Web'],
  false, true, true)
RETURNING id INTO tool_julius_ai;

-- 36. Obviously AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Obviously AI', 'obviously-ai',
  'No-code predictive analytics and machine learning platform',
  'Obviously AI enables business users to build predictive ML models in minutes without any coding. Upload a CSV, choose a prediction target, and Obviously AI automatically selects the best algorithm, trains the model, and presents results with plain English explanations. Use cases include churn prediction, sales forecasting, risk scoring, and customer segmentation. Real-time predictions via API.',
  NULL,
  'https://www.obviously.ai',
  cat_data,
  ARRAY['Web', 'API'],
  false, false, true)
RETURNING id INTO tool_obviously_ai;

-- 37. Polymer
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Polymer', 'polymer',
  'AI-powered spreadsheet and database tool for instant data insights',
  'Polymer transforms spreadsheet data into interactive, searchable databases with AI-powered insights. Upload any CSV or connect to Google Sheets, and Polymer automatically creates visualizations, identifies trends, and allows natural language querying. Features include shareable dashboards, embedded analytics, and AI-generated insights. No SQL or coding knowledge required for data exploration.',
  NULL,
  'https://www.polymersearch.com',
  cat_data,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_polymer;

-- 38. Pecan AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Pecan AI', 'pecan-ai',
  'Predictive analytics platform for business teams using SQL workflows',
  'Pecan AI is a predictive analytics platform that integrates with existing data warehouses and BI tools. Business analysts use familiar SQL to prepare data, and Pecan''s AutoML automatically builds and deploys predictive models. Use cases include LTV prediction, churn prevention, lead scoring, and demand forecasting. Connects natively with Snowflake, BigQuery, Redshift, and Databricks.',
  NULL,
  'https://www.pecan.ai',
  cat_data,
  ARRAY['Web'],
  false, true, true)
RETURNING id INTO tool_pecan_ai;

-- =============================================
-- INSERT TOOLS — MARKETING CATEGORY (5 tools)
-- =============================================

-- 39. Copy.ai
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Copy.ai', 'copy-ai',
  'AI marketing copy platform for sales teams and go-to-market workflows',
  'Copy.ai is an AI platform for marketing and sales teams that automates go-to-market content creation. It features 90+ copywriting tools for ads, emails, social posts, and landing pages. Copy.ai Workflows enable multi-step content automation pipelines. Infobase stores brand voice and product information for consistent output. Popular for B2B sales outreach sequences and content marketing at scale.',
  NULL,
  'https://www.copy.ai',
  cat_marketing,
  ARRAY['Web', 'API'],
  true, false, true)
RETURNING id INTO tool_copy_ai;

-- 40. Persado
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Persado', 'persado',
  'AI platform that generates mathematically optimal marketing language',
  'Persado uses AI and emotional language intelligence to generate marketing messages that drive measurable performance improvements. It analyzes words, phrases, and emotional triggers to find the optimal combination for your audience. Enterprise clients report 30-60% lift in marketing performance. Integrates with major email, SMS, and digital advertising platforms. Used by Fortune 500 companies for personalized messaging at scale.',
  NULL,
  'https://www.persado.com',
  cat_marketing,
  ARRAY['Web', 'API'],
  false, false, true)
RETURNING id INTO tool_persado;

-- 41. Albert AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Albert AI', 'albert-ai',
  'Autonomous digital marketing AI that manages and optimizes ad campaigns',
  'Albert is an autonomous AI marketing platform that independently manages cross-channel digital advertising campaigns. It makes thousands of optimization decisions daily across paid search, social, and programmatic channels, adjusting bids, budgets, audiences, and creative in real-time. Albert identifies new audience segments and tests hypotheses without manual intervention. Designed for enterprise marketing teams seeking campaign efficiency.',
  NULL,
  'https://albert.ai',
  cat_marketing,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_albert_ai;

-- 42. Phrasee
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Phrasee', 'phrasee',
  'AI-powered email subject line and marketing copy optimization',
  'Phrasee uses deep learning and natural language generation to create and optimize marketing language for email subject lines, push notifications, SMS, and social ads. It learns from your brand voice and audience engagement data to generate and test high-performing copy variations. Phrasee''s AI continuously optimizes based on real-time performance data, improving open rates and conversions.',
  NULL,
  'https://phrasee.co',
  cat_marketing,
  ARRAY['Web', 'API'],
  false, true, true)
RETURNING id INTO tool_phrasee;

-- 43. Brandwatch
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Brandwatch', 'brandwatch',
  'AI-powered consumer intelligence and social media monitoring platform',
  'Brandwatch is an AI-driven consumer intelligence platform that monitors and analyzes conversations across the web and social media. It tracks brand mentions, sentiment, trends, and competitive intelligence from billions of data points. The AI-powered Iris assistant surfaces insights and anomalies automatically. Features include audience analysis, content performance tracking, crisis detection, and influencer identification.',
  NULL,
  'https://www.brandwatch.com',
  cat_marketing,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_brandwatch;

-- =============================================
-- INSERT TOOLS — HR & RECRUITMENT CATEGORY (5 tools)
-- =============================================

-- 44. Manatal
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Manatal', 'manatal',
  'AI-powered ATS and recruitment software for fast-growing teams',
  'Manatal is an AI-powered applicant tracking system (ATS) that streamlines the entire recruitment process. Its AI engine automatically scores and ranks candidates based on job requirements, enriches profiles from social media, and suggests the best matches from your talent pool. Features include job board integrations, collaborative hiring pipelines, AI-generated job descriptions, and recruitment analytics dashboards.',
  NULL,
  'https://www.manatal.com',
  cat_hr,
  ARRAY['Web', 'Mobile'],
  true, false, true)
RETURNING id INTO tool_manatal;

-- 45. Fetcher
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Fetcher', 'fetcher',
  'AI talent sourcing platform that automates candidate outreach',
  'Fetcher is an AI-powered talent sourcing platform that automatically finds and engages qualified candidates. Its AI searches across multiple databases to identify matching profiles, crafts personalized outreach emails, and manages follow-up sequences. Integrates with major ATS platforms and CRMs. Fetcher learns from recruiter feedback to improve candidate quality over time, reducing time-to-hire significantly.',
  NULL,
  'https://fetcher.ai',
  cat_hr,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_fetcher;

-- 46. Paradox (Olivia)
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Paradox (Olivia)', 'paradox-olivia',
  'Conversational AI recruiting assistant for high-volume hiring',
  'Paradox''s conversational AI, Olivia, automates the early stages of the recruiting process through natural conversations via text, WhatsApp, or web chat. Olivia screens candidates, schedules interviews, answers FAQs, collects applications, and sends reminders. Designed for high-volume hiring in retail, hospitality, and healthcare. Integrates with 60+ ATS platforms and reduces time-to-hire from days to minutes.',
  NULL,
  'https://www.paradox.ai',
  cat_hr,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_paradox;

-- 47. Pymetrics
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Pymetrics', 'pymetrics',
  'AI-based behavioral assessment platform for bias-free hiring',
  'Pymetrics uses neuroscience-based games and AI to measure cognitive and emotional traits for unbiased talent matching. Candidates play 12 short games that measure attention, memory, risk tolerance, and other traits. The AI then matches candidates to roles based on the traits of successful employees, reducing unconscious bias in hiring. Used by major enterprises for fair, data-driven talent decisions.',
  NULL,
  'https://www.pymetrics.ai',
  cat_hr,
  ARRAY['Web', 'Mobile'],
  false, true, true)
RETURNING id INTO tool_pymetrics;

-- 48. Humanly
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Humanly', 'humanly',
  'AI interview automation platform for candidate screening at scale',
  'Humanly automates candidate screening and interview scheduling through AI-powered conversations. Its AI conducts structured screening interviews via text or voice, asks role-specific questions, evaluates responses, and provides ranked candidate summaries to recruiters. Features include bias mitigation, DEI analytics, ATS integration, and automated reference checks. Reduces recruiter workload by 40-60% for high-volume roles.',
  NULL,
  'https://www.humanly.io',
  cat_hr,
  ARRAY['Web'],
  false, false, true)
RETURNING id INTO tool_humanly;

-- =============================================
-- INSERT TOOLS — CUSTOMER SUPPORT CATEGORY (5 tools)
-- =============================================

-- 49. Intercom AI (Fin)
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Intercom AI (Fin)', 'intercom-ai-fin',
  'AI customer service agent that resolves 50%+ of support queries instantly',
  'Intercom''s Fin is an AI customer service agent powered by GPT-4 that answers customer questions instantly using your knowledge base and support content. It resolves complex queries conversationally and seamlessly hands off to human agents when needed. Fin has been shown to resolve 50%+ of queries without human intervention. Integrates natively within the Intercom customer service platform.',
  NULL,
  'https://www.intercom.com/fin',
  cat_support,
  ARRAY['Web'],
  true, false, true)
RETURNING id INTO tool_intercom_ai;

-- 50. Tidio
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Tidio', 'tidio',
  'AI chatbot and live chat platform for e-commerce customer support',
  'Tidio combines AI chatbots with live chat for e-commerce businesses. Its Lyro AI chatbot handles customer queries 24/7, providing instant responses based on your FAQ content. Tidio integrates with Shopify, WooCommerce, and other e-commerce platforms to access order data and provide personalized support. Features include email automation, visitor analytics, and a visual chatbot builder.',
  NULL,
  'https://www.tidio.com',
  cat_support,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_tidio;

-- 51. Freshdesk AI (Freddy)
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Freshdesk AI (Freddy)', 'freshdesk-ai-freddy',
  'AI-powered helpdesk with intelligent ticket routing and auto-resolution',
  'Freshdesk''s Freddy AI enhances customer support with intelligent ticket auto-assignment, suggested solutions, canned response recommendations, and sentiment analysis. Freddy Self Service enables AI-powered chatbots for instant resolution. Freddy Insights provides predictive analytics on support trends and agent performance. Fully integrated within the Freshdesk helpdesk platform with no additional setup.',
  NULL,
  'https://www.freshworks.com/freshdesk/freddy-ai/',
  cat_support,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_freshdesk_ai;

-- 52. Zendesk AI
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Zendesk AI', 'zendesk-ai',
  'Enterprise AI for customer service with intelligent triage and automation',
  'Zendesk AI brings intelligent automation to enterprise customer service. It offers AI-powered ticket triage, intent detection, sentiment analysis, automated responses, and intelligent routing. The AI Agent provides 24/7 automated resolution for common issues. Advanced features include workforce optimization, quality assurance scoring, and conversation intelligence. Zendesk AI is deeply integrated across all Zendesk products.',
  NULL,
  'https://www.zendesk.com/ai/',
  cat_support,
  ARRAY['Web'],
  true, false, true)
RETURNING id INTO tool_zendesk_ai;

-- 53. Forethought
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Forethought', 'forethought',
  'Generative AI for customer support automation and agent assistance',
  'Forethought is a generative AI platform for customer support that includes Solve (AI chatbot for automated resolution), Triage (intelligent ticket routing), Assist (agent copilot with suggested responses), and Discover (insights and analytics). It integrates with Zendesk, Salesforce, ServiceNow, and other helpdesk platforms. Forethought''s AI continuously learns from your support data to improve resolution rates.',
  NULL,
  'https://forethought.ai',
  cat_support,
  ARRAY['Web'],
  false, true, true)
RETURNING id INTO tool_forethought;

-- Additional tools for writing (Wordtune, QuillBot)
-- 54. Wordtune
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'Wordtune', 'wordtune',
  'AI writing companion that rewrites and improves your sentences instantly',
  'Wordtune is an AI-powered writing tool that helps you rewrite, rephrase, and improve your text. It offers multiple rewrite suggestions for any sentence, can make text more formal or casual, expand or shorten content, and translate from multiple languages. The Spices feature adds examples, counterarguments, stats, and humor to your writing. Available as a Chrome extension and web editor.',
  NULL,
  'https://www.wordtune.com',
  cat_writing,
  ARRAY['Web', 'Mobile'],
  false, false, true)
RETURNING id INTO tool_wordtune;

-- 55. QuillBot
INSERT INTO tools (id, name, slug, tagline, description, logo_url, website_url, category_id, platforms, is_featured, is_new, is_active)
VALUES (gen_random_uuid(), 'QuillBot', 'quillbot',
  'AI paraphrasing and grammar checking tool with 8 writing modes',
  'QuillBot is an AI writing assistant best known for its advanced paraphrasing tool with 8 writing modes including Standard, Fluency, Formal, Creative, and Academic. It features a summarizer, grammar checker, citation generator, and plagiarism checker. QuillBot integrates directly with Google Docs and Microsoft Word. The Co-Writer combines paraphrasing, translation, and summarization in a single workspace.',
  NULL,
  'https://quillbot.com',
  cat_writing,
  ARRAY['Web', 'Desktop'],
  false, false, true)
RETURNING id INTO tool_quillbot;

-- =============================================
-- INSERT TOOL FEATURES
-- =============================================

-- ChatGPT features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_chatgpt, 'Advanced conversational AI with GPT-4 and GPT-4o models', 0),
  (tool_chatgpt, 'Supports multimodal inputs including images, files, and voice', 1),
  (tool_chatgpt, 'Code generation, debugging, and explanation in 20+ languages', 2),
  (tool_chatgpt, 'Custom GPTs for specialized use cases and workflows', 3),
  (tool_chatgpt, 'DALL-E 3 image generation built into ChatGPT Plus', 4),
  (tool_chatgpt, 'Web browsing and real-time information retrieval', 5),
  (tool_chatgpt, 'Data analysis with Python code execution (Advanced Data Analysis)', 6),
  (tool_chatgpt, 'GPT Store with thousands of community-built applications', 7);

-- Claude features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_claude, 'Up to 200K token context window for processing large documents', 0),
  (tool_claude, 'Advanced reasoning with step-by-step thinking (Extended Thinking)', 1),
  (tool_claude, 'Code generation and review across all major programming languages', 2),
  (tool_claude, 'Nuanced analysis of complex topics with multiple perspectives', 3),
  (tool_claude, 'Artifacts feature for interactive code, documents, and apps', 4),
  (tool_claude, 'Constitutional AI for safer, more helpful responses', 5),
  (tool_claude, 'Project-based conversations with persistent memory', 6),
  (tool_claude, 'Multiple model tiers: Claude Haiku, Sonnet, and Opus', 7);

-- Gemini features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_gemini, 'Native multimodal understanding of text, images, audio, and video', 0),
  (tool_gemini, 'Deep integration with Google Workspace (Docs, Gmail, Sheets)', 1),
  (tool_gemini, 'Gemini Advanced with 1M token context window', 2),
  (tool_gemini, 'Real-time web search and Google Search integration', 3),
  (tool_gemini, 'Code generation with Gemini for Google Cloud', 4),
  (tool_gemini, 'Multiple model sizes: Nano, Flash, Pro, and Ultra', 5),
  (tool_gemini, 'YouTube video analysis and summarization', 6),
  (tool_gemini, 'Available via Google AI Studio and Vertex AI for developers', 7);

-- Jasper AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_jasper, 'Brand Voice training for consistent content output', 0),
  (tool_jasper, '50+ copywriting templates for every use case', 1),
  (tool_jasper, 'Campaigns feature for end-to-end marketing campaigns', 2),
  (tool_jasper, 'SEO mode with Surfer SEO integration', 3),
  (tool_jasper, 'Team collaboration with shared workspaces', 4),
  (tool_jasper, 'Jasper Art for AI image generation', 5),
  (tool_jasper, 'Chrome extension for writing anywhere on the web', 6),
  (tool_jasper, 'Multilingual content in 30+ languages', 7);

-- Grammarly features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_grammarly, 'Real-time grammar, spelling, and punctuation correction', 0),
  (tool_grammarly, 'Tone detection and adjustment suggestions', 1),
  (tool_grammarly, 'GrammarlyGO generative AI for drafting and rewriting', 2),
  (tool_grammarly, 'Plagiarism detection against 16 billion web pages', 3),
  (tool_grammarly, 'Works across 500,000+ apps and websites via browser extension', 4),
  (tool_grammarly, 'Microsoft Office and Google Docs integration', 5),
  (tool_grammarly, 'Team analytics and writing goals', 6),
  (tool_grammarly, 'Style guide and brand tone enforcement for teams', 7);

-- GitHub Copilot features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_github_copilot, 'Inline code completion and whole-function generation', 0),
  (tool_github_copilot, 'Copilot Chat for conversational coding assistance in IDE', 1),
  (tool_github_copilot, 'Multi-line suggestions based on natural language comments', 2),
  (tool_github_copilot, 'Code explanation and documentation generation', 3),
  (tool_github_copilot, 'Test generation for existing code', 4),
  (tool_github_copilot, 'Supports 20+ programming languages', 5),
  (tool_github_copilot, 'Works with VS Code, JetBrains, Neovim, and Visual Studio', 6),
  (tool_github_copilot, 'Copilot Enterprise with codebase-aware suggestions', 7);

-- Cursor features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_cursor, 'Codebase-aware AI that understands your entire project', 0),
  (tool_cursor, 'Multi-file editing with a single prompt', 1),
  (tool_cursor, 'Natural language to code with Composer feature', 2),
  (tool_cursor, 'AI chat sidebar for code questions and explanations', 3),
  (tool_cursor, 'Diff review for AI-generated changes before applying', 4),
  (tool_cursor, 'Choice of GPT-4, Claude, and other models', 5),
  (tool_cursor, 'Built on VS Code — all existing extensions work', 6),
  (tool_cursor, 'Auto-complete with full function and class generation', 7);

-- Midjourney features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_midjourney, 'State-of-the-art image quality with V6 model', 0),
  (tool_midjourney, 'Text rendering in images with high accuracy', 1),
  (tool_midjourney, 'Style reference for maintaining consistent aesthetics', 2),
  (tool_midjourney, 'Character reference for consistent character portrayal', 3),
  (tool_midjourney, 'Upscaling options up to 4K resolution', 4),
  (tool_midjourney, 'Inpainting (vary region) for targeted image editing', 5),
  (tool_midjourney, 'Blend multiple images for creative combinations', 6),
  (tool_midjourney, 'Negative prompting to exclude unwanted elements', 7);

-- Canva AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_canva_ai, 'Magic Studio with text-to-image generation', 0),
  (tool_canva_ai, 'Magic Write for AI-powered copywriting', 1),
  (tool_canva_ai, 'Background Remover with one click', 2),
  (tool_canva_ai, 'Magic Eraser and Magic Edit for photo manipulation', 3),
  (tool_canva_ai, 'Magic Design generates complete layouts from prompts', 4),
  (tool_canva_ai, 'AI-powered presentation generator', 5),
  (tool_canva_ai, 'Over 100 million templates across all design formats', 6),
  (tool_canva_ai, 'Brand Kit for consistent visual identity', 7);

-- Notion AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_notion_ai, 'AI writing assistant for drafting, editing, and improving content', 0),
  (tool_notion_ai, 'Meeting note summarization and action item extraction', 1),
  (tool_notion_ai, 'Q&A over your entire Notion workspace', 2),
  (tool_notion_ai, 'Instant translation of content into 50+ languages', 3),
  (tool_notion_ai, 'AI-powered brainstorming and idea generation', 4),
  (tool_notion_ai, 'Database AI for querying and analyzing structured data', 5),
  (tool_notion_ai, 'Fill in templates with AI-generated content', 6),
  (tool_notion_ai, 'No additional tool switching — works within existing workflow', 7);

-- Perplexity features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_perplexity, 'Real-time web search with cited source references', 0),
  (tool_perplexity, 'Follow-up questions with full conversational context', 1),
  (tool_perplexity, 'File and image upload for analysis and questioning', 2),
  (tool_perplexity, 'Collections for organizing and saving research', 3),
  (tool_perplexity, 'Multiple AI model access (GPT-4, Claude, Llama) in Pro', 4),
  (tool_perplexity, 'Academic search mode for peer-reviewed sources', 5),
  (tool_perplexity, 'Daily Discover feed of AI-curated news', 6),
  (tool_perplexity, 'API access for integration into applications', 7);

-- Runway ML features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_runway, 'Gen-2 text-to-video and image-to-video generation', 0),
  (tool_runway, 'Motion Brush for selective area animation', 1),
  (tool_runway, 'Background removal with Green Screen AI', 2),
  (tool_runway, 'AI-powered video inpainting and object removal', 3),
  (tool_runway, 'Infinite image expansion with Infinite Image', 4),
  (tool_runway, 'Frame interpolation for smooth slow-motion effects', 5),
  (tool_runway, 'Camera controls for cinematic movement simulation', 6),
  (tool_runway, 'Collaboration tools for creative teams', 7);

-- ElevenLabs features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_elevenlabs, 'Ultra-realistic text-to-speech in 29 languages', 0),
  (tool_elevenlabs, 'Voice cloning from 1 minute of audio with instant cloning', 1),
  (tool_elevenlabs, 'Voice Design: create unique AI voices from text description', 2),
  (tool_elevenlabs, 'AI Dubbing for translating videos while preserving speaker voice', 3),
  (tool_elevenlabs, 'Projects for publishing long-form audio content', 4),
  (tool_elevenlabs, '1000+ pre-built voices across accents and languages', 5),
  (tool_elevenlabs, 'Low-latency API for real-time voice applications', 6),
  (tool_elevenlabs, 'Pronunciation dictionaries for custom word handling', 7);

-- Manatal features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_manatal, 'AI candidate scoring and ranking based on job requirements', 0),
  (tool_manatal, 'Social media profile enrichment from LinkedIn and 20+ sources', 1),
  (tool_manatal, 'AI-generated job description builder', 2),
  (tool_manatal, 'Visual Kanban-style hiring pipeline management', 3),
  (tool_manatal, 'Integration with 2500+ job boards worldwide', 4),
  (tool_manatal, 'Customizable careers page builder', 5),
  (tool_manatal, 'Team collaboration with role-based access control', 6),
  (tool_manatal, 'Recruitment analytics and performance reporting', 7);

-- Intercom AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_intercom_ai, 'Fin AI agent resolves 50%+ of customer queries instantly', 0),
  (tool_intercom_ai, 'Powered by GPT-4 for human-like conversations', 1),
  (tool_intercom_ai, 'Seamless handoff to human agents with full context', 2),
  (tool_intercom_ai, 'Ingests knowledge base, URLs, and support content automatically', 3),
  (tool_intercom_ai, 'Multilingual support in 43+ languages', 4),
  (tool_intercom_ai, 'AI-powered ticket classification and routing', 5),
  (tool_intercom_ai, 'Agent assistance with suggested replies and summaries', 6),
  (tool_intercom_ai, 'Conversation analytics and CSAT tracking', 7);

-- Zendesk AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_zendesk_ai, 'Intelligent ticket triage with intent and sentiment detection', 0),
  (tool_zendesk_ai, 'AI Agent for 24/7 automated customer resolution', 1),
  (tool_zendesk_ai, 'Agent copilot with suggested responses and next best actions', 2),
  (tool_zendesk_ai, 'Automated ticket routing based on skills and availability', 3),
  (tool_zendesk_ai, 'AI-powered quality assurance scoring for all conversations', 4),
  (tool_zendesk_ai, 'Workforce optimization with AI forecasting', 5),
  (tool_zendesk_ai, 'Conversation intelligence and trend analysis', 6),
  (tool_zendesk_ai, 'Advanced analytics and reporting dashboards', 7);

-- Copy.ai features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_copy_ai, '90+ copywriting tools and templates for every channel', 0),
  (tool_copy_ai, 'Copy.ai Workflows for automated content pipelines', 1),
  (tool_copy_ai, 'Infobase for storing brand voice, product info, and tone', 2),
  (tool_copy_ai, 'Sales email sequences and cold outreach generation', 3),
  (tool_copy_ai, 'Blog post wizard for long-form SEO content', 4),
  (tool_copy_ai, 'Social media calendar content generation', 5),
  (tool_copy_ai, 'Team workspace with collaboration features', 6),
  (tool_copy_ai, 'API access for custom integrations', 7);

-- Julius AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_julius_ai, 'Natural language data analysis without coding knowledge', 0),
  (tool_julius_ai, 'Upload CSV, Excel, Google Sheets, or connect databases', 1),
  (tool_julius_ai, 'Automatic chart and visualization generation', 2),
  (tool_julius_ai, 'Statistical analysis and hypothesis testing', 3),
  (tool_julius_ai, 'Python code execution under the hood for complex analysis', 4),
  (tool_julius_ai, 'Plain English explanations of analytical findings', 5),
  (tool_julius_ai, 'Export results as reports, charts, or data files', 6),
  (tool_julius_ai, 'Machine learning model building through conversation', 7);

-- Writesonic features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_writesonic, 'Article Writer with real-time web access for up-to-date content', 0),
  (tool_writesonic, 'Chatsonic AI chatbot with internet access', 1),
  (tool_writesonic, 'Botsonic for building custom AI chatbots without code', 2),
  (tool_writesonic, 'SEO-optimized content with keyword integration', 3),
  (tool_writesonic, '25+ language support for global content', 4),
  (tool_writesonic, 'Brand voice customization for consistent output', 5),
  (tool_writesonic, 'Bulk content generation for large projects', 6),
  (tool_writesonic, 'Surfer SEO integration for content optimization', 7);

-- Rytr features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_rytr, '40+ use cases including blogs, emails, and ad copy', 0),
  (tool_rytr, '20+ tones of voice for different brand needs', 1),
  (tool_rytr, '30+ language support for global teams', 2),
  (tool_rytr, 'Plagiarism checker built in', 3),
  (tool_rytr, 'Chrome extension for writing anywhere on the web', 4),
  (tool_rytr, 'Custom use case creator for specialized needs', 5),
  (tool_rytr, 'SEO meta description and keyword generation', 6),
  (tool_rytr, 'Simple, clean interface for fast content creation', 7);

-- Descript features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_descript, 'Edit audio/video by editing the text transcript', 0),
  (tool_descript, 'Overdub AI voice cloning for seamless audio corrections', 1),
  (tool_descript, 'Filler word removal (um, uh, like) with one click', 2),
  (tool_descript, 'Studio Sound AI for professional audio quality', 3),
  (tool_descript, 'Eye contact correction for webcam recordings', 4),
  (tool_descript, 'Green screen background replacement', 5),
  (tool_descript, 'Multitrack recording and editing', 6),
  (tool_descript, 'Direct publishing to YouTube, podcast platforms, and Squarespace', 7);

-- Tabnine features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_tabnine, 'Privacy-first with zero data retention options', 0),
  (tool_tabnine, 'On-premise deployment for air-gapped environments', 1),
  (tool_tabnine, 'Personalized models trained on your team''s codebase', 2),
  (tool_tabnine, '80+ programming language support', 3),
  (tool_tabnine, 'Integration with all major IDEs', 4),
  (tool_tabnine, 'AI code review and quality suggestions', 5),
  (tool_tabnine, 'Team patterns learning for consistent coding style', 6),
  (tool_tabnine, 'Enterprise admin console with usage analytics', 7);

-- Stable Diffusion features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_stable_diffusion, 'Fully open-source with local GPU execution', 0),
  (tool_stable_diffusion, 'Thousands of community fine-tuned models available', 1),
  (tool_stable_diffusion, 'ControlNet for precise composition and pose control', 2),
  (tool_stable_diffusion, 'Image-to-image transformation and style transfer', 3),
  (tool_stable_diffusion, 'Inpainting and outpainting for editing images', 4),
  (tool_stable_diffusion, 'Upscaling with AI super-resolution models', 5),
  (tool_stable_diffusion, 'SDXL model for higher quality and resolution', 6),
  (tool_stable_diffusion, 'No usage limits or per-generation fees when run locally', 7);

-- Perplexity already done, doing remaining tools
-- Elicit features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_elicit, 'Semantic search across 125M+ academic papers', 0),
  (tool_elicit, 'Automatic data extraction from papers into structured tables', 1),
  (tool_elicit, 'One-click summaries of research paper findings', 2),
  (tool_elicit, 'Literature review automation with source clustering', 3),
  (tool_elicit, 'Research question refinement and decomposition', 4),
  (tool_elicit, 'Citation export in multiple formats (BibTeX, RIS, APA)', 5),
  (tool_elicit, 'Concept mapping across multiple studies', 6),
  (tool_elicit, 'No keyword matching — understands research intent', 7);

-- Otter.ai features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_otter_ai, 'Real-time transcription during live meetings', 0),
  (tool_otter_ai, 'Automatic meeting summaries and action item extraction', 1),
  (tool_otter_ai, 'Speaker identification and labeling', 2),
  (tool_otter_ai, 'OtterPilot joins Zoom, Teams, and Google Meet automatically', 3),
  (tool_otter_ai, 'Otter AI Chat for asking questions about past meetings', 4),
  (tool_otter_ai, 'Real-time captions for live presentations', 5),
  (tool_otter_ai, 'Team workspace for shared meeting notes', 6),
  (tool_otter_ai, 'Integration with Salesforce and HubSpot for sales calls', 7);

-- Adobe Firefly features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_adobe_firefly, 'Commercially safe — trained on licensed Adobe Stock content', 0),
  (tool_adobe_firefly, 'Generative Fill in Photoshop for content-aware editing', 1),
  (tool_adobe_firefly, 'Text Effects for AI-styled typography', 2),
  (tool_adobe_firefly, 'Generative Recolor in Illustrator for instant color variations', 3),
  (tool_adobe_firefly, 'Reference image support for style matching', 4),
  (tool_adobe_firefly, 'Integrated across Creative Cloud apps', 5),
  (tool_adobe_firefly, 'Structure reference for maintaining object positioning', 6),
  (tool_adobe_firefly, 'Content credentials for AI image transparency', 7);

-- Synthesia features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_synthesia, '230+ diverse AI avatars with realistic expressions', 0),
  (tool_synthesia, 'Text-to-video in 140+ languages and accents', 1),
  (tool_synthesia, 'Custom AI avatar creation from 2-minute video', 2),
  (tool_synthesia, 'Screen recording integration for tutorial videos', 3),
  (tool_synthesia, 'Branded template library for consistent videos', 4),
  (tool_synthesia, 'One-click translation for global content distribution', 5),
  (tool_synthesia, 'Interactive video with clickable elements', 6),
  (tool_synthesia, 'SCORM export for LMS integration', 7);

-- Mubert features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_mubert, 'AI-generated royalty-free music for any use case', 0),
  (tool_mubert, 'Mood, genre, and tempo-based music generation', 1),
  (tool_mubert, 'API for real-time generative music in apps and games', 2),
  (tool_mubert, 'Commercial licensing for YouTube, Twitch, and podcasts', 3),
  (tool_mubert, 'Duration control from 10 seconds to hours', 4),
  (tool_mubert, 'Continuous ambient music streams', 5),
  (tool_mubert, 'Collaboration with human artists for hybrid tracks', 6),
  (tool_mubert, 'Render feature for high-quality audio downloads', 7);

-- Tableau AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_tableau_ai, 'Einstein Copilot for natural language data queries', 0),
  (tool_tableau_ai, 'Automated chart recommendations based on data patterns', 1),
  (tool_tableau_ai, 'AI-generated narrative summaries of dashboards', 2),
  (tool_tableau_ai, 'Predictive analytics with built-in forecasting', 3),
  (tool_tableau_ai, 'Anomaly detection and alert generation', 4),
  (tool_tableau_ai, 'Connects to 100+ data sources out of the box', 5),
  (tool_tableau_ai, 'Embedded analytics for custom applications', 6),
  (tool_tableau_ai, 'Salesforce data cloud integration', 7);

-- Obviously AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_obviously_ai, 'No-code predictive ML model building in minutes', 0),
  (tool_obviously_ai, 'Plain English explanations of model predictions', 1),
  (tool_obviously_ai, 'Automatic algorithm selection and hyperparameter tuning', 2),
  (tool_obviously_ai, 'Batch and real-time predictions via API', 3),
  (tool_obviously_ai, 'Churn prediction, sales forecasting, and risk scoring', 4),
  (tool_obviously_ai, 'Feature importance visualization', 5),
  (tool_obviously_ai, 'Model monitoring and drift detection', 6),
  (tool_obviously_ai, 'Integration with Salesforce, HubSpot, and Snowflake', 7);

-- Polymer features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_polymer, 'Instant conversion of spreadsheets to interactive databases', 0),
  (tool_polymer, 'AI-powered automatic insights and trend detection', 1),
  (tool_polymer, 'Natural language queries for non-technical users', 2),
  (tool_polymer, 'Shareable dashboards with embeddable charts', 3),
  (tool_polymer, 'Connects to Google Sheets, CSV, Excel, and Airtable', 4),
  (tool_polymer, 'Custom filters, sorts, and grouping for data exploration', 5),
  (tool_polymer, 'Team collaboration with real-time updates', 6),
  (tool_polymer, 'Secure data sharing with role-based access', 7);

-- Pecan AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_pecan_ai, 'SQL-based data preparation familiar to analysts', 0),
  (tool_pecan_ai, 'AutoML model building and deployment pipeline', 1),
  (tool_pecan_ai, 'LTV, churn, and demand forecasting out of the box', 2),
  (tool_pecan_ai, 'Native integration with Snowflake, BigQuery, and Redshift', 3),
  (tool_pecan_ai, 'Model explanability with SHAP values', 4),
  (tool_pecan_ai, 'Automated feature engineering', 5),
  (tool_pecan_ai, 'Business-friendly predictions with confidence scores', 6),
  (tool_pecan_ai, 'BI tool integration for Tableau and Looker', 7);

-- Persado features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_persado, 'Emotional language intelligence for marketing optimization', 0),
  (tool_persado, 'Mathematically optimal message generation from data', 1),
  (tool_persado, 'Multi-channel support: email, SMS, digital ads, push', 2),
  (tool_persado, 'A/B testing automation at scale', 3),
  (tool_persado, '30-60% average lift in marketing performance', 4),
  (tool_persado, 'Personalization engine for individual-level messaging', 5),
  (tool_persado, 'Brand compliance and governance controls', 6),
  (tool_persado, 'Integration with major marketing platforms and ESPs', 7);

-- Albert AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_albert_ai, 'Autonomous campaign management across paid search and social', 0),
  (tool_albert_ai, 'Real-time bid and budget optimization', 1),
  (tool_albert_ai, 'Audience discovery and micro-segmentation', 2),
  (tool_albert_ai, 'Creative testing with performance-based rotation', 3),
  (tool_albert_ai, 'Cross-channel attribution and reporting', 4),
  (tool_albert_ai, 'Hypothesis testing without manual campaign management', 5),
  (tool_albert_ai, 'Integration with Google Ads, Facebook, and programmatic DSPs', 6),
  (tool_albert_ai, 'Human oversight dashboard for strategy guidance', 7);

-- Phrasee features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_phrasee, 'AI-generated email subject lines with predicted performance', 0),
  (tool_phrasee, 'Push notification and SMS copy optimization', 1),
  (tool_phrasee, 'Brand voice training from existing copy', 2),
  (tool_phrasee, 'Real-time performance tracking and learning', 3),
  (tool_phrasee, 'Continuous optimization from live engagement data', 4),
  (tool_phrasee, 'Multivariate testing at scale', 5),
  (tool_phrasee, 'Integration with major email service providers', 6),
  (tool_phrasee, 'Compliance and legal language guardrails', 7);

-- Brandwatch features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_brandwatch, 'Monitors 100M+ online sources for brand mentions', 0),
  (tool_brandwatch, 'AI sentiment analysis in 50+ languages', 1),
  (tool_brandwatch, 'Iris AI assistant for automatic insight surfacing', 2),
  (tool_brandwatch, 'Competitor monitoring and benchmarking', 3),
  (tool_brandwatch, 'Crisis detection with real-time alerts', 4),
  (tool_brandwatch, 'Influencer identification and tracking', 5),
  (tool_brandwatch, 'Consumer research panels and surveys', 6),
  (tool_brandwatch, 'Customizable dashboards and executive reports', 7);

-- Fetcher features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_fetcher, 'Automated candidate sourcing from 100M+ profiles', 0),
  (tool_fetcher, 'AI-personalized outreach email sequences', 1),
  (tool_fetcher, 'Automated follow-up management', 2),
  (tool_fetcher, 'Diversity and inclusion sourcing filters', 3),
  (tool_fetcher, 'ATS integration with Greenhouse, Lever, and Workday', 4),
  (tool_fetcher, 'Candidate quality learning from recruiter feedback', 5),
  (tool_fetcher, 'Pipeline analytics and source-of-hire reporting', 6),
  (tool_fetcher, 'Team collaboration on talent pools', 7);

-- Paradox features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_paradox, 'Olivia AI chatbot handles initial candidate screening', 0),
  (tool_paradox, 'Automated interview scheduling in minutes', 1),
  (tool_paradox, 'WhatsApp, SMS, and web chat candidate engagement', 2),
  (tool_paradox, 'Application completion assistance 24/7', 3),
  (tool_paradox, 'Interview reminder and confirmation automation', 4),
  (tool_paradox, 'Integration with 60+ ATS platforms', 5),
  (tool_paradox, 'High-volume hiring optimization for retail and healthcare', 6),
  (tool_paradox, 'Onboarding workflow automation', 7);

-- Pymetrics features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_pymetrics, '12 neuroscience-based games for cognitive trait assessment', 0),
  (tool_pymetrics, 'AI bias audit ensuring fair assessments across demographics', 1),
  (tool_pymetrics, 'Trait-to-role matching based on top performer data', 2),
  (tool_pymetrics, 'Mobile-first candidate experience', 3),
  (tool_pymetrics, 'Internal mobility matching for employee development', 4),
  (tool_pymetrics, 'Benchmark creation from current employee performance data', 5),
  (tool_pymetrics, 'EEOC and GDPR compliant assessment methodology', 6),
  (tool_pymetrics, 'ATS integration for seamless candidate flow', 7);

-- Humanly features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_humanly, 'AI-conducted structured screening interviews', 0),
  (tool_humanly, 'Voice and text interview options for candidates', 1),
  (tool_humanly, 'Ranked candidate summaries with key insights', 2),
  (tool_humanly, 'Role-specific question bank generation', 3),
  (tool_humanly, 'Bias mitigation with standardized questioning', 4),
  (tool_humanly, 'DEI analytics and reporting dashboard', 5),
  (tool_humanly, 'Automated reference checks', 6),
  (tool_humanly, 'ATS integration with major platforms', 7);

-- Tidio features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_tidio, 'Lyro AI chatbot for 24/7 automated support', 0),
  (tool_tidio, 'Live chat with real-time visitor monitoring', 1),
  (tool_tidio, 'Shopify and WooCommerce order data integration', 2),
  (tool_tidio, 'Visual chatbot flow builder without coding', 3),
  (tool_tidio, 'Email marketing automation campaigns', 4),
  (tool_tidio, 'Visitor analytics and customer journey tracking', 5),
  (tool_tidio, 'Multi-agent inbox with team assignments', 6),
  (tool_tidio, 'Mobile app for support on the go', 7);

-- Freshdesk AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_freshdesk_ai, 'Freddy AI auto-triage and ticket categorization', 0),
  (tool_freshdesk_ai, 'Suggested solution articles for agent assistance', 1),
  (tool_freshdesk_ai, 'Freddy Self Service chatbot for end-user resolution', 2),
  (tool_freshdesk_ai, 'Canned response recommendations based on ticket content', 3),
  (tool_freshdesk_ai, 'Sentiment analysis and customer satisfaction prediction', 4),
  (tool_freshdesk_ai, 'Freddy Insights for predictive support analytics', 5),
  (tool_freshdesk_ai, 'Auto-assignment based on agent skills and availability', 6),
  (tool_freshdesk_ai, 'Multi-channel support across email, chat, phone, and social', 7);

-- Forethought features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_forethought, 'Solve AI chatbot for automated customer query resolution', 0),
  (tool_forethought, 'Triage for intelligent ticket routing and prioritization', 1),
  (tool_forethought, 'Assist agent copilot with contextual response suggestions', 2),
  (tool_forethought, 'Discover for support trend and insight analysis', 3),
  (tool_forethought, 'Continuous learning from resolved tickets', 4),
  (tool_forethought, 'Integration with Zendesk, Salesforce, and ServiceNow', 5),
  (tool_forethought, 'Multilingual support for global customer bases', 6),
  (tool_forethought, 'ROI tracking with cost-per-ticket analytics', 7);

-- Codeium features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_codeium, 'Free unlimited code completions for individual developers', 0),
  (tool_codeium, '70+ programming language support', 1),
  (tool_codeium, 'AI chat for coding questions within the IDE', 2),
  (tool_codeium, '40+ IDE integrations including VS Code and JetBrains', 3),
  (tool_codeium, 'Enterprise self-hosted deployment option', 4),
  (tool_codeium, 'Fast completion speed with low latency', 5),
  (tool_codeium, 'Code search across your entire codebase', 6),
  (tool_codeium, 'Custom fine-tuning on enterprise codebases', 7);

-- Replit AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_replit, 'Ghostwriter AI for code generation and completion', 0),
  (tool_replit, 'Instant cloud deployment from any browser', 1),
  (tool_replit, 'Real-time multiplayer coding collaboration', 2),
  (tool_replit, '50+ programming languages supported', 3),
  (tool_replit, 'Replit AI Agent builds full apps from prompts', 4),
  (tool_replit, 'Built-in database, secrets management, and hosting', 5),
  (tool_replit, 'Mobile coding via iOS and Android app', 6),
  (tool_replit, 'Bounties marketplace for coding tasks', 7);

-- Consensus features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_consensus, 'Consensus meter showing scientific agreement percentage', 0),
  (tool_consensus, 'Search across 200M+ peer-reviewed research papers', 1),
  (tool_consensus, 'AI-generated study snapshots for quick understanding', 2),
  (tool_consensus, 'GPT-4 powered synthesis of multiple research findings', 3),
  (tool_consensus, 'Evidence-based answers with source citations', 4),
  (tool_consensus, 'Citation export for reference management', 5),
  (tool_consensus, 'Domain-specific search for medical, scientific, and social research', 6),
  (tool_consensus, 'Chrome extension for instant research access', 7);

-- Scite features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_scite, 'Smart Citations showing support, contradiction, or mentions', 0),
  (tool_scite, 'Database of 1.2+ billion citation statements', 1),
  (tool_scite, 'Scite Assistant for AI-powered research questions', 2),
  (tool_scite, 'Research dashboard for monitoring citation landscape', 3),
  (tool_scite, 'Reference check for validating citations in manuscripts', 4),
  (tool_scite, 'Browser extension for inline citation context', 5),
  (tool_scite, 'Integration with Zotero and reference managers', 6),
  (tool_scite, 'Custom reports for literature reviews', 7);

-- Semantic Scholar features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_semantic_scholar, 'AI-powered semantic search beyond keyword matching', 0),
  (tool_semantic_scholar, '200M+ papers indexed across all scientific disciplines', 1),
  (tool_semantic_scholar, 'TLDR one-sentence paper summaries', 2),
  (tool_semantic_scholar, 'Personalized paper recommendations', 3),
  (tool_semantic_scholar, 'Citation velocity and influence metrics', 4),
  (tool_semantic_scholar, 'Author disambiguation and profiling', 5),
  (tool_semantic_scholar, 'Open Research Corpus API for developers', 6),
  (tool_semantic_scholar, 'Completely free with no paywall access', 7);

-- Reclaim AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_reclaim_ai, 'Smart calendar blocking for tasks and priorities', 0),
  (tool_reclaim_ai, 'Habit tracking with automatic time scheduling', 1),
  (tool_reclaim_ai, 'AI-powered meeting scheduling with calendar analysis', 2),
  (tool_reclaim_ai, '1:1 meeting optimization for teams', 3),
  (tool_reclaim_ai, 'Focus time protection and deep work blocks', 4),
  (tool_reclaim_ai, 'Integration with Asana, Jira, Todoist, and Linear', 5),
  (tool_reclaim_ai, 'Team analytics for meeting and focus time insights', 6),
  (tool_reclaim_ai, 'Automatic rescheduling when plans change', 7);

-- Motion features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_motion, 'AI automatic daily schedule building and rebuilding', 0),
  (tool_motion, 'Task prioritization based on deadlines and importance', 1),
  (tool_motion, 'Project management with automatic timeline planning', 2),
  (tool_motion, 'Calendar integration for conflict-free scheduling', 3),
  (tool_motion, 'Instant reschedule when meetings or tasks change', 4),
  (tool_motion, 'Meeting scheduling with availability pages', 5),
  (tool_motion, 'Team project visibility and workload balancing', 6),
  (tool_motion, 'Analytics on time allocation and productivity patterns', 7);

-- Mem AI features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_mem_ai, 'Self-organizing notes without manual tagging', 0),
  (tool_mem_ai, 'AI surface related notes during writing', 1),
  (tool_mem_ai, 'Mem Chat for conversational access to all notes', 2),
  (tool_mem_ai, 'Smart collections that auto-update based on content', 3),
  (tool_mem_ai, 'Templates for structured note-taking workflows', 4),
  (tool_mem_ai, 'Slack integration for saving messages as notes', 5),
  (tool_mem_ai, 'AI drafts new content based on your existing knowledge', 6),
  (tool_mem_ai, 'Full-text search across all captured information', 7);

-- DALL-E 3 features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_dalle, 'Superior prompt adherence and instruction following', 0),
  (tool_dalle, 'Native ChatGPT Plus integration for conversational refinement', 1),
  (tool_dalle, 'Text rendering in images with high accuracy', 2),
  (tool_dalle, 'Multiple aspect ratios including landscape, portrait, and square', 3),
  (tool_dalle, 'Safety system for responsible content generation', 4),
  (tool_dalle, 'API access for developer integration', 5),
  (tool_dalle, 'Automatic prompt enhancement for better results', 6),
  (tool_dalle, 'Available free via Bing Image Creator', 7);

-- Wordtune features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_wordtune, 'Multiple rewrite suggestions for any sentence', 0),
  (tool_wordtune, 'Tone adjustment from casual to formal', 1),
  (tool_wordtune, 'Spices feature adds examples, stats, and counterarguments', 2),
  (tool_wordtune, 'Text expansion and shortening controls', 3),
  (tool_wordtune, 'Translation from 14 languages into English', 4),
  (tool_wordtune, 'Chrome extension for writing on any website', 5),
  (tool_wordtune, 'AI summary for articles and documents', 6),
  (tool_wordtune, 'Google Docs integration', 7);

-- QuillBot features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_quillbot, '8 paraphrasing modes: Standard, Fluency, Formal, Creative, Academic, etc.', 0),
  (tool_quillbot, 'Grammar Checker for error-free writing', 1),
  (tool_quillbot, 'Summarizer for condensing articles and documents', 2),
  (tool_quillbot, 'Plagiarism Checker with academic database access', 3),
  (tool_quillbot, 'Citation Generator for APA, MLA, and Chicago formats', 4),
  (tool_quillbot, 'Google Docs and Microsoft Word add-in', 5),
  (tool_quillbot, 'Co-Writer for combining paraphrasing and translation', 6),
  (tool_quillbot, 'Synonym slider for vocabulary control', 7);

-- Sudowrite features
INSERT INTO tool_features (tool_id, feature, sort_order) VALUES
  (tool_sudowrite, 'Story Engine for generating complete novel outlines and chapters', 0),
  (tool_sudowrite, 'Describe for adding rich sensory details to scenes', 1),
  (tool_sudowrite, 'Brainstorm for plot ideas and character development', 2),
  (tool_sudowrite, 'Rewrite for alternative phrasing and style variations', 3),
  (tool_sudowrite, 'Write feature for seamless story continuation', 4),
  (tool_sudowrite, 'Feedback mode for constructive critique of your writing', 5),
  (tool_sudowrite, 'Canvas for visualizing story structure', 6),
  (tool_sudowrite, 'Designed specifically for fiction — not generic AI writing', 7);

-- =============================================
-- INSERT PRICING TIERS
-- =============================================

-- ChatGPT pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_chatgpt, 'Free', '$0', NULL, ARRAY['GPT-3.5 access', 'Limited GPT-4o', 'DALL-E image generation', 'Web browsing', 'Basic plugins'], false, 0),
  (tool_chatgpt, 'Plus', '$20', 'month', ARRAY['GPT-4o priority access', 'Advanced data analysis', 'Image generation (DALL-E 3)', 'Custom GPTs', 'Faster response times', 'File uploads'], true, 1),
  (tool_chatgpt, 'Team', '$25', 'user/month', ARRAY['Everything in Plus', 'Higher usage caps', 'Admin console', 'Team workspace', 'Data not used for training'], false, 2),
  (tool_chatgpt, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited GPT-4o', 'Custom data retention', 'SSO and SAML', 'Dedicated account team', 'Advanced security'], false, 3);

-- Claude pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_claude, 'Free', '$0', NULL, ARRAY['Claude 3.5 Haiku access', 'Basic chat features', 'Limited messages per day', 'Web access'], false, 0),
  (tool_claude, 'Pro', '$20', 'month', ARRAY['Claude 3.5 Sonnet and Opus', '5x more usage', 'Priority access', 'Projects feature', 'Longer context', 'Early feature access'], true, 1),
  (tool_claude, 'Team', '$25', 'user/month', ARRAY['Everything in Pro', 'Central billing', 'Team collaboration', 'Admin controls', 'Data not used for training'], false, 2),
  (tool_claude, 'Enterprise', 'Custom', NULL, ARRAY['Highest usage limits', 'Custom retention policies', 'SSO', 'Audit logs', 'Priority support', 'Dedicated success manager'], false, 3);

-- Gemini pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_gemini, 'Free', '$0', NULL, ARRAY['Gemini 1.5 Flash', 'Google Workspace integration', 'Basic image understanding', 'Mobile app access'], false, 0),
  (tool_gemini, 'Advanced', '$19.99', 'month', ARRAY['Gemini 1.5 Pro', '1M token context', 'Advanced reasoning', 'Google One 2TB storage', 'Priority access'], true, 1),
  (tool_gemini, 'Business', '$24', 'user/month', ARRAY['Everything in Advanced', 'Workspace admin controls', 'Enterprise security', 'Data protection'], false, 2),
  (tool_gemini, 'Enterprise', 'Custom', NULL, ARRAY['All models including Gemini Ultra', 'Vertex AI access', 'Custom deployment', 'SLA guarantees'], false, 3);

-- Jasper AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_jasper, 'Creator', '$39', 'month', ARRAY['1 user seat', 'Unlimited AI words', '50+ templates', 'Browser extension', 'Jasper Art (200 images/month)', 'SEO mode'], false, 0),
  (tool_jasper, 'Teams', '$99', 'month', ARRAY['Up to 3 users', 'Brand Voice', 'Campaigns feature', 'Knowledge base', 'Collaboration tools', 'API access'], true, 1),
  (tool_jasper, 'Business', 'Custom', NULL, ARRAY['Unlimited users', 'Custom AI models', 'SSO', 'Advanced analytics', 'Dedicated support', 'Custom templates'], false, 2);

-- Grammarly pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_grammarly, 'Free', '$0', NULL, ARRAY['Grammar and spelling checks', 'Basic punctuation', 'Conciseness suggestions', 'Works in 500,000+ apps'], false, 0),
  (tool_grammarly, 'Premium', '$12', 'month', ARRAY['Full-sentence rewrites', 'Tone detection', 'Vocabulary suggestions', 'Fluency and clarity', 'Plagiarism detection', 'GrammarlyGO'], true, 1),
  (tool_grammarly, 'Business', '$15', 'user/month', ARRAY['Everything in Premium', 'Style guide', 'Brand tone', 'Team analytics', 'Admin dashboard', 'Priority support'], false, 2),
  (tool_grammarly, 'Enterprise', 'Custom', NULL, ARRAY['Custom security controls', 'SSO', 'Compliance reporting', 'Dedicated success manager'], false, 3);

-- GitHub Copilot pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_github_copilot, 'Individual', '$10', 'month', ARRAY['Inline code suggestions', 'Chat in IDE', 'CLI integration', 'Unlimited completions'], false, 0),
  (tool_github_copilot, 'Business', '$19', 'user/month', ARRAY['Everything Individual', 'Organization policy management', 'Audit logs', 'IP indemnification', 'Proxy support'], true, 1),
  (tool_github_copilot, 'Enterprise', '$39', 'user/month', ARRAY['Everything Business', 'Fine-tuned models', 'Codebase-aware suggestions', 'GitHub.com integration', 'Custom policies'], false, 2);

-- Cursor pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_cursor, 'Hobby', '$0', NULL, ARRAY['2000 code completions/month', '50 slow requests', 'GPT-3.5 chat'], false, 0),
  (tool_cursor, 'Pro', '$20', 'month', ARRAY['Unlimited completions', '500 fast GPT-4 requests', 'Unlimited Claude 3.5 Sonnet', 'Advanced codebase indexing', 'All Cursor features'], true, 1),
  (tool_cursor, 'Business', '$40', 'user/month', ARRAY['Everything Pro', 'Team management', 'Usage analytics', 'SSO', 'Centralized billing', 'No training on code'], false, 2);

-- Midjourney pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_midjourney, 'Basic', '$10', 'month', ARRAY['200 image generations/month', 'General commercial terms', 'Access to member gallery', '3 concurrent fast jobs'], false, 0),
  (tool_midjourney, 'Standard', '$30', 'month', ARRAY['15 fast hours/month', 'Unlimited relaxed hours', 'General commercial terms', 'Stealth mode option'], true, 1),
  (tool_midjourney, 'Pro', '$60', 'month', ARRAY['30 fast hours/month', 'Unlimited relaxed hours', 'Stealth mode included', '12 concurrent jobs'], false, 2),
  (tool_midjourney, 'Mega', '$120', 'month', ARRAY['60 fast hours/month', 'All Pro features', 'Maximum concurrency', 'Best for studios'], false, 3);

-- Canva AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_canva_ai, 'Free', '$0', NULL, ARRAY['Basic design templates', 'Limited AI features', '5GB cloud storage', 'Drag-and-drop editor'], false, 0),
  (tool_canva_ai, 'Pro', '$14.99', 'month', ARRAY['Full Magic Studio access', 'Unlimited AI image generation', 'Background remover', 'Brand Kit', '100GB storage', '600,000+ templates'], true, 1),
  (tool_canva_ai, 'Teams', '$29.99', 'month', ARRAY['Everything Pro per person', 'Team brand controls', 'Unlimited Brand Kits', 'Team workspaces', 'SSO'], false, 2),
  (tool_canva_ai, 'Enterprise', 'Custom', NULL, ARRAY['All Teams features', 'Advanced security', 'Dedicated support', 'Custom integrations'], false, 3);

-- Notion AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_notion_ai, 'Free (with Notion)', '$0', NULL, ARRAY['Basic Notion features', 'Limited AI responses/month', 'AI writing assistant'], false, 0),
  (tool_notion_ai, 'Notion AI Add-on', '$10', 'user/month', ARRAY['Unlimited AI usage', 'Q&A over workspace', 'Meeting summaries', 'AI translation', 'AI database analysis'], true, 1),
  (tool_notion_ai, 'Business Bundle', '$20', 'user/month', ARRAY['Notion Business plan', 'Full Notion AI included', 'Advanced permissions', 'Analytics', 'SAML SSO'], false, 2),
  (tool_notion_ai, 'Enterprise Bundle', 'Custom', NULL, ARRAY['All features', 'Dedicated manager', 'Custom contracts', 'Advanced security'], false, 3);

-- Perplexity pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_perplexity, 'Free', '$0', NULL, ARRAY['Unlimited basic searches', 'Limited Pro searches', 'Real-time web access', 'Mobile app'], false, 0),
  (tool_perplexity, 'Pro', '$20', 'month', ARRAY['300+ Pro searches/day', 'GPT-4 and Claude access', 'Unlimited file uploads', 'Image generation', 'API credits'], true, 1),
  (tool_perplexity, 'Enterprise Pro', 'Custom', NULL, ARRAY['Team management', 'SSO', 'Data security controls', 'Usage analytics', 'Priority support'], false, 2);

-- Runway pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_runway, 'Free', '$0', NULL, ARRAY['125 credits', 'Limited Gen-2 access', 'Video exports with watermark', 'Access to Magic Tools'], false, 0),
  (tool_runway, 'Standard', '$15', 'month', ARRAY['625 credits/month', 'Gen-2 video generation', 'No watermarks', 'All Magic Tools', '100GB storage'], true, 1),
  (tool_runway, 'Pro', '$35', 'month', ARRAY['2250 credits/month', 'Priority processing', 'Custom AI training', '500GB storage', 'Audio tools'], false, 2),
  (tool_runway, 'Unlimited', '$95', 'month', ARRAY['Unlimited basic generations', '2250 credits/month', 'Highest priority', '4K exports'], false, 3);

-- ElevenLabs pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_elevenlabs, 'Free', '$0', NULL, ARRAY['10,000 characters/month', '3 custom voices', 'All standard voices', 'Watermarked audio'], false, 0),
  (tool_elevenlabs, 'Starter', '$5', 'month', ARRAY['30,000 characters/month', '10 custom voices', 'Commercial license', 'No watermarks', 'API access'], false, 1),
  (tool_elevenlabs, 'Creator', '$22', 'month', ARRAY['100,000 characters/month', '30 custom voices', 'Professional cloning', 'Dubbing studio', '44.1kHz audio'], true, 2),
  (tool_elevenlabs, 'Pro', '$99', 'month', ARRAY['500,000 characters/month', '160 custom voices', 'Full API access', 'Priority support', 'Advanced dubbing'], false, 3),
  (tool_elevenlabs, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited characters', 'Custom voice models', 'SLA guarantee', 'Dedicated infrastructure'], false, 4);

-- Manatal pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_manatal, 'Professional', '$15', 'user/month', ARRAY['15 open jobs', 'AI candidate scoring', 'Email integration', 'Job board posting', 'Kanban pipeline'], false, 0),
  (tool_manatal, 'Enterprise', '$35', 'user/month', ARRAY['Unlimited open jobs', 'All Professional features', 'Custom fields', 'Analytics dashboard', 'API access', 'Priority support'], true, 1),
  (tool_manatal, 'Enterprise Plus', 'Custom', NULL, ARRAY['Everything Enterprise', 'SSO', 'Dedicated manager', 'Custom integrations', 'Training sessions'], false, 2);

-- Intercom AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_intercom_ai, 'Essential', '$39', 'month', ARRAY['Live chat', 'Basic automation', 'Email support', 'Help center', '1 AI seat'], false, 0),
  (tool_intercom_ai, 'Advanced', '$99', 'month', ARRAY['Everything Essential', 'Fin AI agent', 'Multiple inboxes', 'Workflow automation', 'Analytics'], true, 1),
  (tool_intercom_ai, 'Expert', '$139', 'month', ARRAY['Everything Advanced', 'Advanced reporting', 'Workload management', 'Custom roles', 'Priority support'], false, 2),
  (tool_intercom_ai, 'Enterprise', 'Custom', NULL, ARRAY['All features', 'SSO/SAML', 'Custom data retention', 'Dedicated team', 'SLA'], false, 3);

-- Zendesk AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_zendesk_ai, 'Suite Team', '$55', 'agent/month', ARRAY['Ticketing system', 'Email, chat, voice', 'Help center', 'Basic AI features', '50 AI automated resolutions'], false, 0),
  (tool_zendesk_ai, 'Suite Growth', '$89', 'agent/month', ARRAY['Everything Team', 'Self-service portal', 'Business hours SLA', 'Advanced analytics', '100 AI resolutions'], true, 1),
  (tool_zendesk_ai, 'Suite Professional', '$115', 'agent/month', ARRAY['Everything Growth', 'Skills-based routing', 'Custom analytics', 'Community forums', '500 AI resolutions'], false, 2),
  (tool_zendesk_ai, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited AI features', 'Custom objects', 'Sandbox', 'Advanced security', 'Dedicated success manager'], false, 3);

-- Copy.ai pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_copy_ai, 'Free', '$0', NULL, ARRAY['2,000 words/month', '1 user seat', '90+ templates', 'Basic support'], false, 0),
  (tool_copy_ai, 'Pro', '$36', 'month', ARRAY['Unlimited words', '5 user seats', 'All templates', 'Workflows', 'Priority support', 'API access'], true, 1),
  (tool_copy_ai, 'Team', '$186', 'month', ARRAY['Unlimited words', 'Up to 20 seats', 'Infobase', 'Advanced workflows', 'Team analytics'], false, 2),
  (tool_copy_ai, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited seats', 'Custom Infobase', 'SSO', 'Dedicated onboarding', 'Custom API limits'], false, 3);

-- Julius AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_julius_ai, 'Free', '$0', NULL, ARRAY['5 queries/day', 'CSV upload', 'Basic charts', 'Chat interface'], false, 0),
  (tool_julius_ai, 'Essential', '$22', 'month', ARRAY['Unlimited queries', 'All file formats', 'Advanced visualizations', 'Export results', 'Data memory'], true, 1),
  (tool_julius_ai, 'Pro', '$45', 'month', ARRAY['Everything Essential', 'Database connections', 'Custom models', 'API access', 'Priority support'], false, 2);

-- Perplexity already done above, skip
-- Writesonic pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_writesonic, 'Free', '$0', NULL, ARRAY['6,250 words/month', 'Limited features', 'Chatsonic access', '1 user'], false, 0),
  (tool_writesonic, 'Small Team', '$13', 'month', ARRAY['200,000 words/month', 'All writing tools', 'Botsonic chatbot', 'Surfer SEO integration', '2 users'], true, 1),
  (tool_writesonic, 'Freelancer', '$16', 'month', ARRAY['Unlimited words', 'Priority access', '8 users', 'API access', 'Custom brand voice'], false, 2),
  (tool_writesonic, 'Enterprise', 'Custom', NULL, ARRAY['Custom word limits', 'Dedicated manager', 'SSO', 'White-label option'], false, 3);

-- Rytr pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_rytr, 'Free', '$0', NULL, ARRAY['10,000 characters/month', '40+ use cases', '30+ languages', 'Basic support'], false, 0),
  (tool_rytr, 'Saver', '$9', 'month', ARRAY['100,000 characters/month', 'All free features', 'Create custom use cases', 'Premium support'], true, 1),
  (tool_rytr, 'Unlimited', '$29', 'month', ARRAY['Unlimited characters', 'All Saver features', 'Dedicated account manager', 'Priority support', 'Team collaboration'], false, 2);

-- Descript pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_descript, 'Free', '$0', NULL, ARRAY['1 hour transcription/month', 'Watermarked video exports', 'Basic editing tools', 'Overdub 10 mins/month'], false, 0),
  (tool_descript, 'Creator', '$15', 'user/month', ARRAY['10 hours transcription/month', 'No watermarks', 'Overdub unlimited', 'Studio Sound', '10GB storage'], true, 1),
  (tool_descript, 'Pro', '$30', 'user/month', ARRAY['30 hours transcription/month', 'All Creator features', 'Multi-track', 'Advanced AI features', '100GB storage'], false, 2),
  (tool_descript, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited transcription', 'SSO', 'Custom storage', 'Advanced security'], false, 3);

-- Tabnine pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_tabnine, 'Free', '$0', NULL, ARRAY['Basic completions', '2 full-line completions/day', 'Local models only', 'Privacy mode'], false, 0),
  (tool_tabnine, 'Pro', '$12', 'user/month', ARRAY['Unlimited full-line completions', 'AI chat', 'All IDE integrations', 'Cloud models', 'Priority support'], true, 1),
  (tool_tabnine, 'Enterprise', 'Custom', NULL, ARRAY['On-premise deployment', 'Air-gapped support', 'Custom models', 'Dedicated infrastructure', 'SLA'], false, 2);

-- Stable Diffusion pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_stable_diffusion, 'Free (Self-hosted)', '$0', NULL, ARRAY['Unlimited local generations', 'All models', 'No usage limits', 'Requires GPU hardware'], false, 0),
  (tool_stable_diffusion, 'DreamStudio', '$0.002', 'per image', ARRAY['Cloud-based generation', 'No GPU required', 'Latest SDXL model', 'API access', 'Commercial license'], true, 1),
  (tool_stable_diffusion, 'API (Stability AI)', '$0.004', 'per image', ARRAY['Enterprise API access', 'Latest models', 'High concurrency', 'SLA support'], false, 2);

-- Elicit pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_elicit, 'Free', '$0', NULL, ARRAY['5 papers/search', 'Basic summaries', 'Paper search', 'Limited extractions'], false, 0),
  (tool_elicit, 'Plus', '$12', 'month', ARRAY['Unlimited paper access', 'Data extraction tables', 'Full literature reviews', 'Export features', 'Priority support'], true, 1),
  (tool_elicit, 'Enterprise', 'Custom', NULL, ARRAY['Team accounts', 'API access', 'Custom workflows', 'Dedicated support'], false, 2);

-- Otter.ai pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_otter_ai, 'Free', '$0', NULL, ARRAY['300 minutes transcription/month', '30 min per conversation limit', '3 audio imports/month', 'Basic features'], false, 0),
  (tool_otter_ai, 'Pro', '$10', 'month', ARRAY['1200 minutes/month', '90 min per conversation', 'Unlimited imports', 'OtterPilot', 'Advanced search'], true, 1),
  (tool_otter_ai, 'Business', '$20', 'user/month', ARRAY['6000 minutes/month', 'Admin panel', 'Priority support', 'Team templates', 'Salesforce integration'], false, 2),
  (tool_otter_ai, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited transcription', 'Custom vocabulary', 'SSO', 'Advanced security'], false, 3);

-- Reclaim AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_reclaim_ai, 'Free', '$0', NULL, ARRAY['3 habits', '3 tasks', '1 Scheduling Link', 'Basic calendar blocking'], false, 0),
  (tool_reclaim_ai, 'Starter', '$8', 'user/month', ARRAY['Unlimited habits and tasks', '10 Scheduling Links', 'Smart 1:1 meetings', 'Basic analytics'], true, 1),
  (tool_reclaim_ai, 'Business', '$12', 'user/month', ARRAY['Everything Starter', 'Team analytics', 'Priority scheduling', 'Advanced integrations'], false, 2),
  (tool_reclaim_ai, 'Enterprise', 'Custom', NULL, ARRAY['All Business features', 'SSO', 'Dedicated support', 'Custom SLAs'], false, 3);

-- Motion pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_motion, 'Individual', '$19', 'month', ARRAY['AI scheduling', 'Task management', 'Calendar integration', 'Project planning', 'Mobile app'], true, 0),
  (tool_motion, 'Team', '$12', 'user/month', ARRAY['Everything Individual', 'Team workspaces', 'Shared projects', 'Team calendar visibility', 'Admin controls'], false, 1);

-- Mem AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_mem_ai, 'Free', '$0', NULL, ARRAY['Unlimited notes', 'Basic AI features', 'Mobile app', 'Limited Mem Chat'], false, 0),
  (tool_mem_ai, 'Mem Pro', '$14.99', 'month', ARRAY['Unlimited Mem Chat', 'AI drafting', 'Smart collections', 'Slack integration', 'Priority support'], true, 1),
  (tool_mem_ai, 'Teams', 'Custom', NULL, ARRAY['Team knowledge base', 'Shared workspaces', 'Admin controls', 'SSO', 'Dedicated support'], false, 2);

-- DALL-E 3 pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_dalle, 'Free (Bing)', '$0', NULL, ARRAY['Limited generations via Bing Image Creator', 'Boost credits system', 'Commercial use allowed'], false, 0),
  (tool_dalle, 'ChatGPT Plus', '$20', 'month', ARRAY['DALL-E 3 in ChatGPT', '40 messages/3 hours', 'Conversational refinement', 'Multiple sizes'], true, 1),
  (tool_dalle, 'API', '$0.04-$0.12', 'per image', ARRAY['Direct API access', 'Standard and HD quality', 'All sizes', 'Commercial license'], false, 2);

-- Consensus pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_consensus, 'Free', '$0', NULL, ARRAY['20 AI searches/month', 'Basic paper search', 'Consensus meter', 'Study snapshots'], false, 0),
  (tool_consensus, 'Premium', '$9.99', 'month', ARRAY['Unlimited AI searches', 'GPT-4 synthesis', 'Citation export', 'Advanced filters', 'Priority access'], true, 1),
  (tool_consensus, 'Enterprise', 'Custom', NULL, ARRAY['Team accounts', 'API access', 'Custom integrations', 'Usage analytics'], false, 2);

-- Scite pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_scite, 'Free', '$0', NULL, ARRAY['Limited searches', 'Smart Citation previews', 'Browser extension', 'Basic dashboard'], false, 0),
  (tool_scite, 'Individual', '$20', 'month', ARRAY['Unlimited searches', 'Full Smart Citations', 'Scite Assistant', 'Reference check', 'Export citations'], true, 1),
  (tool_scite, 'Team', 'Custom', NULL, ARRAY['Multiple users', 'Team dashboard', 'API access', 'Institutional pricing'], false, 2);

-- Semantic Scholar pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_semantic_scholar, 'Free', '$0', NULL, ARRAY['Unlimited paper search', 'TLDR summaries', 'Citation graphs', 'Paper recommendations', 'Open API'], false, 0);

-- Adobe Firefly pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_adobe_firefly, 'Free', '$0', NULL, ARRAY['25 generative credits/month', 'Text to Image', 'Text Effects', 'Generative Recolor', 'Web app access'], false, 0),
  (tool_adobe_firefly, 'Firefly Premium', '$4.99', 'month', ARRAY['100 generative credits/month', 'All free features', 'Priority processing'], true, 1),
  (tool_adobe_firefly, 'Creative Cloud', '$54.99', 'month', ARRAY['All Creative Cloud apps', 'Generous generative credits', 'Photoshop Generative Fill', 'Illustrator AI features'], false, 2),
  (tool_adobe_firefly, 'Enterprise', 'Custom', NULL, ARRAY['High-volume credits', 'Custom model training', 'IP indemnification', 'SSO', 'Dedicated support'], false, 3);

-- Synthesia pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_synthesia, 'Starter', '$22', 'month', ARRAY['10 video minutes/month', '90+ AI avatars', '60+ languages', 'Basic templates', 'MP4 download'], false, 0),
  (tool_synthesia, 'Creator', '$67', 'month', ARRAY['30 video minutes/month', '160+ avatars', 'Custom avatar (1)', 'Screen recording', 'Priority rendering'], true, 1),
  (tool_synthesia, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited minutes', 'Custom avatars', 'SSO', 'API access', 'Dedicated support', 'SCORM export'], false, 2);

-- Mubert pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_mubert, 'Ambassador', '$0', NULL, ARRAY['25 tracks/month', 'Personal use only', 'Standard quality', 'Limited duration'], false, 0),
  (tool_mubert, 'Creator', '$14', 'month', ARRAY['500 tracks/month', 'Commercial license', 'YouTube and podcast use', 'HQ audio', 'All genres'], true, 1),
  (tool_mubert, 'Pro', '$39', 'month', ARRAY['Unlimited tracks', 'Full commercial rights', 'API access (1000 calls/month)', 'Priority support'], false, 2),
  (tool_mubert, 'Business', 'Custom', NULL, ARRAY['Unlimited API access', 'White-label solution', 'Custom integrations', 'Enterprise support'], false, 3);

-- Tableau AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_tableau_ai, 'Viewer', '$15', 'user/month', ARRAY['View and interact with dashboards', 'Basic Einstein features', 'Mobile access'], false, 0),
  (tool_tableau_ai, 'Explorer', '$42', 'user/month', ARRAY['Create and edit dashboards', 'Natural language queries', 'Data connections', 'Collaboration'], true, 1),
  (tool_tableau_ai, 'Creator', '$70', 'user/month', ARRAY['Full authoring access', 'Data prep', 'All AI features', 'Advanced analytics'], false, 2),
  (tool_tableau_ai, 'Enterprise', 'Custom', NULL, ARRAY['Custom deployment', 'Advanced governance', 'SLA', 'Dedicated support'], false, 3);

-- Obviously AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_obviously_ai, 'Starter', '$75', 'month', ARRAY['3 predictive models', '100K predictions/month', 'Basic integrations', 'Email support'], false, 0),
  (tool_obviously_ai, 'Professional', '$300', 'month', ARRAY['10 models', '500K predictions/month', 'API access', 'All integrations', 'Priority support'], true, 1),
  (tool_obviously_ai, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited models', 'Custom predictions', 'Dedicated infrastructure', 'SLA', 'Custom integrations'], false, 2);

-- Polymer pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_polymer, 'Free', '$0', NULL, ARRAY['1 database', '1000 records', 'Basic views', 'Limited AI insights'], false, 0),
  (tool_polymer, 'Starter', '$10', 'month', ARRAY['5 databases', '50,000 records', 'All views', 'AI insights', 'Embeddable charts'], true, 1),
  (tool_polymer, 'Pro', '$50', 'month', ARRAY['Unlimited databases', 'Unlimited records', 'Priority AI', 'Team collaboration', 'Advanced sharing'], false, 2),
  (tool_polymer, 'Enterprise', 'Custom', NULL, ARRAY['Custom data limits', 'SSO', 'SLA', 'Dedicated support'], false, 3);

-- Pecan AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_pecan_ai, 'Growth', '$950', 'month', ARRAY['3 predictive models', 'Data warehouse integration', 'Core use cases', 'Standard support'], false, 0),
  (tool_pecan_ai, 'Business', '$2000', 'month', ARRAY['10 models', 'Advanced use cases', 'API access', 'Priority support', 'Dedicated CSM'], true, 1),
  (tool_pecan_ai, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited models', 'Custom SLAs', 'Professional services', 'Advanced security'], false, 2);

-- Persado pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_persado, 'Enterprise', 'Custom', NULL, ARRAY['Full platform access', 'Custom model training', 'Multi-channel campaigns', 'Dedicated team', 'Performance guarantees'], true, 0);

-- Albert AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_albert_ai, 'Enterprise', 'Custom', NULL, ARRAY['Full autonomous management', 'Cross-channel campaigns', 'Dedicated AI team', 'Custom integrations', 'Performance SLA'], true, 0);

-- Phrasee pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_phrasee, 'Growth', 'Custom', NULL, ARRAY['Email optimization', 'A/B testing', 'Brand voice training', 'Basic analytics'], false, 0),
  (tool_phrasee, 'Enterprise', 'Custom', NULL, ARRAY['Full multi-channel optimization', 'Real-time learning', 'Custom integrations', 'Dedicated team', 'Performance guarantees'], true, 1);

-- Brandwatch pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_brandwatch, 'Consumer Research', 'Custom', NULL, ARRAY['Unlimited searches', 'Historical data access', 'Iris AI insights', 'Custom dashboards', 'API access'], false, 0),
  (tool_brandwatch, 'Social Media Management', 'Custom', NULL, ARRAY['Publishing and scheduling', 'Engagement management', 'Performance analytics', 'Competitor tracking'], false, 1),
  (tool_brandwatch, 'Full Suite', 'Custom', NULL, ARRAY['All features', 'Dedicated support', 'Custom training', 'SLA guarantees'], true, 2);

-- Fetcher pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_fetcher, 'Startup', '$149', 'month', ARRAY['Up to 150 sourced profiles/month', 'Email outreach automation', 'ATS integration', 'Basic analytics'], false, 0),
  (tool_fetcher, 'Growth', '$399', 'month', ARRAY['Up to 500 profiles/month', 'All Startup features', 'Diversity filters', 'Advanced analytics', 'Priority support'], true, 1),
  (tool_fetcher, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited profiles', 'Custom outreach', 'API access', 'Dedicated CSM', 'SLA'], false, 2);

-- Paradox pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_paradox, 'Enterprise', 'Custom', NULL, ARRAY['Olivia AI assistant', 'High-volume screening', 'ATS integration', 'WhatsApp and SMS', 'Custom workflows', 'Dedicated support'], true, 0);

-- Pymetrics pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_pymetrics, 'Enterprise', 'Custom', NULL, ARRAY['Neuroscience game assessments', 'AI bias audit included', 'Role benchmark creation', 'ATS integration', 'Internal mobility module', 'Dedicated CSM'], true, 0);

-- Humanly pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_humanly, 'Growth', 'Custom', NULL, ARRAY['AI screening interviews', 'Automated scheduling', 'Candidate summaries', 'ATS integration', 'DEI analytics'], false, 0),
  (tool_humanly, 'Enterprise', 'Custom', NULL, ARRAY['Unlimited screenings', 'Custom question banks', 'Reference checks', 'Advanced reporting', 'Dedicated support'], true, 1);

-- Tidio pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_tidio, 'Free', '$0', NULL, ARRAY['50 live chat conversations/month', 'Basic chatbots', 'Email channel', 'Visitor list'], false, 0),
  (tool_tidio, 'Starter', '$29', 'month', ARRAY['100 conversations/month', 'Lyro AI (50 conversations)', 'Email marketing', 'Analytics', 'Integrations'], false, 1),
  (tool_tidio, 'Growth', '$59', 'month', ARRAY['Unlimited live chat', 'Lyro AI (200 conversations)', 'All automation', 'Priority support'], true, 2),
  (tool_tidio, 'Tidio+', '$749', 'month', ARRAY['Custom Lyro AI conversations', 'Dedicated AI specialist', 'Custom workflows', 'Premium support'], false, 3);

-- Freshdesk AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_freshdesk_ai, 'Free', '$0', NULL, ARRAY['10 agents', 'Email and social ticketing', 'Knowledge base', 'Basic Freddy AI'], false, 0),
  (tool_freshdesk_ai, 'Growth', '$15', 'agent/month', ARRAY['Automation rules', 'SLA management', 'Time tracking', 'Enhanced Freddy AI', 'Business hours'], true, 1),
  (tool_freshdesk_ai, 'Pro', '$49', 'agent/month', ARRAY['Round-robin routing', 'Custom reports', 'Freddy Self Service', 'Multiple SLA policies'], false, 2),
  (tool_freshdesk_ai, 'Enterprise', '$79', 'agent/month', ARRAY['All Pro features', 'Skills-based routing', 'Sandbox', 'Full Freddy AI suite', 'IP whitelisting'], false, 3);

-- Forethought pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_forethought, 'Starter', 'Custom', NULL, ARRAY['Solve AI chatbot', 'Basic triage', 'Helpdesk integration', 'Standard analytics'], false, 0),
  (tool_forethought, 'Growth', 'Custom', NULL, ARRAY['Solve + Triage + Assist', 'Advanced routing', 'Discover insights', 'Multi-language'], true, 1),
  (tool_forethought, 'Enterprise', 'Custom', NULL, ARRAY['All products', 'Custom AI training', 'Dedicated team', 'SLA guarantees', 'Advanced security'], false, 2);

-- Codeium pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_codeium, 'Individual (Free)', '$0', NULL, ARRAY['Unlimited completions', 'AI chat', '70+ languages', '40+ IDEs', 'Basic support'], false, 0),
  (tool_codeium, 'Teams', '$12', 'user/month', ARRAY['Everything Free', 'Context-aware personalization', 'Admin controls', 'Usage analytics', 'Priority support'], true, 1),
  (tool_codeium, 'Enterprise', 'Custom', NULL, ARRAY['Self-hosted deployment', 'Custom fine-tuning', 'Air-gapped support', 'SLA', 'Dedicated infrastructure'], false, 2);

-- Replit AI pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_replit, 'Free', '$0', NULL, ARRAY['Basic IDE', 'Limited compute', 'Ghostwriter basic', 'Public repls only'], false, 0),
  (tool_replit, 'Core', '$20', 'month', ARRAY['Unlimited private repls', 'Ghostwriter full access', 'AI Agent', 'Boosted performance', '10GB storage'], true, 1),
  (tool_replit, 'Teams', '$40', 'month', ARRAY['5 users included', 'Team collaboration', 'Private team org', 'Admin controls', 'Advanced compute'], false, 2);

-- Wordtune pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_wordtune, 'Free', '$0', NULL, ARRAY['10 rewrites/day', 'Basic rewriting', 'Chrome extension', 'Web editor'], false, 0),
  (tool_wordtune, 'Premium', '$9.99', 'month', ARRAY['Unlimited rewrites', 'All modes', 'Spices feature', 'Summarizer', 'Translation'], true, 1),
  (tool_wordtune, 'Premium for Teams', '$9.99', 'user/month', ARRAY['Everything Premium', 'Centralized billing', 'Team dashboard', 'Priority support'], false, 2);

-- QuillBot pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_quillbot, 'Free', '$0', NULL, ARRAY['125 words paraphraser', '3 paraphrasing modes', 'Standard summarizer', 'Grammar checker limited'], false, 0),
  (tool_quillbot, 'Premium', '$9.95', 'month', ARRAY['Unlimited paraphrasing', 'All 8 modes', 'Advanced summarizer', 'Plagiarism checker', 'Citation generator', 'Google Docs add-in'], true, 1);

-- Sudowrite pricing
INSERT INTO pricing_tiers (tool_id, tier_name, price_label, billing_cycle, features, is_popular, sort_order) VALUES
  (tool_sudowrite, 'Hobby & Student', '$10', 'month', ARRAY['30,000 AI words/month', 'All core features', 'Story Engine', 'Describe and Brainstorm'], false, 0),
  (tool_sudowrite, 'Professional', '$22', 'month', ARRAY['90,000 AI words/month', 'All features', 'Priority support', 'Advanced features'], true, 1),
  (tool_sudowrite, 'Max', '$44', 'month', ARRAY['300,000 AI words/month', 'All Professional features', 'Maximum throughput'], false, 2);

-- =============================================
-- INSERT TOOL TAGS
-- =============================================

-- ChatGPT tags
INSERT INTO tool_tags VALUES (tool_chatgpt, tag_nlp), (tool_chatgpt, tag_generative), (tool_chatgpt, tag_multimodal), (tool_chatgpt, tag_api);

-- Claude tags
INSERT INTO tool_tags VALUES (tool_claude, tag_nlp), (tool_claude, tag_generative), (tool_claude, tag_api), (tool_claude, tag_enterprise);

-- Gemini tags
INSERT INTO tool_tags VALUES (tool_gemini, tag_multimodal), (tool_gemini, tag_generative), (tool_gemini, tag_api), (tool_gemini, tag_mobile);

-- Jasper tags
INSERT INTO tool_tags VALUES (tool_jasper, tag_generative), (tool_jasper, tag_seo), (tool_jasper, tag_enterprise);

-- Grammarly tags
INSERT INTO tool_tags VALUES (tool_grammarly, tag_nlp), (tool_grammarly, tag_real_time), (tool_grammarly, tag_mobile);

-- GitHub Copilot tags
INSERT INTO tool_tags VALUES (tool_github_copilot, tag_generative), (tool_github_copilot, tag_code_review), (tool_github_copilot, tag_api);

-- Cursor tags
INSERT INTO tool_tags VALUES (tool_cursor, tag_generative), (tool_cursor, tag_code_review);

-- Tabnine tags
INSERT INTO tool_tags VALUES (tool_tabnine, tag_code_review), (tool_tabnine, tag_enterprise);

-- Midjourney tags
INSERT INTO tool_tags VALUES (tool_midjourney, tag_image_gen), (tool_midjourney, tag_generative);

-- Canva AI tags
INSERT INTO tool_tags VALUES (tool_canva_ai, tag_image_gen), (tool_canva_ai, tag_generative), (tool_canva_ai, tag_mobile), (tool_canva_ai, tag_collaboration);

-- Adobe Firefly tags
INSERT INTO tool_tags VALUES (tool_adobe_firefly, tag_image_gen), (tool_adobe_firefly, tag_generative), (tool_adobe_firefly, tag_enterprise);

-- Notion AI tags
INSERT INTO tool_tags VALUES (tool_notion_ai, tag_generative), (tool_notion_ai, tag_collaboration), (tool_notion_ai, tag_summarization);

-- Otter.ai tags
INSERT INTO tool_tags VALUES (tool_otter_ai, tag_real_time), (tool_otter_ai, tag_summarization), (tool_otter_ai, tag_mobile), (tool_otter_ai, tag_collaboration);

-- Reclaim AI tags
INSERT INTO tool_tags VALUES (tool_reclaim_ai, tag_automation), (tool_reclaim_ai, tag_real_time);

-- Motion tags
INSERT INTO tool_tags VALUES (tool_motion, tag_automation), (tool_motion, tag_mobile);

-- Perplexity tags
INSERT INTO tool_tags VALUES (tool_perplexity, tag_real_time), (tool_perplexity, tag_api), (tool_perplexity, tag_mobile);

-- Elicit tags
INSERT INTO tool_tags VALUES (tool_elicit, tag_nlp), (tool_elicit, tag_summarization);

-- Runway tags
INSERT INTO tool_tags VALUES (tool_runway, tag_video_gen), (tool_runway, tag_generative);

-- Synthesia tags
INSERT INTO tool_tags VALUES (tool_synthesia, tag_video_gen), (tool_synthesia, tag_enterprise);

-- Descript tags
INSERT INTO tool_tags VALUES (tool_descript, tag_voice), (tool_descript, tag_collaboration);

-- ElevenLabs tags
INSERT INTO tool_tags VALUES (tool_elevenlabs, tag_voice), (tool_elevenlabs, tag_api), (tool_elevenlabs, tag_generative);

-- Mubert tags
INSERT INTO tool_tags VALUES (tool_mubert, tag_generative), (tool_mubert, tag_api), (tool_mubert, tag_mobile);

-- Tableau AI tags
INSERT INTO tool_tags VALUES (tool_tableau_ai, tag_analytics), (tool_tableau_ai, tag_enterprise);

-- Julius AI tags
INSERT INTO tool_tags VALUES (tool_julius_ai, tag_analytics), (tool_julius_ai, tag_nlp);

-- Copy.ai tags
INSERT INTO tool_tags VALUES (tool_copy_ai, tag_generative), (tool_copy_ai, tag_seo), (tool_copy_ai, tag_automation);

-- Manatal tags
INSERT INTO tool_tags VALUES (tool_manatal, tag_recruiting), (tool_manatal, tag_automation), (tool_manatal, tag_mobile);

-- Intercom AI tags
INSERT INTO tool_tags VALUES (tool_intercom_ai, tag_chatbot), (tool_intercom_ai, tag_nlp), (tool_intercom_ai, tag_enterprise);

-- Zendesk AI tags
INSERT INTO tool_tags VALUES (tool_zendesk_ai, tag_chatbot), (tool_zendesk_ai, tag_enterprise), (tool_zendesk_ai, tag_analytics);

-- Writesonic tags
INSERT INTO tool_tags VALUES (tool_writesonic, tag_generative), (tool_writesonic, tag_seo), (tool_writesonic, tag_chatbot);

-- Rytr tags
INSERT INTO tool_tags VALUES (tool_rytr, tag_generative), (tool_rytr, tag_translation);

-- QuillBot tags
INSERT INTO tool_tags VALUES (tool_quillbot, tag_nlp), (tool_quillbot, tag_translation), (tool_quillbot, tag_summarization);

-- Wordtune tags
INSERT INTO tool_tags VALUES (tool_wordtune, tag_nlp), (tool_wordtune, tag_translation);

-- Sudowrite tags
INSERT INTO tool_tags VALUES (tool_sudowrite, tag_generative), (tool_sudowrite, tag_nlp);

-- Codeium tags
INSERT INTO tool_tags VALUES (tool_codeium, tag_code_review), (tool_codeium, tag_api);

-- Replit tags
INSERT INTO tool_tags VALUES (tool_replit, tag_code_review), (tool_replit, tag_collaboration), (tool_replit, tag_mobile);

-- Perplexity already done, remaining:
-- Consensus tags
INSERT INTO tool_tags VALUES (tool_consensus, tag_nlp), (tool_consensus, tag_summarization);

-- Scite tags
INSERT INTO tool_tags VALUES (tool_scite, tag_analytics), (tool_scite, tag_api);

-- Semantic Scholar tags
INSERT INTO tool_tags VALUES (tool_semantic_scholar, tag_nlp), (tool_semantic_scholar, tag_api), (tool_semantic_scholar, tag_open_source);

-- DALL-E tags
INSERT INTO tool_tags VALUES (tool_dalle, tag_image_gen), (tool_dalle, tag_generative), (tool_dalle, tag_api);

-- Stable Diffusion tags
INSERT INTO tool_tags VALUES (tool_stable_diffusion, tag_image_gen), (tool_stable_diffusion, tag_generative), (tool_stable_diffusion, tag_open_source), (tool_stable_diffusion, tag_api);

-- Mem AI tags
INSERT INTO tool_tags VALUES (tool_mem_ai, tag_nlp), (tool_mem_ai, tag_mobile), (tool_mem_ai, tag_automation);

-- Obviously AI tags
INSERT INTO tool_tags VALUES (tool_obviously_ai, tag_analytics), (tool_obviously_ai, tag_api), (tool_obviously_ai, tag_automation);

-- Polymer tags
INSERT INTO tool_tags VALUES (tool_polymer, tag_analytics), (tool_polymer, tag_collaboration);

-- Pecan AI tags
INSERT INTO tool_tags VALUES (tool_pecan_ai, tag_analytics), (tool_pecan_ai, tag_enterprise);

-- Persado tags
INSERT INTO tool_tags VALUES (tool_persado, tag_enterprise), (tool_persado, tag_automation);

-- Albert AI tags
INSERT INTO tool_tags VALUES (tool_albert_ai, tag_automation), (tool_albert_ai, tag_analytics), (tool_albert_ai, tag_enterprise);

-- Phrasee tags
INSERT INTO tool_tags VALUES (tool_phrasee, tag_nlp), (tool_phrasee, tag_automation), (tool_phrasee, tag_analytics);

-- Brandwatch tags
INSERT INTO tool_tags VALUES (tool_brandwatch, tag_real_time), (tool_brandwatch, tag_analytics), (tool_brandwatch, tag_enterprise);

-- Fetcher tags
INSERT INTO tool_tags VALUES (tool_fetcher, tag_recruiting), (tool_fetcher, tag_automation), (tool_fetcher, tag_api);

-- Paradox tags
INSERT INTO tool_tags VALUES (tool_paradox, tag_recruiting), (tool_paradox, tag_chatbot), (tool_paradox, tag_mobile);

-- Pymetrics tags
INSERT INTO tool_tags VALUES (tool_pymetrics, tag_recruiting), (tool_pymetrics, tag_mobile), (tool_pymetrics, tag_analytics);

-- Humanly tags
INSERT INTO tool_tags VALUES (tool_humanly, tag_recruiting), (tool_humanly, tag_automation), (tool_humanly, tag_analytics);

-- Tidio tags
INSERT INTO tool_tags VALUES (tool_tidio, tag_chatbot), (tool_tidio, tag_real_time), (tool_tidio, tag_mobile);

-- Freshdesk AI tags
INSERT INTO tool_tags VALUES (tool_freshdesk_ai, tag_chatbot), (tool_freshdesk_ai, tag_automation), (tool_freshdesk_ai, tag_mobile);

-- Forethought tags
INSERT INTO tool_tags VALUES (tool_forethought, tag_chatbot), (tool_forethought, tag_nlp), (tool_forethought, tag_analytics);

RAISE NOTICE 'Seed data inserted successfully: 10 categories, 55 tools, features, pricing tiers, and tags';

END $$;
