# Facilitator Guide

Run-of-show, timing, contingencies, and debrief structure for the Mid-Market Seller Copilot Workshop.

---

## Day-Of Run-of-Show (90 min total)

| Time | Block | Owner |
|---|---|---|
| T+00:00 | **Kickoff** (5 min) | Lead facilitator |
| T+00:05 | **Module 1 · GitHub App Setup** (25 min) — everyone | Lead facilitator + 1 floater |
| T+00:30 | **Stage 2 chosen module** (50 min) — Module 2, 3, or 4 | Each attendee solo; floater roams |
| T+01:20 | **Debrief** (10 min) | Lead facilitator |
| T+01:30 | Done |

**No mid-session break** — the 25 + 50 + 10 structure has natural transitions.

Doors should open ~15 min before T+00:00 so attendees can sort last-mile setup issues before the clock starts.

---

## Kickoff Talking Points (5 min — pick exactly 2)

You only have 5 minutes. Pick **2** of the following; the others move to closing remarks:

1. **Why we're doing this** — Sellers must use the product to sell the product. Today every attendee personally drives Copilot through a real workflow.
2. **The commercial pivot** — Walk the [Seller Playbook Overview](seller-playbook-overview.md) "60-Second Narrative." Don't go deep — they'll see it firsthand in their module.
3. **How today works** — 25-min required setup, then pick 1 of 3 paths for 50 min, then debrief. Three more modules go home with you as self-study.
4. **The bring-back homework** — Use your artifact in your next real customer call. Share it back in the team channel.
5. **Logistics** — Slack channel, who to grab if stuck, no break (it's only 90 min).

**Recommended default pair: 1 + 3** for first-run audiences; **2 + 4** for an audience that's already done a Copilot workshop before.

---

## Module Selection Mechanic

- **Pre-event** *(recommended)*: send a form 1 week before with the 3 Stage-2 module summaries. Cap based on facilitator-floater capacity if needed (all 3 paths share the GitHub App, so there's no infrastructure constraint to plan around).
- **Live fallback**: at minute 25 (transition out of Module 1), attendees who didn't pre-select pick from the 3 paths. The README's "Pick Your Module" table works as the picker.
- **Day-of swap**: an attendee can swap paths at T+00:30 if their plan changed. After ~10 min into Stage 2, swapping costs them too much time — discourage.

---

## Debrief Structure (10 min)

You have 10 minutes for everyone, so move fast. Round-robin **by Stage-2 module**:

1. **Show the artifact** (~30 sec each): the PR, deck, or game. Screen-share if remote.
2. **One thing that surprised you** (1 sentence each).
3. **One Seller Playbook moment** (1 sentence each): which part of your activity was *agentic*? How would you describe the cost to a customer?

End with a **2-min facilitator wrap**: top 2 themes you heard, and the take-home challenge — *"use your artifact in a real customer conversation this week."*

---

## Contingency Playbook

| Risk | Likelihood | Mitigation |
|---|---|---|
| **GitHub App alpha access denied for the room** | Medium | **Workshop-blocker.** Fallback plan: facilitator demos Module 1 + Module 2 live on the projector while attendees watch; everyone's Stage 2 becomes Module 3 (Slide Deck Maker — only needs Copilot CLI). Pre-flight: confirm 100% of attendees have alpha access 24h before. |
| GitHub App alpha access denied for one attendee | Medium | Pivot them to Module 3 (Slide Deck) or Module 4 (Vibe-Code via Copilot CLI surface) — both work without the app. |
| Codespaces quota exhausted | Low (no Stage-2 module needs Codespaces under new format) | N/A for live session. Mention as risk only for take-home Module 6. |
| M365 auth blocked by tenant policy | Low (no Stage-2 module needs M365) | N/A for live session. Mention as risk only for take-home Module 5. |
| Copilot model unavailable / rate-limited | Low | Switch to a different model (GPT-4o, Sonnet) in Copilot Chat; document fallback in module handout |
| Network / WiFi flaky | Medium | Have a tethered hotspot ready; Module 4 (game) is the most network-resilient of the 3 Stage-2 paths |
| Attendee finishes Stage 2 early | High (good problem) | Encourage stretch goals; or start a second Stage-2 module |
| Attendee falls behind in Module 1 setup | High | Floater pairs with them; even if they're 10 min late to Stage 2, Stage 2 is take-home anyway |
| Module 1 runs over 25 min | High (likely on first run) | Hard-stop at T+00:30; anyone still mid-setup pairs with floater during Stage 2 |

---

## Facilitator Pre-Flight (Week Before)

- [ ] Send pre-event form with the 3 Stage-2 module summaries; collect selections.
- [ ] **Confirm GitHub App alpha access for every attendee** (workshop-blocker if denied).
- [ ] Validate prereqs checklist on a clean Win laptop and a clean Mac.
- [ ] Pre-run Module 1 + each Stage-2 module end-to-end yourself; record any "gotcha" notes.
- [ ] Draft the kickoff slide deck (out of scope for this workshop content but referenced here).
- [ ] Set up a dedicated Slack channel for the day.

## Facilitator Day-Of Pre-Flight (Morning)

- [ ] Test screen share, Wi-Fi, audio.
- [ ] Verify all linked videos and external URLs in handouts still resolve.
- [ ] Have the Seller Playbook Overview pulled up on a side monitor for quick reference.
- [ ] Pre-launch the GitHub App on the demo machine so you can drive Module 1 live in parallel.

---

## Post-Event

- 1-week follow-up: ping the team channel asking who used their artifact in a customer conversation.
- Collect anonymous feedback (5 questions max).
- Update module handouts with anything that broke or confused attendees.
- Encourage attendees to work through at least one Stage-3 (take-home) module within 30 days.
