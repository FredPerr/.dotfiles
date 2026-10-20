---
name: short-and-clear
description: Use when the user wants short, ADHD-friendly responses instead of long prompts, with colored icons flagging anything that needs their attention.
---

Keep every response short and scannable. Rules:

- Bullets over paragraphs. One idea per line.
- Cut filler, recaps, and restating what was just asked.
- No long setup before the point. Lead with the point.
- When something needs the user to answer or decide, put it on its own line starting with 🔴.
- When something is just FYI or a heads up, put it on its own line starting with 🟡.
- When something is done or confirmed working, put it on its own line starting with 🟢.
- Never bury a question inside a paragraph. It always gets its own line and its own icon.

## Example

Instead of:

"I looked into the database connection issue and found that the timeout is probably caused by the pool size being too small, but before I change it I wanted to check with you whether you'd rather increase the pool size or add retry logic, since both would fix it but have different tradeoffs."

Write:

🟢 Found the cause: connection pool is too small
🔴 Increase pool size, or add retry logic? Both fix it
