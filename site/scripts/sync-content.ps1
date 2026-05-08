# Sync source markdown -> Starlight content collection.
# Reads/writes everything as UTF-8 (no BOM) via .NET to avoid PowerShell
# encoding pitfalls (Windows PowerShell 5.1 defaults Get-Content to ANSI,
# which double-encodes em-dashes and curly quotes into mojibake).
# Re-run anytime the source markdown changes.

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$srcRoot = Split-Path -Parent $root
$docs = Join-Path $root 'src\content\docs'

New-Item -ItemType Directory -Force -Path (Join-Path $docs 'modules') | Out-Null

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Map: source path => [destination path, title, description]
$files = @(
  @{ src = 'README.md'; dest = 'index.md'; title = 'Mid-Market Seller Copilot Workshop'; desc = 'A 90-minute hands-on workshop: required GitHub App setup + one of three choose-your-path modules, tied to the June 2026 usage-based billing transition.' },
  @{ src = 'prerequisites.md'; dest = 'prerequisites.md'; title = 'Prerequisites'; desc = 'Day-before setup checklist for accounts, tooling, and auth.' },
  @{ src = 'seller-playbook-overview.md'; dest = 'seller-playbook-overview.md'; title = 'Seller Playbook Overview'; desc = 'Commercial narrative: agentic usage, Premium Requests, GitHub AI Credits, and the June 1 2026 transition.' },
  @{ src = 'facilitator-guide.md'; dest = 'facilitator-guide.md'; title = 'Facilitator Guide'; desc = 'Run-of-show, kickoff talking points, debrief structure, and contingency playbook.' },
  @{ src = 'modules\01-github-app-setup.md'; dest = 'modules\01-github-app-setup.md'; title = 'Module 1 · GitHub App: Setup & First Look'; desc = 'Required live setup module: install the GitHub App, sign in, enable experimental flags, run a smoke-test prompt.' },
  @{ src = 'modules\02-prompt-to-pr.md'; dest = 'modules\02-prompt-to-pr.md'; title = 'Module 2 · Prompt to PR'; desc = 'Drive a coding agent from prompt to merged PR end-to-end with Copilot Code Review and Agent Merge.' },
  @{ src = 'modules\03-slide-deck-maker.md'; dest = 'modules\03-slide-deck-maker.md'; title = 'Module 3 · Slide Deck Maker'; desc = 'Generate a customer-ready deck from a prospect question with Copilot CLI.' },
  @{ src = 'modules\04-vibe-code-game.md'; dest = 'modules\04-vibe-code-game.md'; title = 'Module 4 · Vibe-Code a Game'; desc = 'Build a working browser game in under an hour with no manual code.' },
  @{ src = 'modules\05-chief-of-staff.md'; dest = 'modules\05-chief-of-staff.md'; title = 'Module 5 · Chief of Staff (Work-IQ)'; desc = 'Take-home self-study: connect Copilot to your M365 locally for weekly summary + meeting brief.' },
  @{ src = 'modules\06-llm-assist.md'; dest = 'modules\06-llm-assist.md'; title = 'Module 6 · LLM-Assist · Account Research'; desc = 'Take-home self-study: spin up a Codespace from github/llm-assist and produce a real account artifact.' },
  @{ src = 'modules\07-copilot-cli.md'; dest = 'modules\07-copilot-cli.md'; title = 'Module 7 · Copilot CLI Deep Dive'; desc = 'Take-home self-study: master the terminal-native Copilot agent, --yolo, /research, and MCP.' }
)

foreach ($f in $files) {
  $srcPath = Join-Path $srcRoot $f.src
  $destPath = Join-Path $docs $f.dest
  if (-not (Test-Path $srcPath)) {
    Write-Warning "Source not found: $srcPath"
    continue
  }
  $body = [System.IO.File]::ReadAllText($srcPath, $utf8NoBom)
  # Strip a leading H1 if present (Starlight renders the frontmatter title as the page heading)
  $body = [regex]::Replace($body, '^\s*#\s+[^\r\n]+(\r?\n)+', '')
  $fm = "---`ntitle: `"$($f.title)`"`ndescription: `"$($f.desc)`"`n---`n`n"
  [System.IO.File]::WriteAllText($destPath, $fm + $body, $utf8NoBom)
  Write-Host "wrote $($f.dest)"
}
