---
title: "Module 5 · Chief of Staff (Work-IQ)"
description: "Take-home self-study: connect Copilot to your M365 locally for weekly summary + meeting brief."
---

> **📚 Take-home self-study module.** Not selectable as a live workshop path under the current format — it doesn't depend on the GitHub App and runs entirely in your local terminal. Fully runnable on your own time; the commercial story still maps to the [Seller Playbook Overview](../../seller-playbook-overview/).
>
> **Time:** 90 min · **Format:** Solo on personal laptop · **Surface:** Copilot CLI + `microsoft/work-iq`
>
> By the end of this module you'll have connected Copilot to your own Microsoft 365 calendar/email locally, generated a weekly summary, and prepared a brief for an upcoming customer meeting — entirely on your laptop, no tenant-level install required.

---

## Purpose & Goal

Use Copilot as your **personal Chief of Staff**. After this module, you can:

- Tell a real "I use this every Monday morning" story to a customer.
- Position Copilot as a **knowledge-worker productivity layer** — not just a developer tool.
- Connect personal-productivity workloads to **AI Credits** and the broader Copilot-for-everyone story.

---

## Prerequisite Check (5 min)

- [ ] Copilot CLI installed: `copilot --version`.
- [ ] A Microsoft 365 account you can authenticate to (work or personal — both work).
- [ ] You can `gh auth status` cleanly.
- [ ] Local terminal you're comfortable in (PowerShell, zsh, bash all fine).

> **Privacy note**: Work-IQ connectors run **locally** and authenticate as you. The calendar/email excerpts needed for a prompt are still processed by Copilot under the applicable GitHub/Microsoft data-protection terms; Work-IQ does not create a separate tenant-wide install or shared data warehouse. This distinction is critical when customers ask about data residency and approvals.

---

## Phase 1 — Setup (30 min)

### Step 1 — Clone Work-IQ (5 min)

```bash
git clone https://github.com/microsoft/work-iq.git
cd work-iq
```

Skim the README's **Quick Start with GitHub Copilot CLI** section: <https://github.com/microsoft/work-iq#-quick-start-with-github-copilot-cli>.

### Step 2 — Launch Copilot CLI in the Work-IQ folder (5 min)

```bash
copilot --yolo
```

Choose your model: `Claude Sonnet 4.6` or better. This is critical — calendar reasoning benefits from a stronger model.

### Step 3 — Run the guided onboarding (15 min)

In the Copilot CLI session, run:

```text
/welcome
```

(If `/welcome` isn't available in this repo, prompt: *"Walk me through the Work-IQ Quick Start. Probe my capabilities, authenticate me to Microsoft 365, and validate I can read my calendar."*)

The agent will:

1. Probe your local capabilities.
2. Walk you through Microsoft 365 device-code auth.
3. Validate access to calendar, email, and Teams.

Follow the prompts. Authenticate with **your** M365 account when the device code appears.

### Step 4 — Validate access (5 min)

Once auth completes, prompt:

```text
List my next 5 calendar events with attendees and topics.
```

You should see real data from your calendar. If not, see Troubleshooting.

---

## Phase 2 — Productivity (45 min)

### Step 5 — Generate a weekly summary (15 min)

```text
Generate a weekly summary covering the last 7 days. Include:
- Meetings I attended (count, total hours, top 3 by topic)
- People I met with most often
- Open threads from email I haven't replied to
- Decisions that were made vs. parked
- Three things I should follow up on this week

Format as Markdown. Be concise. No filler.
```

Save the output to `weekly-summary.md`. Read it. Note what's accurate vs. what's noise.

### Step 6 — Prepare a customer meeting brief (15 min)

Pick a real upcoming customer meeting from your calendar. Prompt:

```text
I have a meeting with <Customer> on <Date> at <Time>. Build me a brief that includes:
- Attendees and their likely roles (use email signatures, prior meetings)
- Last 3 interactions I had with anyone from <Customer> (calendar + email)
- Open questions or commitments from prior meetings
- 3 specific talking points based on the meeting context
- 2 pieces of homework I should complete before the meeting

Format as Markdown. Be specific — no generic "build rapport" advice.
```

Save to `briefs/<customer>-<date>.md`.

### Step 7 — Draft follow-up emails (10 min)

After your weekly summary, pick 1–2 open threads and prompt:

```text
Draft a follow-up email for the <topic> thread with <person>. Tone: warm,
specific, action-oriented. Reference the prior commitment. Suggest a concrete
next step with a date.
```

Don't send blindly — *always* read and edit before hitting send. The agent will sometimes invent context.

### Step 8 — Build a "Monday morning" prompt template (5 min)

Save this in your dotfiles or somewhere you'll find next week:

```text
Run my Monday morning routine:
1. Weekly summary of last 7 days
2. Brief for every customer meeting in the next 5 business days
3. Top 3 emails awaiting my response, with draft replies
4. Anything in my calendar that conflicts or needs declining

Format as a single Markdown brief I can read in 5 minutes.
```

This is the artifact you bring to your next customer conversation.

---

## Stretch Goals (take-home)

- Connect Work-IQ to **Teams messages** — generate a "what I missed in Teams while heads-down" summary.
- Create a **scheduled run** (cron / Windows Task Scheduler / GitHub Actions on a private repo) that runs your Monday morning routine automatically and emails you the result.
- Add **CRM context** — paste in a customer's CRM record and ask the agent to fold it into the meeting brief.

---

## Seller Playbook (10–15 min)

### What you just experienced (the agentic lens)

- **Mostly chat with light agentic patterns**: each prompt = a multi-step retrieval (calendar API + email API + reasoning) but completes in seconds.
- **The killer demo isn't the speed — it's the personal data integration.** Customers worried about Copilot "knowing" their corporate data feel very differently when they see the data stays on the seller's machine.
- **Token consumption**: low to medium. Calendar/email summarization is cheap; reasoning over a week of meetings is medium.

### Premium Requests today

- Light usage. Maybe 5–15 PRUs for a full Monday morning routine on a base model.

### AI Credits after June 1

- Token-based makes this cheap and predictable. A typical week might consume **$1–3 of AI Credits** for a knowledge worker — well inside any plan's monthly allotment.
- **The unlock is at scale**: when an entire executive office uses this pattern, **pooled credits** absorb the variance. The Chief of Staff who runs heavy summaries on Friday is funded by the VP who only used autocomplete on Tuesday.

### Customer talk track

**Discovery:**

- *"Who in your organization spends the most time in Outlook and Teams? What would it be worth to give them a personal Chief of Staff?"*
- *"Have you considered Copilot for non-engineering teams? What's blocking that?"*
- *"How does your security team feel about AI tools that touch calendar and email data?"*

**Objection: "Our security team will never approve email/calendar data going to AI."**

> "Work-IQ connectors run **locally on the user's machine** and authenticate as that user to Microsoft 365. The Copilot model receives the calendar/email excerpts needed for the prompt under the applicable enterprise data-protection terms, but Work-IQ does not add a tenant-level install, data warehouse, or shared store. Security teams should approve that Copilot processing path explicitly; the point is controlled user-scoped access, not a new bulk data pipeline."

### Expansion play

- **Land**: Copilot Business for the dev org.
- **Wedge**: 5-seat pilot for the executive office with Work-IQ — instant productivity story.
- **Expand**: roll seats to functional leaders (sales managers, PM directors, ops leads).
- **Upsell**: Enterprise for governance + Copilot Spaces, so the org's strategic context becomes Spaces the executive office prompts against.

### One-line takeaway you can use Monday

> "I run my entire Monday morning prep through Copilot — meeting briefs, customer follow-ups, the works. It runs on my laptop with my M365 account. Same Copilot license. Zero IT involvement. Imagine giving every leader at your company that same hour back every Monday."

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| M365 auth fails with tenant policy error | Use a personal Microsoft account; or ask IT for a single-user consent for the Work-IQ device-code flow |
| `/welcome` command not recognized | Skip it; prompt manually as in Step 3 |
| Calendar returns empty | Check timezone in your prompt; explicitly include date ranges |
| Agent invents meeting details | This is a hallucination flag — model is too small. Switch to Claude Opus or the strongest approved GPT model available in your picker |
| Email draft is too generic | Provide more context in the prompt: paste the prior thread; specify tone and word count |

---

## Reference

- Work-IQ repo: <https://github.com/microsoft/work-iq>
- Copilot CLI docs: <https://docs.github.com/en/copilot/concepts/agents/copilot-cli/about-copilot-cli>
