---
title: "Module 2 · Prompt to PR"
description: "Take-home self-study: drive a coding agent from prompt to merged PR end-to-end with Copilot Code Review and Agent Merge."
---

> **📚 Take-home self-study module.** Not run live under the current workshop format — the live session focuses on Module 1 (setup) and Module 3 (slide decks). This module is fully runnable on your own time; the commercial story still maps to the [Seller Playbook Overview](../../seller-playbook-overview/).
>
> **Time:** ~50 min · **Format:** Solo · **Surface:** GitHub App (alpha)
>
> **Prereq:** [Module 1 · GitHub App Setup](../01-github-app-setup/) complete. The app is installed, signed in, and you've run a smoke-test prompt. (Yes — you need the same GitHub App alpha access you set up live in Module 1.)
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

In the GitHub App, find the **+ Add repository** control (near the repo selector at the top). Search for the full repo path for `demo_octocat_supply` (for example, `<owner>/demo_octocat_supply`) and add it. Do not rely on the bare repo name if search results are noisy.

> **Heads-up:** the demo repo requires the same alpha access as the GitHub App itself, plus repo access. If the full path doesn't show up, ask in the team Slack channel for the confirmed `owner/repo` path — see Troubleshooting for the fallback.

**Immediately** start a new Copilot session in the repo with this prompt (don't tour while it runs — let the agent work):

```text
I want to add a Cart Page to the frontend application. The page should:
- Display all items currently in the cart with their quantities and prices
- Allow updating quantities and removing items
- Show a subtotal, shipping fee ($25, free for orders over $150), and total
- Add a cart icon to the NavBar that shows the number of items and navigates to the cart page when clicked

Use the existing product and cart patterns in the codebase.
```

For the model, pick any **Claude Sonnet** option from the model picker — the default is fine. For mode, choose **Agent** (the multi-step option) since this is a multi-file build.

### Step 2 — Worktree callout (2 min)

While the agent works, right-click the session in the sidebar → **"Reveal in Finder"** (Mac) / **"Show in Explorer"** (Win). The session lives in its own folder under `.copilot/`.

> **What's a worktree?** It's just a copy of the repo in its own folder. The agent works there in isolation so it can't break anything in your main checkout — and so multiple agents can work on the same repo at once without colliding.

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
npm run dev
```

> **Mac/Linux note:** the repo's README may list `make dev` as an alternative — either works. **Windows users**, stick with `npm run dev` (most stock Windows machines don't have `make` installed).

Open the **built-in browser** tab (experimental flag from Module 1) → navigate to `http://localhost:3000`. Test:

- Cart icon in the NavBar shows item count.
- Click cart → items list, quantity changes, remove button.
- Subtotal recalculates. Shipping is $25 under $150, free over.

If something doesn't work, prompt the agent: *"The cart icon doesn't update when I add items. Investigate and fix."*

**Time-box this step.** If the app won't start after one fix attempt, skip ahead to Step 5 — you'll still see the PR / Code Review / Agent Merge flow even without running the app live.

### Step 5 — Create and review the PR (12 min)

Ask the agent: *"Looks good. Create a pull request."*

When the PR opens:

- Read the **PR description** — it's not "Added files," it's a meaningful summary.
- Watch the automated **CI/CD checks** kick off (CI = the test/build pipeline that runs on every PR).
- **Copilot Code Review** may post inline comments on the diff. If it does, read up to 3. If it posts no comments, read the summary/check results and continue.
- If comments exist, click **"Fix unresolved comments"** (or whatever the equivalent button is labeled) so the agent addresses the feedback. If the button is missing, ask the agent: *"Address the unresolved Copilot Code Review feedback on this PR."*

> UI labels may shift in alpha — if you can't find an exact button, look for one near the comments that says something like "Fix" or "Address."

### Step 6 — Try Agent Merge (5 min)

On the PR page, look for an **"Agent Merge"** button (label may vary in alpha). Read its description: the agent now continuously scans for CI failures, Copilot Code Review comments, CodeQL findings (CodeQL = GitHub's security scanner), and human review feedback — driving the PR toward merge-readiness.

> Important: it will **not** auto-merge. It waits for a human approval. The point isn't to remove the human — it's to make their review valuable instead of rubber-stamping formatting fixes.

### Step 7 — Seller Playbook reading & reflection (13 min)

1. **Read** the Seller Playbook below (~8 min). Focus on the agentic-vs-chat framing and the objection handler.
2. **Pick one customer** (~5 min) you've talked to in the last 30 days who would care about this workflow. Jot down which talk-track question you'd open with — then bring it to your next team huddle or share in the Slack channel.

---

## Stretch Goals (take-home)

- **Fleet Mode for Order Tracking** — in the same repo open a new session in **Plan** mode (a non-executing mode where the agent proposes work first, then you approve it for parallel execution). Prompt for a multi-component order tracking page, then click **"Approve and implement with Fleet"** → multiple agents spin up in parallel, each in its own worktree, each producing its own PR. **This is where AI Credit consumption gets serious — and so does the customer value.**
- Run the **Compliance Workflow** demo (Workflows tab) — schedule a recurring compliance check that combines a Copilot Space with the repo. Generates a structured Issue report.
- Try a different model (Claude Opus 4.6) for one session and observe the difference in token consumption.
- Open one of your own real repos and ask the agent to build something small.

---

## Seller Playbook

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
| `demo_octocat_supply` not findable | Confirm the full `owner/repo` path and repo access in the team Slack channel. **Fallback:** any small public repo of your own — prompt for a small feature instead of the Cart Page. |
| Built-in browser tab missing | Settings → Experimental Flags → enable *Browser tabs* (covered in Module 1) |
| Fleet mode session fails to start | Known alpha flake. Re-trigger; or fall back to single-agent mode (sequential execution, one agent at a time). |
| `npm run dev` (or `make dev`) fails | Open built-in terminal: `npm install` then `npm run dev` again; check Node version (`node -v` should be 18+) |
| Agent Merge button missing | Settings → Experimental Flags → enable *Agent tools* (covered in Module 1) |

---

## Reference

- GitHub App download & release notes: <https://github.com/github/github-app>
- Internal facilitator-only demo doc (longer version with video links, GitHub-only): `mm-workshop-files/demo-docs/src/content/docs/demos/copilot/copilot-github-app.mdx`
