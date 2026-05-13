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
        'A hands-on, sales-focused workshop with 7 modules tying GitHub Copilot experience to the June 2026 usage-based billing transition.',
      expressiveCode: {
        themes: ['github-dark', 'github-light'],
      },
      social: [
        {
          icon: 'github',
          label: 'GitHub',
          href: 'https://github.com/jasonkeicher/mm-workshop-vsci',
        },
      ],
      sidebar: [
        { label: 'Overview', slug: '' },
        { label: 'Prerequisites', slug: 'prerequisites' },
        { label: 'Seller Playbook Overview', slug: 'seller-playbook-overview' },
        { label: 'Facilitator Guide', slug: 'facilitator-guide' },
        {
          label: 'Live modules',
          items: [
            { label: '1 · GitHub App Setup', slug: 'modules/01-github-app-setup' },
            { label: '3 · Slide Deck Maker', slug: 'modules/03-slide-deck-maker' },
          ],
        },
        {
          label: 'Take-home self-study',
          items: [
            { label: '2 · Prompt to PR', slug: 'modules/02-prompt-to-pr' },
            { label: '4 · Vibe-Code a Game', slug: 'modules/04-vibe-code-game' },
            { label: '5 · Chief of Staff', slug: 'modules/05-chief-of-staff' },
            { label: '6 · LLM-Assist', slug: 'modules/06-llm-assist' },
            { label: '7 · Copilot CLI', slug: 'modules/07-copilot-cli' },
          ],
        },
      ],
    }),
  ],
});
