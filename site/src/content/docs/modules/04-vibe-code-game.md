---
title: "Module 4 · Vibe-Code a Game"
description: "Build a working browser game in under an hour with no manual code."
---

> **Time:** 50 min · **Format:** Choose-your-path (live) · **Surface:** GitHub App (default; Copilot CLI or VS Code Agent mode also work)
>
> **Prereq:** [Module 1 · GitHub App Setup](01-github-app-setup.md) complete.
>
> By the end of this module you'll have built a working browser game from scratch, with zero manual code, in under an hour — and you'll have a take-home path to ship it to the world via GitHub Pages.

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

### Step 2 — Set up your project (3 min)

```bash
mkdir my-game && cd my-game
git init
echo "# My Copilot-built game" > README.md
```

In the **GitHub App**, add this folder as a repository (if local) or open a quick repo from the app's repo selector. (Copilot CLI / VS Code work too — use whatever you set up in Module 1.)

### Step 3 — The opening prompt (4 min)

Use this template — adapt the bracketed bits:

```text
Build me a browser-based <Snake> game.

Tech stack:
- Vanilla HTML, CSS, JavaScript only — no frameworks
- Single index.html file or a small structure with index.html + game.js + style.css
- Runs locally just by opening index.html

Gameplay:
- <list 3-5 specific gameplay rules: scoring, controls, win/lose, etc.>

UX:
- Clean, minimal aesthetic — dark mode, sans-serif
- Score visible at top; game-over overlay with restart button
- Mobile-friendly: touch controls if you can; otherwise arrow keys

Make it work end to end. Then run it and tell me what to test.
```

Pick **Claude Sonnet 4.6** or better as the model. **Agent mode**.

### Step 4 — Watch the agent build (8 min)

Don't interrupt. Watch:

- File creation (`index.html`, `game.js`, `style.css`).
- The agent's reasoning about edge cases.
- When it stops and asks vs. when it just decides.

If your surface has a built-in browser (GitHub App), open it. Otherwise, open `index.html` in your local browser:

```bash
# In a new terminal
python3 -m http.server 8000
# Open http://localhost:8000
```

### Step 5 — Test and iterate (18 min)

Play the game. Find at least 5 things wrong or missing. **Don't fix them yourself.** Use prompts:

- *"The snake doesn't die when it runs into the wall. Fix that."*
- *"Add a high-score that persists in localStorage."*
- *"Speed up the game by 10% every 5 points."*
- *"On mobile the controls don't work — add swipe gestures."*
- *"Game over screen is ugly. Center it, add a fade-in animation, make the restart button bigger."*

Each prompt = a session turn. Re-test after each.

### Step 6 — Polish (12 min)

Now go beyond functional. Push the agent on:

- **Sound effects** (Web Audio API).
- **Visual polish**: animations, particle effects on score, screen shake on collision.
- **Difficulty levels**: easy / medium / hard at the start screen.
- **Accessibility**: keyboard-only navigation, high-contrast mode.
- **Easter egg**: have fun with it.

### Step 7 — Read the Seller Playbook (3 min)

Scan the Seller Playbook below before debrief — you'll talk to it.

---

## Stretch Goals (take-home)

- **Ship it to GitHub Pages**: `gh repo create my-game --public --source=. --push`, then enable Pages (Settings → Pages → Source: `main` branch / root). In ~2 min your game is live at `https://<username>.github.io/my-game/`.

- Add a **two-player mode** or **AI opponent** (great for chess, Connect Four, Tic-Tac-Toe).
- Convert to a **PWA** (installable on phone home screen).
- Build a **leaderboard** using a free serverless backend (e.g., GitHub Gists API as a hack, or Cloudflare Workers).
- Pick a totally different game and start over with what you learned.

---

## Seller Playbook (read before debrief)

### What you just experienced (the agentic lens)

- **Heavily agentic.** Each major prompt = multi-file edits, the agent reading its own previous output, running mental simulations of gameplay. The first build alone is 5–15 minutes of model work.
- Token consumption: **medium-to-high.** Less than Module 6's research workloads, more than Module 3's deck workflow.
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

> "Agreed — your product team isn't shipping vibe-coded code to production. The point of this exercise isn't the game. It's that the **same agentic capabilities** that built a working app in under an hour from a non-coder are the capabilities your engineers use to build a Cart Page in 30 minutes [Module 2] or a customer adoption plan in 15 minutes [Module 6 take-home]. The game is the disarming proof. The enterprise value is the workflow underneath."

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
| Game doesn't render | Open browser dev tools (F12); look at the Console; paste any error back to the agent and ask it to fix |
| Agent rewrites too aggressively | Start the prompt with "Make a *targeted* change. Do not refactor unrelated code." |
| Game logic is broken in subtle ways | Switch to a stronger model (Opus 4.6); or break the prompt into smaller, more specific instructions |
| `gh repo create` fails | Check `gh auth status`; try `gh auth refresh -s repo` |
| GitHub Pages shows 404 | Wait 2–3 min after first enable; ensure `index.html` is in repo root, not a subfolder |
| Want to start over | `rm -rf` the folder; you've lost nothing |
