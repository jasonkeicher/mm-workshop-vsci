# Module 1 · GitHub App: Setup & First Look

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

Open a terminal and run each of these. You're looking for output that looks like the success examples below — not an error or "command not found."

- [ ] You completed [prerequisites.md](../prerequisites.md) the day before.
- [ ] `copilot --version` → prints a version number (e.g. `copilot 0.x.x`).
- [ ] `gh auth status` → includes a line like `Logged in to github.com account <your-username>`.

If any of these fail, **flag the facilitator now**. We'll fix it live — that's the point of doing setup as a group.

---

## Guided Steps (22 min)

### Step 1 — Install and launch the GitHub App (5 min)

> **Note:** "GitHub App" here means the new **desktop GitHub App (alpha)** — a standalone Copilot client. This is *not* the same thing as the org-installable "GitHub Apps" you may have seen on github.com.

If you haven't already:

1. Download from <https://github.com/github/github-app>. (If you 404, ask in the team Slack — alpha access required.)
2. Install per platform instructions; launch the app.
3. Sign in with your GitHub identity. A browser tab will open asking you to sign in to GitHub and authorize the app — click **Authorize** on each prompt.
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

> Exact UI labels may shift in alpha — orient by purpose, not exact wording.

- **Home dashboard** → your repos, available skills/extensions, and items waiting on you (PRs, issues).
- **Pull Requests** → all open PRs across your repos, like github.com. You can start a Copilot session *from* any PR.
- **Issues** → start a session directly from an issue (e.g., "Improve test coverage for API") — the issue body becomes the agent's brief.
- **Chat** (top-level, not repo-scoped) → general-purpose: research, web search, email triage. Not just code.
- **Workflows** → scheduled or on-demand automated agent runs. (Stretch goal in Module 2; everyone can come back later.)

### Step 4 — Add a repo and run a smoke-test prompt (5 min)

In the GitHub App, find the **+ Add repository** control (near the repo selector at the top) and add any small public repo you have access to — `octocat/hello-world` works if you don't have one in mind.

Start a new Copilot session in the repo and run this prompt:

```text
Summarize this repo. What does it do? What are the top 3 files I should read first?
```

For the model, pick any **Claude Sonnet** option from the model picker — the default is fine. (We're just smoke-testing that Copilot responds.)

You should get a structured response naming files in the repo within 30–60 seconds. **If you get a model error, raise your hand — we'll fix it live.**

### Step 5 — Optional curiosity peek (1 min)

Your Copilot session ran in a sandboxed folder on your laptop. If you're curious where, right-click the session in the sidebar → **"Reveal in Finder"** (Mac) / **"Show in Explorer"** (Win). It lives under a `.copilot/` directory.

*Why we mention this:* every session gets its own isolated folder, so multiple agents can work on the same repo at once without stepping on each other. **Module 2 attendees will see this in action.** Everyone else: you can skip this step.

---

## Pick Your Path (next 50 min)

You're set up. Pick **one** of these for the rest of the live session:

- **[Module 2 · Prompt to PR](02-prompt-to-pr.md)** — drive an agent from a single prompt through implementation, browser test, PR, code review, and Agent Merge. Best for "see the full agentic SDLC."
- **[Module 3 · Slide Deck Maker](03-slide-deck-maker.md)** — generate a customer-ready deck from a real prospect question. Best for "I build customer decks often."
- **[Module 4 · Vibe-Code a Game](04-vibe-code-game.md)** — build a working browser game end-to-end, no manual code. Best for the "I built this in an hour" story.

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
