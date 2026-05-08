---
title: "Module 2 · Prompt to PR"
description: "Drive a coding agent from prompt to merged PR end-to-end with Copilot Code Review and Agent Merge."
---

> **Time:** 50 min · **Format:** Choose-your-path (live) · **Surface:** GitHub App (alpha)
>
> **Prereq:** [Module 1 · GitHub App Setup](01-github-app-setup.md) complete. The app is installed, signed in, and you've run a smoke-test prompt.
>
> By the end of this module you'll have driven a coding agent from a single prompt through implementation, a built-in browser test, a pull request, automated code review, and Agent Merge — without leaving the GitHub App.

---

## Purpose & Goal

Experience the **agentic SDLC** end-to-end. After this module, you can:

- Demo "idea → working PR" to a customer in under 15 minutes.
- Speak to **session-based development**, **worktrees**, **parallel agents**, and **automated code review** from firsthand experience.
- Tie the workflow back to **AI Credits and agentic usage** with concrete examples.

---

## Guided Steps (50 min)

### Step 1 — Add the demo repo and kick off the agent (5 min)

In the GitHub App, click the split button next to the repo selector → **"Add GitHub repository"**. Search for `demo_octocat_supply` and add it.

**Immediately** start a new Copilot session in the repo with this prompt (don't tour while it runs — let the agent work):

```text
I want to add a Cart Page to the frontend application. The page should:
- Display all items currently in the cart with their quantities and prices
- Allow updating quantities and removing items
- Show a subtotal, shipping fee ($25, free for orders over $150), and total
- Add a cart icon to the NavBar that shows the number of items and navigates to the cart page when clicked

Use the existing product and cart patterns in the codebase.
```

Pick **Claude Sonnet 4.6** (or better) as the model. Choose **Interactive** mode for the first run.

### Step 2 — Worktree callout (2 min)

While the agent works, right-click the session in the sidebar → **"Reveal in Finder"** (Mac) / **"Show in Explorer"** (Win). The session lives in its own folder under `.copilot/`. **This is why parallel agents don't conflict** — each session gets its own worktree.

Click **"Open in VS Code"** (top-right of the session) if you want to step out to a full IDE — it opens the worktree directly.

### Step 3 — Review the plan (3 min)

Open the side panel. The agent's structured plan should show:

- The to-do items the agent identified.
- Live spinners on in-progress items, green checkmarks on completed ones.
- A summary of the approach the agent took.

If the agent is still mid-implementation, glance at the **Changes** view to see which files it's touching.

### Step 4 — Run the app in the built-in browser (10 min)

Once the agent reports done, in the session's built-in terminal:

```bash
make dev
```

Open the **built-in browser** tab (experimental flag from Module 1) → navigate to `http://localhost:3000`. Test:

- Cart icon in the NavBar shows item count.
- Click cart → items list, quantity changes, remove button.
- Subtotal recalculates. Shipping is $25 under $150, free over.

If something doesn't work, prompt the agent: *"The cart icon doesn't update when I add items. Investigate and fix."*

### Step 5 — Create and review the PR (12 min)

Ask the agent: *"Looks good. Create a pull request."*

When the PR opens:

- Read the **PR description** — it's not "Added files," it's a meaningful summary.
- Watch **CI/CD checks** kick off.
- **Copilot Code Review** posts inline comments. Read at least 3.
- Click **"Fix unresolved comments"** — the agent addresses all CCR feedback in one go.

### Step 6 — Try Agent Merge (5 min)

On the PR page, click **"Agent Merge"**. Read the description: the agent now continuously scans for CI failures, CCR comments, CodeQL findings, and human review feedback — driving the PR toward merge-readiness.

> Important: it will **not** auto-merge. It waits for a human approval. The point isn't to remove the human — it's to make their review valuable instead of rubber-stamping formatting fixes.

### Step 7 — Seller Playbook reading & reflection (13 min)

Stop driving and read through the **Seller Playbook** below. You'll talk to it during the debrief.

---

## Stretch Goals (take-home)

- **Fleet Mode for Order Tracking** — in the same repo open a new session in **Plan** mode, prompt for a multi-component order tracking page, then **"Approve and implement with Fleet"** → multiple agents spin up in parallel, each in its own worktree, each producing its own PR. **This is where AI Credit consumption gets serious — and so does the customer value.**
- Run the **Compliance Workflow** demo (Workflows tab) — schedule a recurring compliance check that combines a Copilot Space with the repo. Generates a structured Issue report.
- Try a different model (Claude Opus 4.6) for one session and observe the difference in token consumption.
- Open one of your own real repos and ask the agent to build something small.

---

## Seller Playbook (read before debrief)

### What you just experienced (the agentic lens)

- The Cart Page session was **agentic** — one prompt, multi-file changes, terminal commands, browser test, PR, CCR fixes. Probably 20–60 minutes of model time. **High token consumption.**
- The "summarize this PR" or "explain this file" interactions were **chat** — single turn. Cheap.
- **Agent Merge** is *continuously* agentic — it keeps doing work in the background until the PR is mergeable.
- **Fleet mode** (stretch goal) is *parallel* agentic — N agents × M minutes each = highest credit burn in any module.

### Premium Requests today (annual customers, until expiration)

- The Cart Page run probably consumed dozens of premium requests under the legacy model. Annual Pro/Pro+ customers stay on this until expiration; **model multipliers go up June 1**.

### AI Credits after June 1

- Same Cart Page run → token-based: input + output + cached, at the model's published API rate. **Credits pool across the org.** A heavy agentic user (like the seller doing this demo) draws from the pool; a colleague doing only autocomplete contributes their unused credits.
- **Code Review** here also burns **GitHub Actions minutes** — flag this in any review-heavy customer.
- **No fallback model.** When a developer running Fleet mode hits the budget cap, they don't silently get a worse model — they hit a budget gate the admin set.

### Customer talk track

**Discovery (ask one of these):**

- *"How long does it take a developer at your org to go from an issue to a merged PR today? Could they do it without leaving one tool?"*
- *"Are your developers running multi-step Copilot sessions yet, or mostly autocomplete?"*
- *"How do you forecast and govern Copilot spend across teams today?"*

**Objection: "This is going to blow up our bill."**

> "Three things keep that from happening. **One**, your Business or Enterprise seat already includes a baseline of AI Credits — and we're adding 50%+ extra during June–August. **Two**, credits **pool** across your org — heavy users like an SRE running Fleet don't strand capacity from light users. **Three**, you set hard **budget caps** at the enterprise, cost center, and user level. The **preview bill** in early May lets you see projections before the cutover."

### Expansion play

- **Land** Business seats for the dev org, with pooled credits and admin budget controls.
- **Expand** seats to PMs and ops who run Workflows (Compliance, Reporting) — same Copilot, no extra licenses to negotiate.
- **Upsell** to Enterprise for larger included credits, Copilot Spaces (organizational knowledge), advanced governance.
- **Add-on** AI Credits as the customer scales agentic adoption — Fleet mode in particular.

### One-line takeaway you can use Monday

> "I built a working cart page with a coding agent in 30 minutes — including the PR review. That's the workflow your developers will pay for in AI Credits, and it's why pooled credits and admin budgets matter."

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| Agent fails to spin up | Check `copilot --version` works in terminal; restart the GitHub App |
| Built-in browser tab missing | Settings → Experimental Flags → enable *Browser tabs* (covered in Module 1) |
| Fleet mode session fails to start | Known alpha flake. Re-trigger; or fall back to Autopilot (sequential) |
| `make dev` fails | Open built-in terminal: `npm install` then `make dev` again; check Node version (`node -v` should be 18+) |
| Agent Merge button missing | Settings → Experimental Flags → enable *Agent tools* (covered in Module 1) |

---

## Reference

- Internal demo doc (longer version of the same content with video links): `mm-workshop-files/demo-docs/src/content/docs/demos/copilot/copilot-github-app.mdx`
- GitHub App download & release notes: <https://github.com/github/github-app>
