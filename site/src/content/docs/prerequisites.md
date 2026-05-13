---
title: "Prerequisites"
description: "Day-before setup checklist for accounts, tooling, and auth."
---

Complete this **the day before the workshop**. The first 25 minutes of the workshop is a live setup module (Module 1) — if you arrive with a clean install we'll move fast; if not, we'll fix it together.

> **Try first; we'll fix issues live in Module 1.** Don't skip this checklist hoping it'll work on the day. Walk in with at least the install steps attempted so the live module catches edge cases, not first-time installs.
>
> **Estimated setup time:** 30–45 minutes the first time.
>
> **Reading tip:** every command in this guide is labeled **Windows** or **Mac**. Run only the one for your laptop.

---

## 1. Accounts & Entitlements

- [ ] **GitHub account** — your `@github.com`-linked identity (you're a GitHub employee, so this should already be in place).
- [ ] **GitHub Copilot license** — confirm at <https://github.com/settings/copilot>. You should see "Copilot Business" or "Copilot Enterprise" active.
- [ ] **GitHub App alpha access** — **required for the live workshop.** Confirm you can download from <https://github.com/github/github-app>. If the repo 404s, request access in the team Slack channel **before workshop day** (this is a workshop-blocker if denied).
- [ ] **Microsoft 365 account** *(only for take-home Module 5 — Chief of Staff)*. Personal/corporate is fine; you'll authenticate locally.
- [ ] **Codespaces quota** *(only for take-home Module 6 — LLM-Assist)*. Confirm you have hours available at <https://github.com/settings/billing/summary>.

## 2. Local Tooling

You'll install the same five tools on either OS — just from different sources. Pick the section for your laptop.

| Tool | Why you need it | Where to get it |
|---|---|---|
| **VS Code** (latest) | Editor used in Module 2 if you peek under the hood | Windows: `winget` · Mac: Homebrew cask · or <https://code.visualstudio.com/> |
| **GitHub CLI** (`gh`) | Auth + ad-hoc GitHub commands; used by all modules | Windows: `winget` · Mac: Homebrew · or <https://cli.github.com/> |
| **Copilot CLI** (native `copilot`) | Used by Module 1 verification and as a fallback if the GitHub App is unavailable | Install per the [official docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli) (same steps on both OSes). The older `gh copilot` extension is **not enough**. |
| **GitHub App** (alpha) | **Required for the live workshop** (Module 1 + Module 2) | <https://github.com/github/github-app> — Windows `.exe`, Mac `.dmg` |
| **Node.js LTS** | Module 2 installs Marp (a slide-builder) using Node | Windows: `winget` · Mac: Homebrew · or <https://nodejs.org/> |
| **Git** | All modules | Windows: `winget` · Mac: Homebrew · or <https://git-scm.com/downloads> |

### Windows quick-install (PowerShell)

Open **PowerShell** (Start menu → type "PowerShell" → open it) and paste these one at a time:

```powershell
winget install --id Git.Git -e
winget install --id GitHub.cli -e
winget install --id Microsoft.VisualStudioCode -e
winget install --id OpenJS.NodeJS.LTS -e
```

Then install the native Copilot CLI per the [official docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli).

### macOS quick-install (Terminal + Homebrew)

Open **Terminal** (Spotlight → type "Terminal" → open it). If you don't have Homebrew yet, install it from <https://brew.sh/>. Then:

```bash
brew install git gh node
brew install --cask visual-studio-code
```

Then install the native Copilot CLI per the [official docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli).

> **After installing anything: close and reopen your terminal.** The newly installed commands aren't visible to your existing terminal session — only to new ones. This is the single most common cause of "command not found" errors below.

## 3. Auth Verification

> **If a command says `'xyz' is not recognized` (Windows) or `command not found: xyz` (Mac):**
>
> 1. Close the terminal and open a fresh one (PATH refresh).
> 2. Re-run the install step from Section 2 for that tool.
> 3. If still failing, flag it in the Slack channel — we'll sort it out in Module 1.

Run each of these in the terminal you opened above — every command should succeed without a browser prompt.

### Windows (PowerShell)

```powershell
gh auth status                # expect: "Logged in to github.com account <your-username>"
copilot --version             # native Copilot CLI; e.g. "copilot 0.x.x"
code --version                # 3-line version output
node --version                # e.g. "v20.11.1"
git --version                 # e.g. "git version 2.45.0.windows.1"
```

### Mac (Terminal)

```bash
gh auth status                # expect: "Logged in to github.com account <your-username>"
copilot --version             # native Copilot CLI; e.g. "copilot 0.x.x"
code --version                # 3-line version output
node --version                # e.g. "v20.11.1"
git --version                 # e.g. "git version 2.45.0"
```

If `gh auth status` says you're **not** logged in, run this on either OS:

```bash
gh auth login --hostname github.com --git-protocol https --web
```

A browser tab will open — sign in, click Authorize, return to the terminal, and re-run `gh auth status` to confirm.

## 4. VS Code Copilot Setup

You only need this if you want to peek at Module 2's files in VS Code while the GitHub App is running. **Optional** for the live workshop.

1. Install the **GitHub Copilot** and **GitHub Copilot Chat** extensions from the VS Code Marketplace.
2. Sign in via the Accounts icon (bottom-left of VS Code) → "Sign in with GitHub to use Copilot".
3. Open Copilot Chat:
   - **Windows:** `Ctrl+Alt+I`
   - **Mac:** `Cmd+Ctrl+I`
4. Select **Agent** mode. Pick `Claude Sonnet 4.6` or better as the model.
5. Send a test prompt: `summarize this workspace`. You should get a response.

## 5. Module-Specific Extras

- **Module 1 (GitHub App Setup — live)**: After installing the app, enable experimental flags under **Settings → Experimental Flags**: *Browser tabs*, *Research command*, *Agent tools / Fleet mode*. (We'll re-verify this live.)
- **Module 2 (Slide Deck Maker — live)**: No global Marp install required. The module installs Marp locally inside the agent session.
- **Module 3 (Prompt to PR — take-home)**: Requires the same GitHub App alpha access. Setup is identical to Module 1.
- **Module 4 (Vibe-Code a Game — take-home)**: Requires the same GitHub App alpha access plus a modern browser (Chrome/Edge/Safari).
- **Module 5 (Chief of Staff — take-home)**: You'll authenticate to Microsoft 365 live during the module. No tenant-level install required.
- **Module 6 (LLM-Assist — take-home)**: No local setup beyond `gh` — everything runs in a Codespace.
- **Module 7 (Copilot CLI Deep Dive — take-home)**: Optional Docker for some MCP servers.

## 6. Troubleshooting Quick Hits

| Symptom | Fix |
|---|---|
| `'xyz' is not recognized` (Windows) / `command not found: xyz` (Mac) | Close and reopen the terminal so PATH refreshes; re-run the install for that tool |
| `gh auth status` says "not logged in" | `gh auth login --web` |
| Copilot Chat says "no model available" | Sign in again; check <https://github.com/settings/copilot> for an active license |
| GitHub App download 404s | Request alpha access in the team Slack channel |
| `winget` not found (Windows) | Update to Windows 10 21H2+ / Windows 11; or install winget from the Microsoft Store ("App Installer") |
| `brew` not found (Mac) | Install Homebrew from <https://brew.sh/>, then close + reopen Terminal |
| Codespaces won't start | Check quota at <https://github.com/settings/billing/summary>; try a 2-core machine type first |
| M365 auth fails | Use a personal Microsoft account if your tenant blocks consent |

If you're stuck at workshop start time, **flag the facilitator immediately** — Module 1 is a live setup block specifically designed to fix last-mile issues as a group.
