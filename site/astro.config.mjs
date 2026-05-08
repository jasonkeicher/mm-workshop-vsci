import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// GitHub Pages deploy config.
// Set via env vars in CI (the workflow does this automatically from the repo name).
//   SITE_URL  -> e.g. https://USER.github.io
//   BASE_PATH -> e.g. /mm-workshop-vsci   (leave unset for a user/org root site)
const SITE_URL = process.env.SITE_URL;
const BASE_PATH = process.env.BASE_PATH || undefined;

export default defineConfig({
  site: SITE_URL,
  base: BASE_PATH,
  integrations: [
    starlight({
      title: 'Mid-Market Seller Copilot Workshop',
      description:
        'A hands-on, sales-focused workshop with 6 modules tying GitHub Copilot experience to the June 2026 usage-based billing transition.',
      expressiveCode: {
        themes: ['github-dark', 'github-light'],
      },
      social: [
        {
          icon: 'github',
          label: 'GitHub',
          href: 'https://github.com/',
        },
      ],
      sidebar: [
        { label: 'Overview', slug: '' },
        { label: 'Prerequisites', slug: 'prerequisites' },
        { label: 'Seller Playbook Overview', slug: 'seller-playbook-overview' },
        { label: 'Facilitator Guide', slug: 'facilitator-guide' },
        {
          label: 'Modules',
          items: [
            { label: '1 · GitHub App Setup (required)', slug: 'modules/01-github-app-setup' },
            { label: '2 · Prompt to PR', slug: 'modules/02-prompt-to-pr' },
            { label: '3 · Slide Deck Maker', slug: 'modules/03-slide-deck-maker' },
            { label: '4 · Vibe-Code a Game', slug: 'modules/04-vibe-code-game' },
            // Stage 3 take-home modules (5–7) are hidden from the sidebar but still build at their URLs.
            // { label: '5 · Chief of Staff (take-home)', slug: 'modules/05-chief-of-staff' },
            // { label: '6 · LLM-Assist (take-home)', slug: 'modules/06-llm-assist' },
            // { label: '7 · Copilot CLI (take-home)', slug: 'modules/07-copilot-cli' },
          ],
        },
      ],
    }),
  ],
});
