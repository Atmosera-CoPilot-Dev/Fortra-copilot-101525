## Minimal Lab Spec

Purpose: Practice incremental AI-assisted development of a simple Producer–Consumer pattern.

Core Components:
- producer.py: Producer(count, delay). produce() enqueues items then SENTINEL.
- consumer.py: Consumer(delay). consume() processes until SENTINEL, returns items processed.
- run.py: Starts one producer + one consumer thread with Queue(maxsize=10).
- logging_utils.py: get_logger() configuring basic INFO logging (DEBUG optional for per-item).
- __init__.py: exports SENTINEL (unique object) and optional __version__.
- config helpers (optional): get_env_int / get_env_float for PRODUCER_COUNT, PRODUCER_DELAY, CONSUMER_DELAY.

Work Item Shape:
{ 'id': int (0..N-1), 'created_at': ISO8601 UTC string }

Sentinel:
Single unique object placed after last real item.

Essential Functional Requirements:
1. Produce N items (default 20) with contiguous ids starting at 0.
2. Enqueue SENTINEL exactly once after items (if N=0, only sentinel).
3. Consumer processes FIFO until SENTINEL, then stops; returns count of processed real items.
4. Negative count or delay raises ValueError.
5. Delays default (producer 0.05s, consumer 0.02s) but may be overridden via env vars when using runner.
6. Runner joins both threads; queue empty and sentinel consumed exactly once at end.
7. Logging shows lifecycle (start, sentinel, summary). Per-item at DEBUG only.
8. Tests cover: normal production, count=0 edge, validation errors, env parsing, end-to-end run.

Non-Functional (Minimal):
- Deterministic tests (use delay=0 in tests).
- Python >= 3.10. Only stdlib + pytest.
- Clear, small modules; no unnecessary abstractions.

Interfaces (Concise):
class Producer(queue, count=20, delay=0.05): produce() -> int | None
class Consumer(queue, delay=0.02): consume() -> int
run.run() -> None
get_env_int(name, default) -> int  (ValueError on bad/negative)
get_env_float(name, default) -> float (ValueError on bad/negative)
get_logger(name) -> Logger

Testing Checklist:
- Producer with count=5 yields 5 items + sentinel.
- Producer with count=0 yields only sentinel.
- Consumer counts items correctly.
- Validation: negative count/delay & bad env values raise ValueError.
- Integration: run threads; post-run queue empty, processed == produced.

Extensions (Optional Ideas): multiple consumers, asyncio variant, metrics.

Status: v1-minimal. Expand only if a prompt explicitly requires more detail.