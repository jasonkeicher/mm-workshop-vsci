---
title: "Module 1 · GitHub App: Setup & First Look"
description: "Required live setup module: install the GitHub App, sign in, enable experimental flags, run a smoke-test prompt."
---

> **Time:** 25 min · **Format:** Required, live · **Surface:** GitHub App (alpha) on your laptop
>
> By the end of this module, **everyone** in the room has the GitHub App installed, signed in, configured, and smoke-tested — ready to pick a choose-your-path module for the next 50 minutes.

---

## Purpose & Goal

Get every attendee to the same baseline: a working GitHub App they can drive immediately. After this module, you can:

- Open the GitHub App, navigate its surfaces, and start a Copilot session in any repo.
- Speak to the agentic SDLC at a high level — even before doing your hands-on path.
- Help a peer in the room get unstuck if their setup lags.

---

## Prereq Verification (3 min)

- [ ] You completed [prerequisites.md](../../prerequisites/) the day before.
- [ ] `copilot --version` works in a terminal.
- [ ] `gh auth status` is green.

If any of these fail, **flag the facilitator now**. We'll fix it live — that's the point of doing setup as a group.

---

## Guided Steps (22 min)

### Step 1 — Install and launch the GitHub App (5 min)

If you haven't already:

1. Download from <https://github.com/github/github-app>. (If you 404, ask in the team Slack — alpha access required.)
2. Install per platform instructions; launch the app.
3. Sign in with your GitHub identity. Authorize the OAuth prompts in the browser.
4. Bump zoom to 110–125% (`Ctrl/Cmd +`) for readability during the session.

You should land on the **Home** screen with an empty repo list.

### Step 2 — Enable Experimental Flags (3 min)

Go to **Settings → Experimental Flags** and toggle on:

- **Browser tabs** — built-in browser inside agent sessions.
- **Research command** — `/research` plan mode.
- **Agent tools / Fleet mode** — parallel agents and Agent Merge.

Restart the app if prompted.

### Step 3 — Tour the surfaces (8 min)

Click through each top-level surface so you know where things live. **Don't go deep — just orient.**

- **Home** → Skills & Extensions panel (repo skills, MCP servers, custom agents). The "Needs Your Attention" section surfaces PRs and issues awaiting you.
- **Pull Requests tab** → all open PRs across your repos, identical to github.com. You can start a session *from* any PR.
- **Issues tab** → start a session directly from an issue (e.g., "Improve test coverage for API"). The issue body becomes the agent's brief.
- **Chat** (top-level, not repo-scoped) → general-purpose: research, web search, email triage. Not just code.
- **Workflows tab** → scheduled / on-demand automated agent runs. (Module 2 attendees revisit this; everyone can come back later.)

### Step 4 — Add a repo and run a smoke-test prompt (5 min)

In the GitHub App, click the split button next to the repo selector → **"Add GitHub repository"**. Add any small public repo you have access to — `octocat/hello-world` works if you don't have one in mind.

Start a new Copilot session in the repo and run:

```text
Summarize this repo. What does it do? What are the top 3 files I should read first?
```

Pick **Claude Sonnet 4.6** (or better) as the model. **Chat mode** (not Interactive) — this is a single-turn smoke test.

You should get a structured response naming files in the repo within 30–60 seconds. **If you get a model error, raise your hand — we'll fix it live.**

### Step 5 — Quick worktree peek (1 min)

If your smoke-test session created any files (it usually doesn't for a summary), right-click the session in the sidebar → **"Reveal in Finder"** (Mac) / **"Show in Explorer"** (Win). Sessions live in their own folder under `.copilot/`. **This is why parallel agents don't conflict** — you'll lean on this if you pick Module 2.

---

## Pick Your Path (next 50 min)

You're set up. Pick **one** of these for the rest of the live session:

- **[Module 2 · Prompt to PR](../02-prompt-to-pr/)** — drive an agent from a single prompt through implementation, browser test, PR, code review, and Agent Merge. Best for "see the full agentic SDLC."
- **[Module 3 · Slide Deck Maker](../03-slide-deck-maker/)** — generate a customer-ready deck from a real prospect question. Best for "I build customer decks often."
- **[Module 4 · Vibe-Code a Game](../04-vibe-code-game/)** — build a working browser game end-to-end, no manual code. Best for the "I built this in an hour" story.

If you pre-selected via the workshop form, head straight to that module. Otherwise, scan the three and pick now.

---

## Mini Seller Playbook (1-min framing)

Setup is cheap — a few small chat turns, low token consumption, no AI Credits drama. **But it's the gateway**: every agentic workflow you're about to demo lives behind this one app. When you talk to a customer, the install / sign-in / first-prompt experience you just had is the developer's first 5 minutes too. *That* is what they're buying.

The interesting commercial story starts in your chosen module — agentic vs. chat, AI Credits, pooled budgets, Premium Requests legacy. Hold that thought for the next 50 minutes.

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| GitHub App download 404s | Request alpha access in the team Slack channel |
| Sign-in loop | Sign out of github.com in your browser, retry; check 2FA prompt |
| "No model available" on smoke test | Sign in again; verify license at <https://github.com/settings/copilot> |
| Built-in browser tab missing | Settings → Experimental Flags → enable *Browser tabs* |
| `copilot --version` fails | Reinstall per [Copilot CLI docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli) |
