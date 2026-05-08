# Module 3 · Slide Deck Maker for Customer Conversations

> **Time:** 50 min · **Format:** Choose-your-path (live) · **Surface:** Copilot CLI (primary) or GitHub App / VS Code (alternative)
>
> **Prereq:** [Module 1 · GitHub App Setup](01-github-app-setup.md) complete. (Module 1 verified `copilot --version`; this module mostly stays in the CLI.)
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

### Step 2 — Set up a working folder (3 min)

```bash
mkdir copilot-deck && cd copilot-deck
git init
echo "# Deck working folder" > README.md
```

If Marp isn't installed:

```bash
npm install -g @marp-team/marp-cli
```

### Step 3 — Write your `notes.md` ground truth (7 min)

You won't create a real Copilot Space in this module (that's a stretch goal), but you'll prompt as if you have one. Open `notes.md` and paste in the **inputs your prompt will reference**:

- Your scenario (from Step 1).
- Audience: who's in the room? Title, technical depth, decision power.
- Customer constraints you know: industry, size, current GitHub footprint, competitive lock-in.
- 3–5 URLs of public GitHub Copilot collateral you'll cite (e.g., the [usage-based billing blog](https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/), [GitHub Copilot product page](https://github.com/features/copilot)).
- Your call-to-action — what do you want the customer to *do* after the deck?

Save it. This is your "ground truth" file the agent will read.

### Step 4 — First-pass deck generation (10 min)

Start a Copilot CLI session:

```bash
copilot --yolo --disable-mcp-server github
```

Use this prompt (adapt the bracketed bits):

```text
You are a senior GitHub solutions consultant building a customer-facing slide
deck. Read notes.md in this folder for the scenario, audience, constraints,
and CTA.

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

Be specific to this customer. No filler. No "thank you" slides.
```

The agent will read `notes.md`, ask any clarifying questions, then write `deck.md`.

### Step 5 — Preview in Marp (5 min)

```bash
marp --preview deck.md
```

Marp opens a live preview. Browse all slides. Note 3 things you'd change.

### Step 6 — Iterate on tone, structure, and visuals (10 min)

In the same Copilot CLI session, use focused prompts. **Don't ask for everything at once** — small surgical edits. **Aim for 3–4 surgical passes**, not perfection.

- *"Slide 3's headline is generic. Rewrite it to lead with the customer's pain, not the product."*
- *"Add a slide between 5 and 6 with a concrete cost example: a 200-dev team running 50% agentic, 50% chat for one month."*
- *"The speaker notes on slide 8 are too long. Tighten to 30 seconds, no jargon."*
- *"Restructure the deck so the CTA appears at slide 7, not the end. Move the pricing detail to an appendix section."*

Each prompt = a session turn. Re-run `marp --preview` after each round.

### Step 7 — Export and review (8 min)

```bash
marp deck.md --pdf
marp deck.md --html
```

Open the PDF. Read it as if you're the customer. Mark every slide that is:

- ❌ Generic (could apply to any customer)
- ❌ Wrong (factually inaccurate or outdated)
- ❌ Off-message (doesn't ladder to your CTA)

For each red flag, do one more prompt-edit pass.

### Step 8 — Commit your work (2 min)

```bash
git add .
git commit -m "Customer deck: <scenario>"
```

Optional: push to a private repo so you can pull it up on any device for the next customer call.

### Step 9 — Read the Seller Playbook (3 min)

Scan the Seller Playbook below before debrief — you'll talk to it.

---

## Stretch Goals (take-home)

- Create an actual **Copilot Space** at <https://github.com/copilot/spaces> with curated GitHub Copilot collateral; regenerate the deck referencing the Space directly.
- Build the same deck for a different vertical (FinServ → Healthcare → Manufacturing) by changing only `notes.md`. Time how long the second pass takes.
- Try the same workflow in the **GitHub App** (Chat panel) and compare the experience.
- Generate a **2-page customer-facing handout** version of the deck using the same notes.

---

## Seller Playbook (read before debrief)

### What you just experienced (the agentic lens)

- **Mostly chat-style** with bursts of agentic work. Each prompt = one model turn. The deck generation itself is a multi-file write but compact.
- Compared to Module 2, **dramatically lower token consumption** — but the *value* is on the same axis: a deck that took 4 hours now takes 30 minutes.
- **Important seller insight**: this is a workload that doesn't *need* an Enterprise SKU. Pro+ at $39/mo with $39 in AI Credits covers a *lot* of decks. That makes Copilot a reasonable individual purchase — and a wedge into broader org adoption.

### Premium Requests today

- Each prompt = roughly 1 PRU on a base model, 5–10 PRUs on Claude Opus. A full deck cycle = 20–40 PRUs.
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
| `copilot` command not found | Install per [Copilot CLI docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli) |
| Marp render breaks | Check frontmatter: `--- marp: true theme: gaia ---` at top of `deck.md` |
| Speaker notes don't show | Marp comment syntax: `<!-- speaker notes here -->` (must be HTML comment, not Markdown) |
| Agent rewrites too much | Be more surgical: name the slide and the change. "On slide 5, replace headline only." |
| PDF export blank | Update Marp CLI: `npm update -g @marp-team/marp-cli`. Try `marp deck.md --pdf --allow-local-files`. |
