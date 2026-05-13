# Facilitator Guide

Run-of-show, timing, contingencies, and debrief structure for the Mid-Market Seller Copilot Workshop.

---

## Day-Of Run-of-Show (90 min total)

| Time | Block | Owner |
|---|---|---|
| T+00:00 | **Kickoff** (5 min) | Lead facilitator |
| T+00:05 | **Module 1 · GitHub App Setup** (25 min) — everyone | Lead facilitator + 1 floater |
| T+00:30 | **Module 2 · Slide Deck Maker** (60 min, debrief embedded in Step 9) — everyone | Each attendee solo; floater roams; lead facilitator runs embedded debrief at ~T+01:23 |
| T+01:30 | Done |

**No mid-session break** — the 25 + 60 structure has natural transitions. The Stage-2 module embeds its own 5–7 min show-and-tell debrief at the end (M3 Step 9).

Doors should open ~15 min before T+00:00 so attendees can sort last-mile setup issues before the clock starts.

---

## Kickoff Talking Points (5 min — pick exactly 2)

You only have 5 minutes. Pick **2** of the following; the others move to closing remarks:

1. **Why we're doing this** — Sellers must use the product to sell the product. Today every attendee personally drives Copilot through a real workflow and walks out with a customer-ready deck.
2. **The commercial pivot** — Walk the [Seller Playbook Overview](seller-playbook-overview.md) "60-Second Narrative." Don't go deep — they'll see it firsthand in Module 2.
3. **How today works** — 25-min guided setup, then 60 min building a deck (debrief embedded at the end). Five more modules go home as self-study.
4. **The bring-back homework** — Use your deck in your next real customer call. Share it back in the team channel.
5. **Logistics** — Slack channel, who to grab if stuck, no break (it's only 90 min).

**Recommended default pair: 1 + 3** for first-run audiences; **2 + 4** for an audience that's already done a Copilot workshop before.

---

## Deck-Type Picker (Module 2)

In Module 2 every attendee picks **one of four deck types** to build. Brief intro at T+00:30; encourage the room to pick fast (1–2 min) and start their session.

| Type | Best fit |
|---|---|
| **A · Customer Q&A** | Seller has a real prospect question in mind |
| **B · GitHub Docs summary** | Wants to learn a GitHub topic by building a deck about it |
| **C · EBC deep-dive** | Has an upcoming EBC / exec briefing on a chosen GitHub topic |
| **D · Pricing transition** | Wants a procurement/CFO-ready deck on the June 1 AI Credits cutover |

- **Pre-event** *(recommended)*: send the deck-type summaries with the workshop form so attendees show up knowing which one they want.
- **Live fallback**: at minute 25 (transition out of Module 1), attendees who didn't pre-select pick from the 4 types. Module 2's Step 1 is the picker.
- **Day-of swap**: discouraged after ~10 min into Module 2 — they lose too much iteration time.

---

## Debrief Structure (5–7 min, embedded in Module 2 Step 9)

There is no standalone debrief block under the new format — it lives at the end of Module 2 (Step 9). Aim for 5–7 minutes and move fast. Round-robin **by deck type**:

1. **Show the deck** (~30 sec each): the deck.html (or PDF). Screen-share if remote.
2. **One thing that surprised you** (1 sentence each).
3. **One Seller Playbook moment** (1 sentence each): which part of your activity was *agentic*? How would you describe the cost to a customer?

End with a **1–2 min facilitator wrap**: top 2 themes you heard, plus the take-home challenge — *"use your deck in a real customer conversation this week, and pick at least one Stage-3 module to run on your own."*

---

## Contingency Playbook

| Risk | Likelihood | Mitigation |
|---|---|---|
| **GitHub App alpha access denied for the room** | Medium | **Workshop-blocker for Module 1 and the live Module 2 path.** Fallback plan: facilitator briefly demos the App, then everyone uses the **No-App CLI fallback** documented in Module 2. Pre-flight: confirm 100% of attendees have alpha access 24h before. |
| GitHub App alpha access denied for one attendee | Medium | Pivot them to the **No-App CLI fallback** in Module 2. They can still complete a customer deck locally with the native Copilot CLI. |
| Codespaces quota exhausted | Low (no live module needs Codespaces) | N/A for live session. Mention as risk only for take-home Module 6. |
| M365 auth blocked by tenant policy | Low (no live module needs M365) | N/A for live session. Mention as risk only for take-home Module 5. |
| Copilot model unavailable / rate-limited | Low | Switch to a different model (GPT-4o, Sonnet) in the model picker; document fallback in module handout |
| Network / WiFi flaky | Medium | Have a tethered hotspot ready; Marp installs and the deck preview both need network |
| Deck-type-specific reference URLs unreachable | Low | Have attendee fall back to Type A (Customer Q&A) — it relies on the seller's own brief plus 1–2 GitHub URLs we know are stable |
| Attendee finishes deck early | High (good problem) | Encourage a second deck type with a different `notes.md`; or start a take-home module |
| Attendee falls behind in Module 1 setup | High | Floater pairs with them; even if they're 10 min late to Module 2, the deck flow is forgiving |
| Module 1 runs over 25 min | High (likely on first run) | Hard-stop at T+00:30; anyone still mid-setup pairs with floater during Module 2 |

---

## Facilitator Pre-Flight (Week Before)

- [ ] Send pre-event form with the 4 Module 2 deck-type summaries; collect selections.
- [ ] **Confirm GitHub App alpha access for every attendee** (workshop-blocker if denied).
- [ ] **Validate the prereqs checklist on a clean Windows laptop AND a clean Mac.** The team has hit setup pain in prior runs — re-verify both OS paths end-to-end.
- [ ] Pre-run Module 1 + Module 2 (all 4 deck types) end-to-end yourself; record any "gotcha" notes.
- [ ] Draft the kickoff slide deck (out of scope for this workshop content but referenced here).
- [ ] Set up a dedicated Slack channel for the day.

## Facilitator Day-Of Pre-Flight (Morning)

- [ ] Test screen share, Wi-Fi, audio.
- [ ] Verify all linked videos and external URLs in handouts still resolve.
- [ ] Have the Seller Playbook Overview pulled up on a side monitor for quick reference.
- [ ] Pre-launch the GitHub App on the demo machine so you can drive Module 1 live in parallel.

---

## Post-Event

- 1-week follow-up: ping the team channel asking who used their deck in a customer conversation.
- Collect anonymous feedback (5 questions max).
- Update module handouts with anything that broke or confused attendees.
- Encourage attendees to work through at least one Stage-3 (take-home) module within 30 days — Modules 2 and 4 are the natural next steps for sellers who want the agentic-SDLC story firsthand.
