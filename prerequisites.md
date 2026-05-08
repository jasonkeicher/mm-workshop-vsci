# Prerequisites · Day-Before Setup Checklist

Complete this **the day before the workshop**. The first 25 minutes of the workshop is a live setup module (Module 1) — if you arrive with a clean install we'll move fast; if not, we'll fix it together.

> **Try first; we'll fix issues live in Module 1.** Don't skip this checklist hoping it'll work on the day. Walk in with at least the install steps attempted so the live module catches edge cases, not first-time installs.
>
> **Estimated setup time:** 30–45 minutes the first time.

---

## 1. Accounts & Entitlements

- [ ] **GitHub account** — your `@github.com`-linked identity (you're a GitHub employee, so this should already be in place).
- [ ] **GitHub Copilot license** — confirm at <https://github.com/settings/copilot>. You should see "Copilot Business" or "Copilot Enterprise" active.
- [ ] **GitHub App alpha access** — **required for the live workshop.** Confirm you can download from <https://github.com/github/github-app>. If the repo 404s, request access in the team Slack channel **before workshop day** (this is a workshop-blocker if denied).
- [ ] **Microsoft 365 account** *(only for take-home Module 5 — Chief of Staff)*. Personal/corporate is fine; you'll authenticate locally.
- [ ] **Codespaces quota** *(only for take-home Module 6 — LLM-Assist)*. Confirm you have hours available at <https://github.com/settings/billing/summary>.

## 2. Local Tooling

| Tool | Why | Install |
|---|---|---|
| **VS Code** (latest) | All Stage-2 modules + take-home M7 | <https://code.visualstudio.com/> |
| **GitHub CLI** (`gh`) | All modules | <https://cli.github.com/> |
| **Copilot CLI** | All modules (Stage 2 + take-home) | `gh extension install github/gh-copilot` *or* native install per [docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli) |
| **GitHub App** (alpha) | **Required for live workshop** (Module 1 + Stage-2 paths) | <https://github.com/github/github-app> |
| **Node.js LTS** | Modules 2, 3, 4 (running demo apps + Marp) | <https://nodejs.org/> |
| **Git** | All modules | <https://git-scm.com/downloads> |

### Windows quick-install (PowerShell)

```powershell
winget install --id Git.Git -e
winget install --id GitHub.cli -e
winget install --id Microsoft.VisualStudioCode -e
winget install --id OpenJS.NodeJS.LTS -e
```

### macOS quick-install (Homebrew)

```bash
brew install git gh node
brew install --cask visual-studio-code
```

## 3. Auth Verification

Run each of these — every command should succeed without a browser prompt:

```bash
gh auth status
gh copilot --version          # if using the gh-copilot extension
code --version
node --version
git --version
```

If `gh auth status` is missing, run:

```bash
gh auth login --hostname github.com --git-protocol https --web -s admin:org
```

## 4. VS Code Copilot Setup

1. Install the **GitHub Copilot** and **GitHub Copilot Chat** extensions from the VS Code Marketplace.
2. Sign in via the Accounts icon (bottom-left) → "Sign in with GitHub to use Copilot".
3. Open Copilot Chat (`Ctrl+Alt+I` Win/Linux, `Ctrl+Cmd+I` Mac). Select **Agent** mode. Pick `Claude Sonnet 4.6` or better as the model.
4. Send a test prompt: `summarize this workspace`. You should get a response.

## 5. Module-Specific Extras

- **Module 1 (GitHub App Setup — required, live)**: After installing the app, enable experimental flags under **Settings → Experimental Flags**: *Browser tabs*, *Research command*, *Agent tools / Fleet mode*. (We'll re-verify this live.)
- **Module 2 (Prompt to PR)**: No extras beyond Module 1.
- **Module 3 (Slide Deck Maker)**: Marp CLI — `npm install -g @marp-team/marp-cli` (the module also covers this in Step 2).
- **Module 4 (Vibe-Code a Game)**: A modern browser (Chrome/Edge/Safari) for testing.
- **Module 5 (Chief of Staff — take-home)**: You'll authenticate to Microsoft 365 live during the module. No tenant-level install required.
- **Module 6 (LLM-Assist — take-home)**: No local setup beyond `gh` — everything runs in a Codespace.
- **Module 7 (Copilot CLI Deep Dive — take-home)**: Optional Docker for some MCP servers.

## 6. Troubleshooting Quick Hits

| Symptom | Fix |
|---|---|
| `gh auth status` says "not logged in" | `gh auth login --web -s admin:org` |
| Copilot Chat says "no model available" | Sign in again; check <https://github.com/settings/copilot> for an active license |
| GitHub App download 404s | Request alpha access in the team Slack channel |
| Codespaces won't start | Check quota at <https://github.com/settings/billing/summary>; try a 2-core machine type first |
| M365 auth fails | Use a personal Microsoft account if your tenant blocks consent |

If you're stuck at workshop start time, **flag the facilitator immediately** — Module 1 is a live setup block specifically designed to fix last-mile issues as a group.
