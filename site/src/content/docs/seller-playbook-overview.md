---
title: "Seller Playbook Overview"
description: "Commercial narrative: agentic usage, Premium Requests, GitHub AI Credits, and the June 1 2026 transition."
---

Every hands-on activity in this workshop ladders to one commercial narrative: **GitHub Copilot is moving to usage-based billing on June 1, 2026, and "agentic usage" is becoming the default.** Sellers who can connect a customer's *workflow* to *token consumption*, *AI Credits*, *pooled budgets*, and *admin governance* will close bigger, stickier deals.

Source: [GitHub Copilot is moving to usage-based billing](https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/) — Mario Rodriguez, April 27, 2026.

---

## The 60-Second Narrative (memorize this)

> Copilot has evolved from an in-editor assistant into an agentic platform — running long, multi-step coding sessions, using the latest models, and iterating across entire repos. A quick chat and a multi-hour autonomous session used to cost the same. That's not sustainable, and it forced us to gate heavy users with fallback models. Starting **June 1, 2026**, every Copilot plan includes a monthly allotment of **GitHub AI Credits**, and usage is measured by tokens — input, output, and cached — at published API rates. Plan prices don't change. Admins get budget controls. Credits pool across the org. Customers pay for what they actually use, and nothing surprises them.

---

## Three Concepts Every Seller Must Own

### 1. Agentic Usage (the "why")

- **Chat usage** = one prompt, one response. Cheap. Predictable.
- **Agentic usage** = a single prompt kicks off minutes-to-hours of model work — reading files, running commands, iterating, reviewing its own output. **10×–100× the tokens** of a chat turn.
- **What this means in the field**: when a customer says "we just want autocomplete," they're describing 2024 Copilot. When they say "we want our developers to ship features end-to-end with an agent," they're describing 2026 Copilot — and that workload's economics live in AI Credits.

### 2. Premium Requests (legacy — through annual plan expiration)

- Today's model: **Premium Request Units (PRUs)** consumed per request, with **model multipliers** (e.g., Claude Opus costs more PRUs than GPT-4o-mini per request).
- Annual Pro / Pro+ subscribers stay on this model **until their plan expires**. Model multipliers go up on June 1 for these annual plans.
- When the annual plan expires, the user moves to monthly + AI Credits, *or* to Copilot Free.
- **Talking point**: "If you're on monthly, you migrate June 1. If you're on annual, you keep PRUs until expiration — but multipliers are increasing."

### 3. GitHub AI Credits + Usage-Based Billing (June 1, 2026 →)

| Plan | Price | Included AI Credits / mo |
|---|---|---|
| Copilot Pro | $10 / mo | $10 |
| Copilot Pro+ | $39 / mo | $39 |
| **Copilot Business** | **$19 / user / mo** | **$19** (promo June-Aug: **$30 in credits**) |
| **Copilot Enterprise** | **$39 / user / mo** | **$39** (promo June-Aug: **$70 in credits**) |

**Key mechanics:**

- **Token-based** — input + output + cached tokens, billed at published API rates per model.
- **Code completions & Next Edit** are *not* metered — they're included on every plan.
- **Pooled credits** across the org — no stranded capacity. One developer's unused credits flow to a heavier user.
- **Admin budget controls** at enterprise / cost center / user level. Cap spend or allow overage at published rates.
- **No fallback model** — usage is governed by credits + budgets, not silent downgrades. (This is a *positive* — no surprise quality drop mid-session.)
- **Copilot Code Review** consumes AI Credits *and* GitHub Actions minutes (same per-minute rate as other Actions workflows). Flag this in any review-heavy customer conversation.
- **Preview bill** available in early May 2026 via the Billing Overview page — customers can see projected costs before the cutover.

---

## Per-Module Mapping

The workshop runs as **Stage 1 (live setup)** + **Stage 2 (one live deep-dive on slide decks)** + **Stage 3 (five take-home modules)**. Every stage feeds the same commercial throughline.

### Stage 1 · Live Setup

| Module | Primary motion | Why it matters commercially | SKU to position |
|---|---|---|---|
| **1 · GitHub App Setup** | Chat / setup | Low credit consumption, but it's the gateway: every agentic workflow customers will pay for lives behind this app. Sellers who've personally driven the install/sign-in/first-prompt loop talk to it 10× more credibly. | Any (foundational) |

### Stage 2 · Live Deep-Dive

| Module | Primary motion | Why it matters commercially | SKU to position |
|---|---|---|---|
| **3 · Slide Deck Maker** | Mixed | Iterative prompting + agent-generated artifacts. Shows Copilot reaches non-dev personas. Four deck types cover real seller motions: Customer Q&A, GitHub Docs summary, EBC deep-dive, Pricing transition. | Business → Enterprise (broader seat expansion) |

### Stage 3 · Take-home self-study

| Module | Primary motion | Why it matters commercially | SKU to position |
|---|---|---|---|
| **2 · Prompt to PR (Cart Page → Agent Merge)** | **Agentic-heavy** | Cart Page + Code Review + Agent Merge = long autonomous sessions. Maximum credit consumption — and maximum value. | Enterprise (governance + pooled credits) |
| **4 · Vibe-Code Game** | **Agentic-heavy** | End-to-end build from one prompt — disarms skeptical execs. | Pro+ as wedge, Business for orgs |
| **5 · Chief of Staff (Work-IQ)** | Mixed | M365 grounding + weekly digest = personal-productivity story for execs. | Pro+ for individuals, Enterprise for org rollout |
| **6 · LLM-Assist Account Research** | **Agentic-heavy** | Multi-step `/welcome` and account-plan flows = real research grounded in data. | Enterprise (data grounding, governance) |
| **7 · Copilot CLI Deep Dive** | Mixed | One-shot commands → `--yolo` / `/research` go fully agentic. MCP = extensibility story. | Enterprise (MCP, governance) |

---

## Customer Talk Track Templates

### Discovery questions

1. *"How much of your Copilot usage today is autocomplete vs. agentic — multi-step sessions, autonomous PRs?"*
2. *"How do you forecast Copilot spend today? Do you have visibility into per-team or per-developer consumption?"*
3. *"When a developer's PRU bucket hits zero, what happens to their workflow? Do they fall back to a smaller model?"*

### Objection: "Won't usage-based billing blow up my bill?"

> "Three things keep that from happening. **One**, your existing Business or Enterprise seat price already includes a baseline of AI Credits — $19 for Business, $39 for Enterprise — and we're giving you 50%+ extra during the June–August transition. **Two**, credits *pool across the org*, so a heavy user doesn't strand capacity from a light user. **Three**, you set hard budget caps at the enterprise, cost center, and user level. When the pool runs out, you choose whether to allow overage or stop. And the **preview bill** in early May lets you see projected cost *before* the cutover."

### Expansion play

1. **Land**: Business seats with pooled credits + admin budgets.
2. **Expand**: Add seats as agentic adoption spreads beyond engineering (PMs, sales, compliance — see Module 2 and 3).
3. **Upsell**: Move to Enterprise for richer governance, larger included credits, and Copilot Spaces for organizational knowledge.
4. **Add-on**: Purchase additional AI Credits as agentic workloads scale.

---

## Cheat Sheet — One-Liners by Persona

- **CFO / Procurement**: "Pooled credits + budget caps = zero risk of runaway spend. Preview bill in May lets you forecast."
- **CIO / VP Eng**: "Agentic is the new default. Credits align cost to value — autocomplete stays included, multi-hour agent sessions scale with usage."
- **Dev Lead**: "No more silent fallback to a weaker model when you hit a limit. You stay on the model you chose; admins control the budget envelope."
- **Compliance / Security**: "Admin budget controls + per-cost-center governance + pooled allocation. Workflows like our Compliance Check (Module 1) run in your tenant under your auth."

---

## What NOT to Say

- ❌ "Prices are going up." → Prices are **not** changing. Allotments are increasing.
- ❌ "You'll run out of requests." → There are no PRUs anymore (after June 1, post-annual). It's tokens, with budgets you control.
- ❌ "Fallback to a smaller model still works." → It does not. Usage is governed by credits + budgets.
- ❌ Quoting per-token rates from memory. → Always reference [the published API rates per model](https://docs.github.com/copilot/concepts/billing/usage-based-billing-for-organizations-and-enterprises).
