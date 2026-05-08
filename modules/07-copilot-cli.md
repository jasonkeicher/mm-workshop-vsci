# Module 7 · Copilot CLI Deep Dive

> **📚 Take-home self-study module.** Not selectable as a live workshop path under the current format — it lives entirely in the terminal and runs independently of the GitHub App. Fully runnable on your own time; the commercial story still maps to the [Seller Playbook Overview](../seller-playbook-overview.md).
>
> **Time:** 90 min · **Format:** Solo · **Surface:** Copilot CLI in your terminal
>
> By the end of this module you'll be fluent in the terminal-native Copilot agent — including MCP, autonomous mode, and `/research` — and able to position it for ops, platform, and DevOps buyer personas.

---

## Purpose & Goal

Master Copilot CLI for **headless, scriptable, terminal-native** workflows. After this module, you can:

- Demonstrate Copilot CLI to a platform/DevOps buyer with confidence.
- Tell the **MCP extensibility** story (the integration moat vs. competitors).
- Connect ad-hoc CLI flows (chat-cheap) and autonomous agents (chat-expensive) to AI Credits dynamics.

---

## Prerequisite Check (5 min)

- [ ] Copilot CLI installed: `copilot --version`. If missing, see [Copilot CLI docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli).
- [ ] `gh auth status` is clean.
- [ ] A terminal you're comfortable in.
- [ ] (Optional) Docker — for some MCP servers.

Configure the GitHub Remote MCP server (recommended once):

```bash
copilot mcp add github
```

This gives the agent access to GitHub issues, PRs, repos, and Actions across all your authenticated orgs.

---

## Guided Steps (70 min)

### Exercise 1 — Repo summary (10 min)

Pick a real repo you care about. Clone it (or `cd` into it):

```bash
git clone https://github.com/<org>/<repo>.git
cd <repo>
copilot
```

In the Copilot CLI session:

```text
Summarize this repo. What does it do? Top 5 files I should read first to
understand the architecture. Any obvious tech debt or risks.
```

Read the response. **This is a chat-style flow** — single prompt, single response, low cost.

### Exercise 2 — Issue triage with `--yolo` (15 min)

`--yolo` means "run autonomously without asking for confirmation on each tool call." Use carefully — but it's *the* mode for unattended work.

```bash
copilot --yolo
```

Prompt:

```text
Find the 5 most recent open issues in this repo with the label "bug" or
"good first issue". For each, write a short triage comment summarizing the
likely root cause and suggesting a path forward. Print the comments — do NOT
post them yet.
```

Watch the agent: it uses the GitHub MCP to fetch issues, reasons over each, and produces structured output. **This is agentic** — multi-step, no human-in-the-loop turns.

(If you want to actually post: append "now post each comment to the corresponding issue." Use real judgment — these are real customers' issues if it's a public repo.)

### Exercise 3 — Generate a script (10 min)

Pick a real ad-hoc task you'd normally do manually. Examples:

- Process a CSV: rename columns, filter rows, output JSON.
- Find all `.env.example` files in a folder tree and confirm none have secret-looking values.
- Diff two versions of an OpenAPI spec and summarize the breaking changes.

Prompt:

```text
I have a CSV at ./data.csv with columns: customer, plan, monthly_cost,
last_login. Write me a Python script that:
- Filters to rows where last_login is older than 90 days
- Sums monthly_cost per plan tier
- Prints a Markdown table to stdout

Make it run with python3 only. No external libraries beyond stdlib.
```

The agent writes the script. **Run it.** Iterate if wrong. This is the **"Copilot CLI as personal Stack Overflow + scratchpad"** pattern.

### Exercise 4 — `/research` for multi-step reasoning (15 min)

`/research` is Copilot CLI's plan-mode equivalent. Use it for tasks that need to read many sources before acting.

```text
/research

I'm preparing for a customer meeting with <Customer> who is currently using
GitLab + Jenkins. I want to understand:
- Their public GitHub presence (any repos, contributions)
- Recent news and announcements about their engineering org
- Likely integration concerns moving from GitLab to GitHub Enterprise

Research deeply. Cite sources. Produce a structured brief in Markdown.
```

The agent will run multiple searches, follow links, synthesize. This is **deep agentic** — easily 5–15 minutes of model time.

### Exercise 5 — MCP exploration (10 min)

Show what MCP unlocks. Try one of these:

- **Filesystem MCP**: `copilot mcp add filesystem` → ask the agent to organize a folder.
- **Slack MCP** (if available): summarize recent channel activity.
- **A custom MCP** from your team's internal tools.

Prompt examples to try:

```text
What MCP servers are currently configured for me?
```

```text
Using the GitHub MCP, list all repos in the <org> org sorted by stars,
showing license and last commit date.
```

The point: **MCP is the integration moat.** Any customer who has internal tools can expose them via MCP and have Copilot drive them. This is **a competitive talking point against Cursor, Cline, and other code-only assistants**.

### Exercise 6 — Build your cheat sheet (10 min)

Save a personal CLI cheat sheet with your favorite prompts:

```bash
mkdir -p ~/.copilot-cheats
cat > ~/.copilot-cheats/playbook.md <<'EOF'
# My Copilot CLI Playbook

## Daily standup
copilot "Summarize commits across my forked repos in the last 24h"

## Issue triage
copilot --yolo "Triage open bugs in <repo>; print suggested comments"

## Research a customer
copilot "/research <Customer> recent GitHub activity and engineering news"

## Generate a one-off script
copilot "Write me a <language> script that <task>"
EOF
```

This is your take-home. Add to it every week.

---

## Stretch Goals (take-home)

- Build a **custom MCP server** that exposes one of your team's internal tools to Copilot. See <https://modelcontextprotocol.io>.
- Use `copilot --yolo` in a **scheduled cron job** for daily reports (e.g., "every Monday at 8am, generate a summary of the past week's repo activity and email me").
- Combine Copilot CLI with `gh` and `jq` in shell pipelines for ops workflows.
- Try the [llm-assist plugin marketplace](https://github.com/github/llm-assist) to install pre-built skill bundles.

---

## Seller Playbook (10–15 min)

### What you just experienced (the agentic lens)

- **Mixed.** Exercise 1 (repo summary) and Exercise 3 (script generation) are **chat-style** — fast, cheap, predictable.
- Exercise 2 (`--yolo` issue triage), Exercise 4 (`/research`), and Exercise 5 (MCP-driven multi-step) are **agentic** — multi-step, multi-minute, multi-tool. Higher token consumption.
- The CLI's "spectrum" is the most important seller insight: **the same product** does both, and the cost scales with the workload — exactly what usage-based billing aligns to.

### Premium Requests today

- Chat exercises: 1–2 PRUs each.
- `--yolo` triage: 10–20 PRUs.
- `/research`: 30–80 PRUs on a strong model.
- An annual Pro user doing daily ops work hits the gate within a week of heavy use.

### AI Credits after June 1

- Token-based, very predictable. Chat exercises run on cents; agentic flows on dollars.
- **`--yolo` is where AI Credits matter most**: unattended autonomous work means the user isn't watching token consumption in real time. **Admin budget controls become non-negotiable** — you don't want a runaway script consuming your org's pool.
- This is also where **per-cost-center budgets** shine. Platform engineering can have its own budget separate from product engineering.
- **MCP servers don't add credit cost themselves** — they expand what the agent can *do*, but cost is still tied to the model's token consumption during the session.

### Customer talk track

**Discovery:**

- *"What's your platform / DevOps team doing with AI assistants today? IDE-only, or terminal too?"*
- *"Do you have any internal tools that AI assistants can't reach today? What would change if they could?"*
- *"How would you set budgets and guardrails for autonomous AI workflows running on a schedule?"*

**Objection: "We use [Cursor / Cline / other agent tool]. Why Copilot CLI?"**

> "Three things. **One**, MCP — the integration moat. Any internal tool you have, Copilot can drive via MCP, on the same auth as `gh`. **Two**, governance: pooled credits across the org, admin budget controls per cost center, hard caps. **Three**, GitHub-native: the same agent that runs in your terminal also runs in the GitHub App, in VS Code, and on github.com. One product, one license, one bill, one governance model."

### Expansion play

- **Land**: Copilot Business for the dev org.
- **Wedge**: Platform / SRE / DevOps team — Copilot CLI is *their* surface. They drive MCP adoption.
- **Expand**: Build internal MCP servers exposing org-specific tools — those become the customer's competitive moat on top of Copilot.
- **Upsell**: Enterprise for governance — per-cost-center budgets, audit trails, larger included credits.
- **Add-on AI Credits** for teams running `--yolo` automations at scale.

### One-line takeaway you can use Monday

> "Copilot CLI is the same agent that's in your IDE — but in the terminal, with full MCP integration to your internal tools. That's the platform/DevOps story, and it's the only Copilot story where governance and pooled credits become non-negotiable."

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| `copilot` not found | Reinstall per [Copilot CLI docs](https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli) |
| GitHub MCP not working | `copilot mcp add github` then re-authenticate; check `gh auth status` |
| `--yolo` does something destructive | Always test in a scratch folder or repo fork first; never `--yolo` against production data |
| Agent picks the wrong model | `copilot --model claude-sonnet-4.6` to pin |
| Custom MCP server crashes | Check the server's logs; verify it follows the MCP spec at <https://modelcontextprotocol.io> |
| `/research` returns shallow results | Use a stronger model (Opus 4.6); be more specific in the brief |

---

## Reference

- Copilot CLI docs: <https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli>
- Model Context Protocol: <https://modelcontextprotocol.io>
- llm-assist plugin marketplace: <https://github.com/github/llm-assist>
