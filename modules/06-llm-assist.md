# Module 6 · LLM-Assist · Research a Customer Account

> **📚 Take-home self-study module.** Not selectable as a live workshop path under the current format — it requires a Codespace and runs independently of the GitHub App. Fully runnable on your own time; the commercial story still maps to the [Seller Playbook Overview](../seller-playbook-overview.md).
>
> **Time:** 90 min · **Format:** Solo in a Codespace · **Surface:** `github/llm-assist` Codespace + Copilot Chat (Agent mode)
>
> By the end of this module you'll have launched a Codespace from `github/llm-assist`, authenticated to internal data sources, and produced a real artifact (account plan, QBR, or adoption plan) for a customer in your patch.

---

## Purpose & Goal

Use Copilot **grounded in real GitHub data sources** (Kusto, GitHub issues, Splunk, Hubbers, etc.) to research a customer account. After this module, you can:

- Bring a generated account plan, QBR, or adoption plan into your **next real customer conversation**.
- Speak to **Copilot grounded in your data** as a customer enterprise narrative.
- Tell the story of agentic, multi-step research as a high-value AI Credits workload.

> **Internal-only:** `github/llm-assist` is a GitHub-internal repo. Confirmed all attendees are GitHub employees.

---

## Prerequisite Check (5 min)

- [ ] You can access <https://github.com/github/llm-assist> (auth wall = need access; ask in `#llm-assist-requests` Slack channel if blocked).
- [ ] Codespaces quota available at <https://github.com/settings/billing/summary>.
- [ ] A target customer in mind from your patch (real account, real upcoming conversation).
- [ ] GitHub Azure identity (`<user>@githubazure.com`) — used for Kusto auth.

---

## Guided Steps (75 min)

### Step 1 — Launch the Codespace (5 min, then 5+ min build)

Go to <https://github.com/github/llm-assist> → **Code → Codespaces → New codespace**. Pick a 4-core machine type for faster builds.

While it builds (typically 3–8 min), pick your customer and the artifact you want:

| Artifact | Best when |
|---|---|
| **Account plan** | New territory, prepping for a strategic conversation |
| **QBR** | Existing customer, quarterly review coming up |
| **Adoption plan** | Customer is ramping Copilot/Actions/GHAS, needs phased rollout |
| **Monorepo review** | Customer's repo is the conversation (technical buyer) |
| **MCS positioning** | Premium Plus / Microsoft Customer Success angle |

### Step 2 — Open Copilot Chat and run `/welcome` (10 min)

Once the Codespace is ready:

1. Open Copilot Chat (right panel or `Ctrl+Cmd+I` Mac / `Ctrl+Alt+I` Linux/Win).
2. Switch to **Agent** mode.
3. Pick a model: `Claude Opus 4.6 (1M context)` or better. (Model availability depends on policy.)
4. Allow tool permission prompts as they appear.
5. Type:

```text
/welcome
```

The agent probes your environment, checks what data sources you have access to, and walks you through authenticating to each one. Expect to authenticate to:

- **Azure CLI** (Kusto access) — device-code flow, sign in as `<user>@githubazure.com`.
- **GitHub CLI** (issue/PR search) — already authenticated in Codespaces.
- **Optional**: Splunk, ESB-Tools, CRE Dashboard, Hubbers, WorkIQ — auth as available.

Just follow the prompts. **No manual setup required.**

### Step 3 — Run the capability probe (5 min)

After `/welcome` finishes, run:

```bash
python3 tools/capability_probe.py --pretty
```

You'll see a dashboard of which data sources are unlocked. **Note which are green vs. red** — some require Tailscale, FIDO, or Okta cookies that may not be available in a fresh Codespace. That's OK — Kusto + GitHub is enough for most artifacts.

### Step 4 — Generate your artifact (30 min)

Pick the prompt that matches your artifact:

| Artifact | Prompt |
|---|---|
| Account plan | `account plan for <Customer>` |
| QBR | `generate QBR for <Customer>` |
| Adoption plan | `build a Copilot adoption plan for <Customer>` |
| Monorepo review | `monorepo review for <org>/<repo>` |
| Premium Plus value report | `P+ value report for <Customer>` |
| MCS positioning | `MCS positioning for <Customer>` |
| Investigate ticket | `investigate ticket <ticket-id>` |

The agent will:

1. Run a series of Kusto queries.
2. Search GitHub issues/PRs.
3. Pull customer metadata where available.
4. Reason over the results.
5. Produce a structured Markdown artifact, usually in `generated-assets/`.

**This step takes 5–15 minutes** for a well-grounded artifact. Watch the chat — see which queries it runs, which data sources it pulls from. You're watching agentic research happen.

### Step 5 — Read and validate (10 min)

Open the generated artifact. **Read it like the customer would.** Check:

- ✅ Numbers cite a query — never trust a number that's not grounded.
- ✅ Customer name is correct (not a hallucinated similar one).
- ✅ Recommendations are specific to *this* customer, not generic best-practice.
- ❌ Anything that says "according to public sources" without a link → push back.

If the artifact has gaps, prompt:

```text
Section 3 is too generic. Run additional Kusto queries to find <specific data>
and revise that section with concrete numbers grounded in query results.
```

### Step 6 — Save securely to `generated-assets/` and commit (5 min)

The artifact is yours, but it may contain customer-confidential data. Before saving or committing:

- Store it only in a private repo, private fork, or approved local folder.
- Redact secrets, personal data, support-ticket details, and customer-confidential notes that do not belong in a repo.
- Do **not** commit generated customer artifacts to a public repo or shared workshop repo.
- Follow your team's customer-data handling rules before sharing outside the account team.

After that review, save it and optionally commit to a private fork:

```bash
git checkout -b customer-research/<customer>
git add generated-assets/
git commit -m "Research artifact: <customer>"
```

This is your homework artifact. Bring it to the customer call.

### Step 7 — (Optional) Try a second flow (10 min)

If you have time, run a complementary artifact for the same customer. E.g., if you ran an account plan, also run an adoption plan. Compare what each surfaces.

---

## Stretch Goals (take-home)

- Build the same artifact for **3 customers in your patch**. Time how long the second and third runs take versus the first.
- Use the **`hunt tickets`** flow to find resolvable open tickets across your patch — and resolve one.
- Set up the **Copilot CLI plugin marketplace** version of llm-assist on your laptop for use outside Codespaces (see the README).

---

## Seller Playbook (10–15 min)

### What you just experienced (the agentic lens)

- This was **deeply agentic**. A single prompt → 10–30 Kusto queries, 5–15 GitHub searches, multi-step reasoning, structured output.
- Expect this single artifact run to consume **as much in tokens as 50 chat questions**. That's not a problem — it's the *point*. Look at the value: an account plan that took an analyst 4 hours, generated in 15 minutes, grounded in real telemetry.
- This is the **highest-credit-value workload** in the entire workshop.

### Premium Requests today

- A single account-plan run probably consumes 30–80 PRUs on Claude Opus under the legacy model. Today, a heavy seller hits the gate fast and falls back to a smaller model — **dropping the artifact's quality silently**.

### AI Credits after June 1

- Same workload → token-based. The seller's monthly $39 (Pro+) or org's pooled allotment governs it.
- **No fallback model.** When the seller hits the budget cap, they don't silently get worse research — they hit a budget gate the admin set, and the admin can top up AI Credits.
- **Pooled credits** are crucial here. Sellers who do account research (heavy) are subsidized by the broader org's lighter usage.
- **For customers**: this is the canonical "agentic research" workload. When you describe to a customer how their analysts and consultants will use Copilot, *this is what it looks like*.

### Customer talk track

**Discovery:**

- *"How long does it take your sales / consulting / account team to build an account brief, QBR, or research artifact today?"*
- *"What data sources do they pull from? Are those data sources accessible to AI tools today, with proper governance?"*
- *"What would it be worth to cut artifact prep time by 80%?"*

**Objection: "We can't trust AI-generated research."**

> "You shouldn't trust *ungrounded* AI research — neither do we. What you saw was Copilot running real queries against real data, citing every number, and generating an artifact in 15 minutes that a human still reviews and edits. The agent isn't replacing the human — it's doing the data plumbing the human used to spend 3 hours on. Every claim in the artifact links back to its source. **Always review** AI-generated findings — that warning is in our internal tool too."

### Expansion play

- **Land**: Copilot Enterprise for the dev org.
- **Expand**: Copilot Business seats for sales engineering, customer success, account management — same agentic research workload.
- **Upsell**: Copilot Spaces with the customer's organizational knowledge, governance for cross-team data grounding.
- **Add-on AI Credits** as agentic research adoption scales.

### One-line takeaway you can use Monday

> "I built a real account plan for a real customer in 15 minutes, grounded in real telemetry data. That's what 'AI grounded in your data' looks like — and that's the agentic workload your customers will pay for in AI Credits."

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| Codespace fails to build | Try a 2-core machine type; check Codespaces quota; check the repo's `.devcontainer` for known issues |
| `/welcome` not recognized | The repo's command may have moved — prompt manually: *"Set up llm-assist for me. Probe capabilities, authenticate to all available services, and confirm I'm ready to query Kusto."* |
| Azure CLI auth fails | Manual: `az login --use-device-code --output none` then sign in as `<user>@githubazure.com` |
| Kusto query times out | Narrow the date range in your prompt; use `--first 100` style limits |
| Artifact has hallucinated facts | Switch to Claude Opus 4.6 (1M context); explicitly require *every claim must cite a query result* in the prompt |
| Splunk / Hubbers / CRE / WorkIQ unavailable | Expected in fresh Codespaces. The basic Kusto + GitHub flow is enough for most artifacts |

---

## Reference

- Repo: <https://github.com/github/llm-assist>
- Slack support: `#llm-assist-requests`
- Demo videos linked in repo README
- Copilot CLI plugin marketplace (use llm-assist outside Codespaces): see `plugins/README.md` in the repo
