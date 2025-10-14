# Python Producer–Consumer Exercise

This workspace is an exercise in using GitHub Copilot to iteratively evolve a simple producer–consumer example. Follow the ladder: copy a prompt, paste into Copilot Chat, review, refine, accept, run tests, then proceed. Keep diffs small. Update the spec (docs/specs.md) as behavior changes.

Include the specs.md in your Copilot context to help it understand requirements.

## Mantra
Understand first, ask early, change small, keep it safe, test every step.

### What "Diff only" Means
Diff only: Ask the assistant to return just the minimal unified patch (the added/removed lines) for the change—no full file listings, no extra commentary. This keeps each step small, reviewable, and easy to apply or revert, reinforcing incremental development and clean commit history.


## Prompt Ladder 

Assume `docs/specs.md` (Minimal Lab Spec) is always provided to Copilot. Prompts focus on intent + output format, not repeating details.

1. Audit
"Review current app against the Minimal Lab Spec. Summarize each file and list gaps (missing functions, tests, validations). No code."

2. Plan & Structure
"Propose any file additions/renames needed to satisfy the spec (producer, consumer, runner, logging, config, tests). No code; brief rationale." 

3. Scaffolding
"Create/adjust skeletal modules per plan (classes, docstrings, pass). Provide unified diff only; no logic yet."

4. Producer
"Implement Producer per spec (generation, sentinel, validation). Add main guard. Diff only."

5. Consumer
"Implement Consumer per spec (loop until sentinel, count items, summary log). Diff only."

6. Logging
"Add logging utility (one-time config) and integrate into producer & consumer. Diff only."

7. Runner
"Implement run module (queue maxsize=10, start & join threads, env overrides). Diff only."

8. Config Helpers
"Add env parsing helpers (int/float non-negative) and wire into runner. Tests to follow. Diff only."

9. Tests – Producer
"Add producer tests (normal, count=0, validation). Diff only."

10. Tests – Consumer
"Add consumer tests (processed count, sentinel, validation). Diff only."

11. Tests – Config
"Add tests for env helpers (valid, invalid). Diff only."

12. Integration Test
"Add end-to-end test ensuring produced == consumed and queue empty. Diff only."

13. Docs Sync
"Update spec if implementation deviated (changed return types, etc.). Provide modified sections only."

14. Refactor
"Suggest minimal beneficial refactors (shared validation, type hints). Await 'OK', then apply diffs only."

15. Extensions
"List 2–3 feasible extensions (async, multiple consumers, metrics) with effort notes. No code."

16. Async (Optional)
"Outline async variant plan (modules + approach). No code. If approved, implement in diff."

17. Final Verification
"Map code to each essential requirement; note any gaps or technical debt."

## Quick Usage Prompt
When you need setup/run steps, ask Copilot:  
"Give me commands to create a venv, install deps, run the threaded demo, and run tests for this project."

