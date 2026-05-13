# Module 2 · Slide Deck Maker for Customer Conversations

> **Time:** 60 min · **Format:** Live deep-dive (everyone runs this module) · **Surface:** GitHub App (alpha)
>
> **Prereq:** [Module 1 · GitHub App Setup](01-github-app-setup.md) complete. Everything in this module happens inside a single Copilot session in the GitHub App — the agent edits files, runs the slide tool in the session's built-in terminal, and you preview the deck in the session's built-in browser.
>
> **No-App fallback:** If GitHub App alpha access is unavailable, use the **No-App CLI fallback** near the end of this module.
>
> **Node.js 18+ required.** The session terminal runs `npm install` and `npx marp` to build the deck. If you're using the No-App CLI fallback (or if your sandbox is unusual), confirm `node -v` reports `v18.x` or higher *before* starting. If npm fails with an "engine" error mid-build, this is the cause.
>
> By the end of this module you'll have generated a polished, customer-ready slide deck answering a real prospect question — replacing 4–6 hours of manual deck-building with ~45 minutes of prompting. The final 5–7 minutes are a group debrief (Step 9).

---

## Purpose & Goal

Use Copilot to produce a **branded, on-message customer deck** in under an hour. After this module, you can:

- Show a customer-facing artifact you generated yourself, end-to-end, with Copilot.
- Speak to **Copilot reaching non-developer personas** — a critical seat-expansion narrative.
- Connect the experience to **AI Credits** and the "Copilot for everyone" upsell.

---

## Guided Steps (60 min · debrief embedded in Step 9)

### Step 1 — Pick your deck type (3 min)

Pick **one** of these four deck types. The agent flow is identical for all four — only your `notes.md` brief and a couple of iteration prompts change. If you have no upcoming customer conversation in mind, **default to Type A** (Customer Q&A) — it's the most reusable. Otherwise pick the type that matches a real meeting on your calendar; the debrief is more fun with a mix in the room.

| Type | What you'll build | Best fit if… |
|---|---|---|
| **A · Customer Q&A** *(default)* | A deck answering a real prospect question (pricing, security, ROI, etc.) | You have a specific customer conversation coming up |
| **B · GitHub Docs summary** | A "what's in this docs page, in 10 slides" deck built from 1–3 GitHub Docs URLs | You want to learn a GitHub topic by teaching it — or brief a customer who hasn't read the docs |
| **C · EBC deep-dive** | An exec-briefing-style deck on a chosen GitHub topic (Copilot agents, Advanced Security, Actions, Spaces…) | You have an upcoming EBC, exec briefing, or QBR |
| **D · Pricing transition** | A procurement/CFO-ready deck on the June 1 AI Credits cutover | You're prepping for billing/procurement conversations |

Write down which type you picked. The whole module is grounded in this single brief.

### Step 2 — Add a working repo and start a session (3 min)

In the GitHub App, click the **+ Add repository** control (near the repo selector at the top). You have two easy options:

- **Easiest:** create a brand-new empty repo named `copilot-deck` on github.com (use the **New repository** button in the github.com UI — takes 30 seconds), then add it from the App.
- **Or:** point at any small empty repo of your own.

Open the repo in the App and start a fresh Copilot session. For the model, pick any **Claude Sonnet** — the default is fine. For mode, choose **Agent**.

> **What's Marp?** Marp is a tool that turns plain Markdown into slide decks (PDF or HTML). We use it because Copilot writes Markdown natively — so the agent can produce a real deck, not just an outline. **You don't have to install Marp yourself** — the agent will install it inside the session's own private copy of the repo in Step 4.

### Step 3 — Have the agent create your `notes.md` ground truth (7 min)

> **What's a Copilot Space?** A curated bundle of files and links you can attach to prompts so the agent always grounds its answers in your source material — a reusable knowledge base.

You won't create a real Copilot Space in this module (that's a stretch goal). Instead, we'll fake it with a single `notes.md` file the agent writes for you, and prompt as if you had a Space.

**Use the prompt template for the deck type you picked in Step 1.** Fill in the bracketed bits and paste into your Copilot session.

#### Type A · Customer Q&A — `notes.md` prompt

```text
Create a file called notes.md in this repo. Put my customer brief in it,
structured with these sections:

- Deck type: Customer Q&A
- Customer question / topic: <the specific question or topic you're answering>
- Audience: <who's in the room — title, technical depth, decision power>
- Customer constraints: <industry, size, current GitHub footprint, competitive lock-in>
- Reference material (URLs to cite):
  - https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/
  - https://github.com/features/copilot
  - <add 1-3 more relevant public GitHub Copilot URLs>
- Call to action: <what do you want the customer to DO after the deck — book a pilot, schedule technical session, sign LOI>

Do not start writing the deck yet. Just create notes.md and confirm.
```

#### Type B · GitHub Docs summary — `notes.md` prompt

```text
Create a file called notes.md in this repo. I want to build a "what's in this
docs page, in 10 slides" deck. Structure notes.md with:

- Deck type: GitHub Docs summary
- Source docs URLs (read these before writing the deck):
  - <paste 1-3 GitHub Docs URLs, e.g. https://docs.github.com/en/copilot/concepts/billing/usage-based-billing-for-organizations-and-enterprises>
  - <https://docs.github.com/en/copilot/concepts/spaces>
  - <https://docs.github.com/en/code-security/getting-started/quickstart-for-securing-your-repository>
- Audience: <internal team OR customer — and their technical depth>
- What I want the audience to walk away knowing: <2-3 takeaways>
- Tone: <educational / pragmatic / exec-summary>
- Call to action: <next step — read the full docs, schedule deep-dive, etc.>

Do not start writing the deck yet. Fetch the URLs, summarize what each
contains in 2-3 lines inside notes.md, then confirm.
```

#### Type C · EBC deep-dive — `notes.md` prompt

```text
Create a file called notes.md in this repo. I'm building an EBC-style
deep-dive deck. Structure notes.md with:

- Deck type: EBC deep-dive
- Topic: <Copilot agents | GitHub Advanced Security | GitHub Actions | Copilot Spaces | other>
- Audience: <customer exec titles, e.g. CTO + VP Eng + Security Lead>
- Their current GitHub maturity: <green-field / partial adoption / heavy user>
- The vision arc I want to land (3 beats): <where they are -> where Copilot/GitHub takes them -> what changes for their org>
- Reference material (URLs to cite):
  - <FILL IN: a https://github.com/features/... product page relevant to your topic>
  - <FILL IN: a recent https://github.blog/... post or launch announcement>
  - <add 1-3 more relevant URLs>
- Roadmap-safe statements only: yes (no NDA forward-looking detail)
- Call to action: <pilot, joint POC, exec sponsor alignment, etc.>

Do not start writing the deck yet. Just create notes.md and confirm.
```

#### Type D · Pricing transition — `notes.md` prompt

```text
Create a file called notes.md in this repo. I'm building a procurement /
CFO-ready deck on the GitHub Copilot June 1, 2026 transition to usage-based
billing. Structure notes.md with:

- Deck type: Pricing transition
- Audience: <Procurement lead | CFO | VP Eng | mixed>
- Customer's current Copilot footprint: <seats, plan, annual vs monthly>
- Their top concern: <bill predictability / governance / cost increase fear / migration timing>
- Reference material (URLs to cite):
  - https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/
  - https://docs.github.com/en/copilot/concepts/billing/usage-based-billing-for-organizations-and-enterprises
  - https://github.com/pricing
- Call to action: <review preview bill in May, schedule budget-controls walkthrough, etc.>

Do not start writing the deck yet. Just create notes.md and confirm.
```

The agent will create the file (and for Type B, also fetch and summarize the docs URLs). Inspect it in the session's **Changes** panel — this is the ground-truth file the next prompt will reference.

> **Type B note:** if the agent says it can't fetch URLs (web-fetch isn't guaranteed across all model/App combinations), paste the relevant section text inline into `notes.md` instead of relying on the agent to read the URLs directly.

### Step 4 — First-pass deck generation (10 min)

In the same Copilot session, send this prompt. **This is the same for all four deck types** — Copilot will adapt based on the `notes.md` you wrote in Step 3.

> **Before you paste, check your deck type:**
> - **Type B (GitHub Docs summary):** delete the "agentic vs chat" and "pricing-mechanics" lines from the prompt below. They don't fit a docs-faithful deck. Tell the agent in the same turn: *"Stay faithful to the source docs content."*
> - **Type D (Pricing transition):** *expand* those two slides into 3–4 slides each — they're the core of your deck. Add to the prompt: *"Treat 'agentic vs chat' and 'pricing-mechanics' as 3–4 slides each, not one slide each."*
> - **Types A and C:** paste the prompt as-is.

```text
Read notes.md in this repo for the deck type, audience, constraints, and CTA.

Produce a Marp-flavored markdown deck named deck.md with these properties:
- Title slide (customer-facing, includes today's date)
- 8-12 content slides, each with a clear single message
- One "agentic vs chat" slide that explains why usage varies wildly
- One pricing-mechanics slide referencing AI Credits, pooled credits, and
  admin budget controls (June 1, 2026 transition)
- Speaker notes on every slide as HTML comments AFTER the slide content
  (Marp <!-- speaker notes --> style — keep them separate from any frontmatter
  or Marp directive comments), ~45 seconds per slide
- A closing CTA slide with 2-3 specific next steps
- Use Marp's "gaia" theme; consistent visual rhythm

Then, in the session terminal:
1. If package.json doesn't already exist, run: npm init -y
2. Install Marp locally to this repo: npm install --save-dev @marp-team/marp-cli
3. Build the deck: npx marp deck.md

Be specific to this audience. No filler. No "thank you" slides.
```

The agent will write `deck.md`, install Marp inside the session's own private copy of the repo, and build `deck.html`.

> **Heads up:** these commands run inside the agent's session environment — not your local PowerShell or Terminal. The `&&` chaining and `npm`/`npx` calls are the agent's job; you don't need to run them yourself.
>
> **Timing:** the first `npm install` on a cold cache takes ~30–120 seconds (it pulls ~150 packages). Subsequent rebuilds of the deck are under 5 seconds. Don't worry if there's a silent pause after the agent kicks off the install — wait for it to confirm `deck.html` exists before moving on.

**What you should see in the Changes panel:** `deck.md` with `---` slide separators, frontmatter at the top setting `marp: true` and `theme: gaia`, and `<!-- speaker notes -->` HTML comments under each slide. Plus `deck.html` once Marp finishes. **If only `deck.md` appears and `deck.html` is missing, the Marp build failed** — tell the agent: *"The Marp build didn't produce deck.html — please re-run `npx marp deck.md` and report any errors."*

### Step 5 — Preview the deck in the GitHub App (5 min)

In the same session, ask the agent to serve the deck so you can view it inside the App:

```text
Serve deck.html on http://localhost:8000 with a simple static server.
Run: npx -y http-server -p 8000 .
Start it as a background process so the session can keep accepting prompts,
and confirm the server URL once it's listening.
```

Open the **built-in browser** tab (experimental flag from Module 1) and navigate to `http://localhost:8000/deck.html`. Browse all slides. Note 3 things you'd change.

> **First-run note:** `npx -y http-server` downloads the package the first time — expect ~10 seconds of silence before it's ready. The `-y` flag auto-accepts the install prompt so the session doesn't stall waiting for input. Wait for the agent to confirm the server is running before opening the browser tab.
>
> The dev server stays running for the rest of the module — Steps 6 and 7 just refresh this same browser tab; you don't need to restart anything.
>
> If port 8000 is already in use, retry with `-p 8001` and open `http://localhost:8001/deck.html` instead.
>
> If the built-in browser tab is missing, enable it via Settings → Experimental Flags → *Browser tabs* (covered in Module 1).

### Step 6 — Iterate on tone, structure, and visuals (15 min)

In the same Copilot session, use focused prompts. **Don't ask for everything at once** — small surgical edits.

> **Hard guardrail: cap yourself at 3–5 surgical passes.** Perfect is the enemy of done; you can keep iterating after the workshop.

**Generic surgical prompts (any deck type):**

- *"Slide 3's headline is generic. Rewrite it to lead with the audience's pain, not the product. Then rebuild deck.html."*
- *"The speaker notes on slide 8 are too long. Tighten to 30 seconds, no jargon. Then rebuild deck.html."*
- *"Restructure the deck so the CTA appears at slide 7, not the end. Move the supporting detail to an appendix section. Then rebuild deck.html."*

**Type-specific prompts to try:**

- **Type A (Customer Q&A):** *"Add a slide between 5 and 6 with a concrete cost example: a 200-dev team running 50% agentic, 50% chat for one month. Then rebuild deck.html."*
- **Type B (GitHub Docs summary):** *"Summarize section 4 of the source docs into a single slide. Pull 1–2 direct quotes from the docs into the speaker notes. Then rebuild deck.html."*
- **Type C (EBC deep-dive):** *"Add a 'demo callout' slide after the product overview: 90 seconds of what we'd show live in the EBC, with the customer's exact use case named. Then rebuild deck.html."*
- **Type D (Pricing transition):** *"Add a slide modeling our customer's actual spend before and after June 1: 350 Business seats, ~30% heavy agentic users. Cite the exact pricing source you used and state any assumptions explicitly. If specific rates aren't in the source, use a clearly-labeled illustrative model rather than guessing. Then rebuild deck.html."*

Each prompt = a session turn. Refresh the built-in browser tab after each rebuild.

### Step 7 — Export and review (5 min)

Ask the agent to produce the final outputs:

```text
Run these two commands in the session terminal and report any errors:
1. npx marp deck.md          (HTML export — required deliverable)
2. npx marp deck.md --pdf    (PDF export — best-effort)

If the PDF step fails, keep the HTML output and tell me what the error was.
```

> **HTML is the required deliverable; PDF is best-effort.** Marp's PDF export uses a bundled headless browser; in a locked-down sandbox that browser may not be available and the `--pdf` command will fail. The HTML output is just as customer-shareable — attach the file or host it.
>
> If your deck references local image files and the PDF export complains about file access, retry with `npx marp deck.md --pdf --allow-local-files` (this flag is *only* for local-asset access, not a Chrome-availability fix).

Open the PDF (or HTML) in the built-in browser. Read it as if you're the customer. Mark every slide that is:

- ❌ Generic (could apply to any customer)
- ❌ Wrong (factually inaccurate or outdated)
- ❌ Off-message (doesn't ladder to your CTA)

For each red flag, do one more prompt-edit pass.

### Step 8 — Commit and PR your work (2 min)

Ask the agent: *"Commit notes.md, deck.md, and deck.html with a descriptive message, then open a pull request."*

> **Prereq for this step:** the repo you added in Step 2 must be one you own (or have push access to). If you pointed the App at someone else's repo, the agent's push will 403 — skip to Step 9.

The agent runs `git` for you inside the session — **you don't need a local clone of the repo on your laptop**. The PR shows up on github.com just like a normal PR. (You don't have to merge it — the PR itself is your portable artifact you can pull up on any device during the debrief.)

> **If you're behind on time, skip this step** — it's optional. Step 9 (debrief) matters more.

### Step 9 — Group debrief (5–7 min, facilitator-led)

This is the workshop's only debrief — it lives here, not in a separate block. The facilitator will round-robin everyone in the room, **grouped by deck type (A → B → C → D)**:

1. **Show your deck** (~30 sec each): pop open `deck.html` in the built-in browser (or PDF). Screen-share if remote.
2. **One thing that surprised you** (1 sentence each).
3. **One Seller Playbook moment** (1 sentence each): which part of your activity was *agentic*? How would you describe the cost to a customer?

Hold the Seller Playbook reading below until after the workshop if time is tight — you'll talk to the punchlines from memory during the debrief.

---

## No-App CLI fallback

Use this path only if the facilitator says GitHub App alpha access is unavailable.

**Preflight checks first** (run these locally and confirm each one succeeds — Node 18+ is the most common gotcha):

```bash
node --version    # must be v18.x or higher
npm --version     # must be present
copilot --version # the Copilot CLI must be installed (see Module 1 prereqs)
gh auth status    # GitHub CLI authenticated
```

If `copilot` is "command not found", flag the facilitator before going further — the CLI install is covered in Module 1's prereqs.

1. Create a scratch repo locally:

   ```bash
   mkdir copilot-deck
   cd copilot-deck
   git init
   copilot --yolo
   ```

   You should see an interactive Copilot CLI session start up (banner / prompt indicating you're in an agentic session). If you get "command not found" or it exits immediately, the CLI isn't installed — flag the facilitator.

2. In the Copilot CLI session, use the same prompts from Steps 3 and 4 (pick the deck-type template that matches your choice in Step 1). The agent should create `notes.md`, create `deck.md`, install Marp locally, and build `deck.html`.
3. For Step 5, ask the agent to serve the folder with `npx -y http-server -p 8000 .`, then open `http://localhost:8000/deck.html` in your regular browser instead of the GitHub App built-in browser.
4. Continue Steps 6 and 7 in the same CLI session. For Step 8, either skip the PR or create a private GitHub repo first, then ask the agent to push a branch and open a PR.

## Stretch Goals (take-home)

- Create an actual **Copilot Space** at <https://github.com/copilot/spaces> with curated GitHub Copilot collateral; regenerate the deck referencing the Space directly.
- Build the same deck for a different vertical (FinServ → Healthcare → Manufacturing) by changing only `notes.md`. Time how long the second pass takes.
- Try the same workflow in the **Copilot CLI** (`copilot --yolo` in a local folder) and compare the experience to running it in the GitHub App.
- Generate a **2-page customer-facing handout** version of the deck using the same notes.
- Run a second deck type back-to-back — e.g. you did Type A live; build a Type D for the same customer at home.

---

## Seller Playbook (read after the workshop)

### What you just experienced (the agentic lens)

- **Mostly chat-style** with bursts of agentic work. Each prompt = one model turn. The deck generation itself is a multi-file write but compact.
- **Dramatically lower token consumption** than a Cart Page → Agent Merge workflow — but the *value* is on the same axis: a deck that took 4 hours now takes 45 minutes.
- **Important seller insight**: this is a workload that doesn't *need* an Enterprise SKU. Pro+ at $39/mo with $39 in AI Credits covers a *lot* of decks. That makes Copilot a reasonable individual purchase — and a wedge into broader org adoption.

### Premium Requests today

- Each prompt = roughly 1 Premium Request Unit (PRU) on a base model, 5–10 PRUs on Claude Opus. A full deck cycle = 20–40 PRUs.
- Annual Pro+ users stay on this through expiration; multipliers increase June 1.

### AI Credits after June 1

- Same workload → token-based, very predictable. **Cached tokens** matter here — prompt iterations on the same `notes.md` reuse cache, **lowering effective cost dramatically**. This is a great talking point: "the more you iterate, the cheaper each turn gets."
- For an org rolling Copilot to non-devs (PMs, sales), pooled credits matter: PMs use less than agentic devs, contributing their unused credits to the pool.

### Which deck type opens which expansion conversation

- **Type A (Customer Q&A)** → land/expand inside the customer's current GitHub footprint. Best for AE-led conversations.
- **Type B (GitHub Docs summary)** → internal enablement angle. Use it to onboard your customer's champions; convert champions into seat expansion.
- **Type C (EBC deep-dive)** → executive-sponsor conversations. Pair with the Customer Success team; lands the multi-year story.
- **Type D (Pricing transition)** → procurement + CFO conversations. This is the deck that closes the renewal cleanly through the June 1 cutover.

### Customer talk track

**Discovery:**

- *"Who's building decks for your customer conversations today, and how long does each take?"*
- *"Has Copilot adoption in your org spread beyond engineering yet?"*
- *"If your sales team had Copilot Business seats, what would they use it for?"*

**Objection: "Copilot is for developers, not for my sales team."**

> "It used to be. Today, the same Copilot license that writes code also writes customer decks, summarizes meetings, drafts proposals, and does account research. The agentic workloads — like the deck I just built — run on the same AI Credits as the dev work. **Pooled credits** mean a non-dev's lighter usage actually subsidizes your engineering team's heavier agentic sessions."

### Expansion play

- **Land**: Copilot Business for the dev org.
- **Expand**: add seats for sales, PM, marketing — each with their own use case (decks, briefs, content). Same SKU, broader adoption.
- **Upsell**: Enterprise for centralized governance + Copilot Spaces (so the marketing team's brand guide becomes a Space the sellers prompt against).

### One-line takeaway you can use Monday

> "I built a customer-ready deck end-to-end with Copilot in under an hour. That same workflow works for your sales, marketing, and PM teams — and it's the same SKU your developers already have."

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| Can't add a new repo from the App | Confirm GitHub App alpha access (covered in Module 1); try refreshing the repo picker |
| Built-in browser tab missing | Settings → Experimental Flags → enable *Browser tabs* (covered in Module 1) |
| Marp install fails in session terminal | Check Node version (`node -v` should be 18+); retry the install command |
| Marp render breaks | Check frontmatter: `marp: true` and `theme: gaia` in `deck.md` frontmatter |
| Speaker notes don't show | Marp comment syntax: `<!-- speaker notes here -->` (must be HTML comment, not Markdown) |
| Agent rewrites too much | Be more surgical: name the slide and the change. "On slide 5, replace headline only." |
| Agent stops mid-build / session times out | Just say *"continue"* in the same session — the session's worktree state is preserved across turns |
| PDF export fails | Marp's PDF export uses a bundled headless browser; in a locked-down session sandbox that browser may be unavailable. Keep the HTML output — it's just as customer-shareable. (`--allow-local-files` is *only* for embedding local image files; it does **not** fix a missing browser.) |
| Deck-type reference URLs unreachable | Fall back to Type A (Customer Q&A) — it only relies on your own brief plus stable GitHub URLs |
