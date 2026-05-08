---
title: "Module 3 · Slide Deck Maker"
description: "Generate a customer-ready deck from a prospect question using the GitHub App and Marp."
---

> **Time:** 50 min · **Format:** Choose-your-path (live) · **Surface:** GitHub App (alpha)
>
> **Prereq:** [Module 1 · GitHub App Setup](../01-github-app-setup/) complete. Everything in this module happens inside a single Copilot session in the GitHub App — the agent edits files, runs the slide tool in the session's built-in terminal, and you preview the deck in the session's built-in browser.
>
> **No-App fallback:** If GitHub App alpha access is unavailable, use the **No-App CLI fallback** near the end of this module.
>
> By the end of this module you'll have generated a polished, customer-ready slide deck answering a real prospect question — replacing 4–6 hours of manual deck-building with ~30 minutes of prompting.

---

## Purpose & Goal

Use Copilot to produce a **branded, on-message customer deck** in under an hour. After this module, you can:

- Show a customer-facing artifact you generated yourself, end-to-end, with Copilot.
- Speak to **Copilot reaching non-developer personas** — a critical seat-expansion narrative.
- Connect the experience to **AI Credits** and the "Copilot for everyone" upsell.

---

## Guided Steps (50 min)

### Step 1 — Pick your scenario (3 min)

Choose **one** customer scenario. **If you don't have a real one in mind, default to Scenario A or B** — both produce strong artifacts you can reuse.

- **Scenario A** *(recommended default)*: "Why GitHub Copilot Business vs. Enterprise for a 2,000-developer organization."
- **Scenario B** *(recommended default)*: "What changes for our customers when usage-based billing kicks in on June 1."
- **Scenario C**: "How GitHub Copilot supports our compliance and security requirements."
- **Scenario D**: "Copilot ROI for a non-developer audience — PMs, designers, sales."
- **Scenario E**: *Your own real prospect's open question.*

Write your scenario down. The whole module is grounded in this single brief.

### Step 2 — Add a working repo and start a session (3 min)

In the GitHub App, click the **+ Add repository** control (near the repo selector at the top). You have two easy options:

- **Easiest:** create a brand-new empty repo named `copilot-deck` on github.com (use the **New repository** button in the github.com UI — takes 30 seconds), then add it from the App.
- **Or:** point at any small empty repo of your own.

Open the repo in the App and start a fresh Copilot session. For the model, pick any **Claude Sonnet** — the default is fine. For mode, choose **Agent**.

> **What's Marp?** Marp is a tool that turns plain Markdown into slide decks (PDF or HTML). We use it because Copilot writes Markdown natively — so the agent can produce a real deck, not just an outline. **You don't have to install Marp yourself** — the agent will install it inside the session's own private copy of the repo in Step 4.

### Step 3 — Have the agent create your `notes.md` ground truth (7 min)

> **What's a Copilot Space?** A curated bundle of files and links you can attach to prompts so the agent always grounds its answers in your source material — a reusable knowledge base.

You won't create a real Copilot Space in this module (that's a stretch goal). Instead, we'll fake it with a single `notes.md` file the agent writes for you, and prompt as if you had a Space.

In your Copilot session, paste this prompt (fill in the bracketed bits with your scenario from Step 1):

```text
Create a file called notes.md in this repo. Put my customer brief in it,
structured with these sections:

- Scenario: <paste your scenario from Step 1>
- Audience: <who's in the room — title, technical depth, decision power>
- Customer constraints: <industry, size, current GitHub footprint, competitive lock-in>
- Reference material (URLs to cite):
  - https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/
  - https://github.com/features/copilot
  - <add 1-3 more relevant public GitHub Copilot URLs>
- Call to action: <what do you want the customer to DO after the deck>

Do not start writing the deck yet. Just create notes.md and confirm.
```

The agent will create the file. Inspect it in the session's **Changes** panel — this is the ground-truth file the next prompt will reference.

### Step 4 — First-pass deck generation (8 min)

In the same Copilot session, send this prompt (adapt the bracketed bits):

```text
Read notes.md in this repo for the scenario, audience, constraints, and CTA.

Produce a Marp-flavored markdown deck named deck.md with these properties:
- Title slide (customer-facing, includes today's date)
- 8-12 content slides, each with a clear single message
- One "agentic vs chat" slide that explains why usage varies wildly
- One pricing-mechanics slide referencing AI Credits, pooled credits, and
  admin budget controls (June 1, 2026 transition)
- Speaker notes on every slide (Marp <!-- --> style) with the exact words I
  would say, ~45 seconds per slide
- A closing CTA slide with 2-3 specific next steps
- Use Marp's "gaia" theme; consistent visual rhythm

Then, in the session terminal:
1. Initialize npm if needed and install Marp locally to this repo:
   npm init -y && npm install --save-dev @marp-team/marp-cli
2. Build the deck: npx marp deck.md

Be specific to this customer. No filler. No "thank you" slides.
```

The agent will write `deck.md`, install Marp inside the session's own private copy of the repo, and build `deck.html`.

> **Heads up:** these commands run inside the agent's session environment — not your local PowerShell. The `&&` chaining and `npm`/`npx` calls are the agent's job; you don't need to run them yourself.

**What you should see in the Changes panel:** `deck.md` with `---` slide separators, frontmatter at the top setting `marp: true` and `theme: gaia`, and `<!-- speaker notes -->` HTML comments under each slide. Plus `deck.html` once Marp finishes.

### Step 5 — Preview the deck in the GitHub App (5 min)

In the same session, ask the agent to serve the deck so you can view it inside the App:

```text
Serve deck.html on http://localhost:8000 with a simple static server
(npx http-server -p 8000 . is fine). Keep it running in the background.
```

Open the **built-in browser** tab (experimental flag from Module 1) and navigate to `http://localhost:8000/deck.html`. Browse all slides. Note 3 things you'd change.

> **First-run note:** `npx http-server` downloads the package the first time — expect ~10 seconds of silence before it's ready. Wait for the agent to confirm the server is running before opening the browser tab.
>
> The dev server stays running for the rest of the module — Steps 6 and 7 just refresh this same browser tab; you don't need to restart anything.
>
> If the built-in browser tab is missing, enable it via Settings → Experimental Flags → *Browser tabs* (covered in Module 1).

### Step 6 — Iterate on tone, structure, and visuals (10 min)

In the same Copilot session, use focused prompts. **Don't ask for everything at once** — small surgical edits.

> **Hard guardrail: cap yourself at 3–4 surgical passes.** Perfect is the enemy of done; you can keep iterating after the workshop.

- *"Slide 3's headline is generic. Rewrite it to lead with the customer's pain, not the product. Then rebuild deck.html."*
- *"Add a slide between 5 and 6 with a concrete cost example: a 200-dev team running 50% agentic, 50% chat for one month. Then rebuild deck.html."*
- *"The speaker notes on slide 8 are too long. Tighten to 30 seconds, no jargon. Then rebuild deck.html."*
- *"Restructure the deck so the CTA appears at slide 7, not the end. Move the pricing detail to an appendix section. Then rebuild deck.html."*

Each prompt = a session turn. Refresh the built-in browser tab after each rebuild.

### Step 7 — Export and review (8 min)

Ask the agent to produce the final outputs:

```text
Build deck.html and (if possible) deck.pdf as final exports.
```

> **PDF export needs Chrome available in the session sandbox** (Marp uses it under the hood). If `--pdf` fails, the `--html` output is just as customer-shareable — attach the file or host it.

Open the PDF (or HTML) in the built-in browser. Read it as if you're the customer. Mark every slide that is:

- ❌ Generic (could apply to any customer)
- ❌ Wrong (factually inaccurate or outdated)
- ❌ Off-message (doesn't ladder to your CTA)

For each red flag, do one more prompt-edit pass.

### Step 8 — Commit and PR your work (2 min)

Ask the agent: *"Commit notes.md, deck.md, and deck.html with a descriptive message, then open a pull request."*

The agent runs `git` for you inside the session — **you don't need a local clone of the repo on your laptop**. The PR shows up on github.com just like in Module 2. (You don't have to merge it — the PR itself is your portable artifact you can pull up on any device.)

> **If you're behind on time, skip this step** — it's optional. Step 9 (Seller Playbook) matters more for the debrief.

### Step 9 — Read the Seller Playbook (4 min)

Scan the Seller Playbook below before debrief — you'll talk to it. Focus on the **Pro+ as wedge** insight and the **"Copilot is for developers" objection handler**.

---

## No-App CLI fallback

Use this path only if the facilitator says GitHub App alpha access is unavailable.

1. Create a scratch repo locally:

   ```bash
   mkdir copilot-deck
   cd copilot-deck
   git init
   copilot --yolo
   ```

2. In the Copilot CLI session, use the same prompts from Steps 3 and 4. The agent should create `notes.md`, create `deck.md`, install Marp locally, and build `deck.html`.
3. For Step 5, ask the agent to serve the folder with `npx http-server -p 8000 .`, then open `http://localhost:8000/deck.html` in your regular browser instead of the GitHub App built-in browser.
4. Continue Steps 6 and 7 in the same CLI session. For Step 8, either skip the PR or create a private GitHub repo first, then ask the agent to push a branch and open a PR.

## Stretch Goals (take-home)

- Create an actual **Copilot Space** at <https://github.com/copilot/spaces> with curated GitHub Copilot collateral; regenerate the deck referencing the Space directly.
- Build the same deck for a different vertical (FinServ → Healthcare → Manufacturing) by changing only `notes.md`. Time how long the second pass takes.
- Try the same workflow in the **Copilot CLI** (`copilot --yolo` in a local folder) and compare the experience to running it in the GitHub App.
- Generate a **2-page customer-facing handout** version of the deck using the same notes.

---

## Seller Playbook (read before debrief)

### What you just experienced (the agentic lens)

- **Mostly chat-style** with bursts of agentic work. Each prompt = one model turn. The deck generation itself is a multi-file write but compact.
- Compared to Module 2, **dramatically lower token consumption** — but the *value* is on the same axis: a deck that took 4 hours now takes 30 minutes.
- **Important seller insight**: this is a workload that doesn't *need* an Enterprise SKU. Pro+ at $39/mo with $39 in AI Credits covers a *lot* of decks. That makes Copilot a reasonable individual purchase — and a wedge into broader org adoption.

### Premium Requests today

- Each prompt = roughly 1 Premium Request Unit (PRU) on a base model, 5–10 PRUs on Claude Opus. A full deck cycle = 20–40 PRUs.
- Annual Pro+ users stay on this through expiration; multipliers increase June 1.

### AI Credits after June 1

- Same workload → token-based, very predictable. **Cached tokens** matter here — prompt iterations on the same `notes.md` reuse cache, **lowering effective cost dramatically**. This is a great talking point: "the more you iterate, the cheaper each turn gets."
- For an org rolling Copilot to non-devs (PMs, sales), pooled credits matter: PMs use less than agentic devs, contributing their unused credits to the pool.

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
| PDF export fails | Session sandbox may be missing Chrome. Stick with the HTML output, or ask the agent to retry with `npx marp deck.md --pdf --allow-local-files`. |
