---
title: "Module 1 · GitHub App: Setup & First Look"
description: "Required live setup module: install the GitHub App, sign in, enable experimental flags, run a smoke-test prompt."
---

> **Time:** 25 min · **Format:** Live setup (everyone) · **Surface:** GitHub App (alpha) on your laptop
>
> By the end of this module, **everyone** in the room has the GitHub App installed, signed in, configured, and smoke-tested — ready to dive into Module 2 (Slide Deck Maker) for the next 60 minutes.

---

## Purpose & Goal

Get every attendee to the same baseline: a working GitHub App they can drive immediately. After this module, you can:

- Open the GitHub App, navigate its surfaces, and start a Copilot session in any repo.
- Speak to the agentic SDLC at a high level — even before doing your hands-on path.
- Help a peer in the room get unstuck if their setup lags.

---

## Prereq Verification (3 min)

Open a terminal and run each of these. You're looking for output that looks like the success examples below — not an error or "command not found."

- **Windows:** open **PowerShell** (Start menu → type "PowerShell" → open it).
- **Mac:** open **Terminal** (Spotlight → type "Terminal" → open it).

- [ ] You completed [prerequisites.md](../../prerequisites/) the day before.
- [ ] `copilot --version` → prints a version number (e.g. `copilot 0.x.x`).
- [ ] `gh auth status` → includes a line like `Logged in to github.com account <your-username>`.

If any command says **`'xyz' is not recognized`** (Windows) or **`command not found: xyz`** (Mac), close and reopen the terminal first — that fixes most cases. If it still fails, **flag the facilitator now**. We'll fix it live — that's the point of doing setup as a group.

---

## Guided Steps (22 min)

### Step 1 — Install and launch the GitHub App (5 min)

> **Note:** "GitHub App" here means the new **desktop GitHub App (alpha)** — a standalone Copilot client. This is *not* the same thing as the org-installable "GitHub Apps" you may have seen on github.com.

If you haven't already:

1. Download from <https://github.com/github/github-app>. (If you 404, ask in the team Slack — alpha access required.)
   - **Windows:** the download is an `.exe` installer — double-click and follow the prompts.
   - **Mac:** the download is a `.dmg` — open it, then drag the **GitHub** app into **Applications**.
2. Launch the app from the Start menu (Windows) or Applications / Spotlight (Mac).
3. Sign in with your GitHub identity. A browser tab will open asking you to sign in to GitHub and authorize the app — click **Authorize** on each prompt.
4. Bump zoom for readability during the session:
   - **Windows:** `Ctrl` + `+`
   - **Mac:** `Cmd` + `+`

You should land on the **Home** screen with an empty repo list.

### Step 2 — Enable Experimental Flags (3 min)

Go to **Settings → Experimental Flags** and toggle on:

- **Browser tabs** — lets the agent open a built-in web browser inside its session. **You'll use this in Module 2 to preview your slide deck.**
- **Research command** — enables `/research` plan mode. Not used in today's live session; safe to leave on for take-home modules.
- **Agent tools / Fleet mode** — enables parallel agents and Agent Merge. Not used in today's live session; safe to leave on for take-home Module 3.

Restart the app if prompted.

### Step 3 — Tour the surfaces (8 min)

Click through each top-level surface so you know where things live. **Don't go deep — just orient.**

> Exact UI labels may shift in alpha — orient by purpose, not exact wording.

- **Home dashboard** → your repos, available skills/extensions, and items waiting on you (PRs, issues).
- **Pull Requests** → all open PRs across your repos, like github.com. You can start a Copilot session *from* any PR.
- **Issues** → start a session directly from an issue (e.g., "Improve test coverage for API") — the issue body becomes the agent's brief.
- **Chat** (top-level, not repo-scoped) → general-purpose: research, web search, email triage. Not just code.
- **Workflows** → scheduled or on-demand automated agent runs. (Stretch goal for take-home Module 3; everyone can come back later.)

### Step 4 — Add a repo and run a smoke-test prompt (5 min)

In the GitHub App, find the **+ Add repository** control (near the repo selector at the top) and add any small public repo you have access to — `octocat/hello-world` works if you don't have one in mind.

Start a new Copilot session in the repo and run this prompt:

```text
Summarize this repo. What does it do? What are the top 3 files I should read first?
```

For the model, pick any **Claude Sonnet** option from the model picker — the default is fine. (We're just smoke-testing that Copilot responds.)

You should get a structured response naming files in the repo within 30–60 seconds. **If you get a model error, raise your hand — we'll fix it live.**

### Step 5 — Optional curiosity peek (1 min)

Your Copilot session ran in a sandboxed folder on your laptop. If you're curious where, right-click the session in the sidebar → **Reveal in Finder** (Mac) / **Show in Explorer** (Windows). It lives under a `.copilot/` directory.

- **Windows path looks like:** `%USERPROFILE%\.copilot\sessions\<session-id>\...`
- **Mac path looks like:** `~/.copilot/sessions/<session-id>/...`

*Why we mention this:* every session gets its own isolated folder, so multiple agents can work on the same repo at once without stepping on each other. **You'll see this matter in Module 2** when the agent creates `notes.md`, installs Marp, and writes `deck.html` — all inside this session's private folder, not your real working directory.

---

## What's Next (next 60 min)

You're set up. The rest of the live session is **[Module 2 · Slide Deck Maker](../02-slide-deck-maker/)** — generate a customer-ready deck end-to-end with Copilot. You'll pick one of four deck types when you get there:

- **Customer Q&A** — answer a real prospect question.
- **GitHub Docs summary** — turn a GitHub docs page into slides.
- **EBC deep-dive** — build an exec briefing on a GitHub topic.
- **Pricing transition** — procurement-ready deck on the June 1 AI Credits cutover.

The other modules (2, 4, 5, 6, 7) are **take-home self-study** — same depth, same playbook framing, run on your own time. Modules 2 and 4 require the same GitHub App alpha access you just set up.

---

## Mini Seller Playbook (1-min framing)

Setup is cheap — a few small chat turns, low token consumption, no AI Credits drama. **But it's the gateway**: every agentic workflow you're about to demo lives behind this one app. When you talk to a customer, the install / sign-in / first-prompt experience you just had is the developer's first 5 minutes too. *That* is what they're buying.

The interesting commercial story starts in Module 2 — agentic vs. chat, AI Credits, pooled budgets, Premium Requests legacy. Hold that thought for the next 60 minutes.

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| GitHub App download 404s | Request alpha access in the team Slack channel |
| Sign-in loop | Sign out of github.com in your browser, retry; check 2FA prompt |
| "No model available" on smoke test | Sign in again; verify license at <https://github.com/settings/copilot> |
| Built-in browser tab missing | Settings → Experimental Flags → enable *Browser tabs* |
| `copilot --version` fails | Reinstall per [Copilot CLI docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli) |
