---
title: "Module 4 · Vibe-Code a Game"
description: "Take-home self-study: build a working browser game in under an hour with no manual code."
---

> **📚 Take-home self-study module.** Not run live under the current workshop format — the live session focuses on Module 1 (setup) and Module 2 (slide decks). This module is fully runnable on your own time; the commercial story still maps to the [Seller Playbook Overview](../../seller-playbook-overview/).
>
> **Time:** ~50 min · **Format:** Solo · **Surface:** GitHub App (alpha)
>
> **Prereq:** [Module 1 · GitHub App Setup](../01-github-app-setup/) complete. Everything in this module happens inside a single Copilot session in the GitHub App — the agent writes the code, runs the dev server in the session's built-in terminal, and you play the game in the session's built-in browser. (Yes — you need the same GitHub App alpha access you set up live in Module 1.)
>
> **No-App fallback:** If GitHub App alpha access is unavailable, use the **No-App CLI fallback** near the end of this module.
>
> By the end of this module you'll have built a working browser game from scratch, with zero manual code, in under an hour — and you'll have a path to ship it to the world via GitHub Pages.

---

## Purpose & Goal

Lower the **fear factor**. Many sellers worry they "can't demo Copilot because they're not developers." After this module, you can:

- Tell the "I built this in an hour with no code" story to skeptical customer execs.
- Demonstrate breadth of the model — Copilot isn't just autocomplete, it builds whole apps.
- Position **agentic vibe-coding** as a high-credit workload that delivers extreme value per hour.

---

## Guided Steps (50 min)

### Step 1 — Pick your game (2 min)

Choose **one**. **If you don't have a strong preference, default to Snake or Breakout** — they're the most reliably finishable in the time budget.

| Game | Difficulty | Why it's good |
|---|---|---|
| **Snake** *(recommended default)* | ★ | Classic, single-screen, low scope |
| **Breakout / Pong** *(recommended default)* | ★ | Physics is small, very visual |
| **Wordle clone** | ★★ | Logic + word list, no animation |
| **Tic-Tac-Toe vs. AI** | ★★ | Showcases agent picking minimax |
| **2048** | ★★★ | More complex state; impressive |
| **Asteroids** | ★★★ | Physics + animation, harder to finish in 50 min |

Pick something **you actually want to play**. Motivation matters.

### Step 2 — Add a working repo and start a session (3 min)

In the GitHub App, click the **+ Add repository** control (near the repo selector at the top). You have two easy options:

- **Easiest:** create a brand-new empty repo named `my-game` on github.com (use the **New repository** button in the github.com UI — takes 30 seconds), then add it from the App.
- **Or:** point at any small empty repo of your own.

Open the repo in the App and start a fresh Copilot session. For the model, pick any **Claude Sonnet** — the default is fine. For mode, choose **Agent** (multi-step).

### Step 3 — The opening prompt (4 min)

In your Copilot session, paste this prompt — adapt the bracketed bits:

```text
Build me a browser-based <Snake> game.

Tech stack:
- Vanilla HTML, CSS, JavaScript only — no frameworks
- Single index.html file or a small structure with index.html + game.js + style.css
- Designed to be served by a local static server (we'll use http-server below)

Gameplay:
- <list 3-5 specific gameplay rules: scoring, controls, win/lose, etc.>

UX:
- Clean, minimal aesthetic — dark mode, sans-serif
- Score visible at top; game-over overlay with restart button
- Mobile-friendly: touch controls if you can; otherwise arrow keys

Make it work end to end. Then, in the session terminal, serve it on
http://localhost:8000 with: npx http-server -p 8000 .
Keep the server running in the background and tell me what to test.
```

> **First-run note:** `npx http-server` downloads the package the first time — expect ~10 seconds of silence before it's ready. Wait for the agent to confirm the server is running before opening the browser tab.

### Step 4 — Watch the agent build, then play it in the App (8 min)

Don't interrupt. Watch:

- File creation (`index.html`, `game.js`, `style.css`) in the **Changes** panel on the right side of the session.
- The agent's reasoning about edge cases.
- When it stops and asks vs. when it just decides.

Once the agent reports the dev server is running, open the **built-in browser** tab (experimental flag from Module 1) and navigate to `http://localhost:8000`. Play the game.

> If the built-in browser tab is missing, enable it via Settings → Experimental Flags → *Browser tabs* (covered in Module 1).

### Step 5 — Test and iterate (18 min)

Play the game in the built-in browser. Find at least 5 things wrong or missing. **Don't fix them yourself.** Use prompts in the same session:

- *"The snake doesn't die when it runs into the wall. Fix that."*
- *"Add a high-score that persists in localStorage."*
- *"Speed up the game by 10% every 5 points."*
- *"On mobile the controls don't work — add swipe gestures."*
- *"Game over screen is ugly. Center it, add a fade-in animation, make the restart button bigger."*

Each prompt = a session turn. The dev server keeps running — just refresh the built-in browser tab after each fix.

### Step 6 — Polish (12 min)

Now go beyond functional. **Don't fix anything by hand** — keep prompting in the same session, and refresh the built-in browser after each change. **Cap yourself at 3–4 polish prompts** so you finish on time; you can keep iterating after the workshop.

Push the agent on:

- **Sound effects** (Web Audio API).
- **Visual polish**: animations, particle effects on score, screen shake on collision.
- **Difficulty levels**: easy / medium / hard at the start screen.
- **Accessibility**: keyboard-only navigation, high-contrast mode.
- **Easter egg**: have fun with it.

### Step 7 — Read the Seller Playbook (3 min)

Scan the Seller Playbook below — these are the punchlines you'll use in customer conversations.

---

## No-App CLI fallback

Use this path if GitHub App alpha access is unavailable.

1. Create a scratch repo locally:

   ```bash
   mkdir my-game
   cd my-game
   git init
   copilot --yolo
   ```

2. Paste the Step 3 opening prompt into the Copilot CLI session. The agent should create the game files and serve them with `npx http-server -p 8000 .`.
3. For Step 4, open `http://localhost:8000` in your regular browser instead of the GitHub App built-in browser.
4. Continue Steps 5 and 6 in the same CLI session. Keep prompts targeted and let the agent edit the files; don't patch the game by hand.

## Stretch Goals (take-home)

- **Ship it to GitHub Pages**: ask the agent to commit the game and open a PR; merge it on github.com; then enable Pages (Settings → Pages → Source: `main` branch / root). In ~2 min your game is live at `https://<username>.github.io/my-game/`.
- Add a **two-player mode** or **AI opponent** (great for chess, Connect Four, Tic-Tac-Toe).
- Convert to a **PWA** (installable on phone home screen).
- Build a **leaderboard** using a free serverless backend (e.g., GitHub Gists API as a hack, or Cloudflare Workers).
- Try the same prompt in the **Copilot CLI** (`copilot --yolo` in a local folder) and compare the experience to running it in the GitHub App.
- Pick a totally different game and start over with what you learned.

---

## Seller Playbook

### What you just experienced (the agentic lens)

- **Heavily agentic.** Each major prompt = multi-file edits, the agent reading its own previous output, running mental simulations of gameplay. The first build alone is 5–15 minutes of model work.
- Token consumption: **medium-to-high.** Less than Module 6's research workloads, more than Module 2's deck workflow.
- The narrative power isn't the cost — it's the **wow factor**. A non-engineer building a working game in an hour is the most disarming demo in the GitHub kit.

### Premium Requests today

- Building a small game probably consumed 30–60 PRUs on a base model, or 60–150 on Claude Opus.
- An annual Pro user could exhaust their PRU bucket in one game-building session — exactly the kind of friction usage-based billing solves.

### AI Credits after June 1

- Same game build → token-based. **Cached tokens help significantly**: as the agent re-reads the same files turn after turn, those reads come from cache at lower rates.
- This is the **prosumer wedge**: an individual seller, marketing person, or analyst can do this on **Copilot Pro+ ($39/mo with $39 in AI Credits)** and have a productive month. Then they bring the experience to their org and become the internal champion for Business or Enterprise.

### Customer talk track

**Discovery:**

- *"Have you seen what your non-engineering teams could build with Copilot if they wanted to?"*
- *"Who at your company has the loudest objection to AI tooling? What would change their mind?"*
- *"Are you giving Copilot to anyone outside engineering yet?"*

**Objection: "Vibe-coding is cute but not enterprise-grade."**

> "Agreed — your product team isn't shipping vibe-coded code to production. The point of this exercise isn't the game. It's that the **same agentic capabilities** that built a working app in under an hour from a non-coder are the capabilities your engineers use to build a Cart Page in 30 minutes [Module 3] or a customer adoption plan in 15 minutes [Module 6 take-home]. The game is the disarming proof. The enterprise value is the workflow underneath."

### Expansion play

- **Land** as Copilot Pro+ for an internal champion who builds something visible.
- **Wedge** the org with Copilot Business when leadership sees the demo.
- **Expand** beyond engineering — every department has a "build this small thing" backlog.
- **Upsell** to Enterprise as agentic adoption scales and governance becomes a need.

### One-line takeaway you can use Monday

> "I'm not a developer, and I built a working browser game in an hour with Copilot. That same capability — the agent that built my game — is what your engineers use to ship features. The game is the proof. The economics live in AI Credits."

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| Can't add a new repo from the App | Confirm GitHub App alpha access (covered in Module 1); try refreshing the repo picker |
| Built-in browser tab missing | Settings → Experimental Flags → enable *Browser tabs* (covered in Module 1) |
| `npx http-server` fails in session terminal | Check Node version (`node -v` should be 18+); ask the agent to retry, or fall back to `python3 -m http.server 8000` |
| Game doesn't render | Open the built-in browser's dev tools (right-click → Inspect); paste any console error back to the agent and ask it to fix |
| Agent rewrites too aggressively | Start the prompt with "Make a *targeted* change. Do not refactor unrelated code." |
| Game logic is broken in subtle ways | Switch to a stronger model (Opus 4.6); or break the prompt into smaller, more specific instructions |
| GitHub Pages shows 404 (stretch) | Wait 2–3 min after first enable; ensure `index.html` is in repo root, not a subfolder |
| Want to start over | Discard the session — it lives in its own private copy of the repo, so your main checkout is untouched |
