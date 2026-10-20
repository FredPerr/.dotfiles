---
name: ask-them
description: Use when the user says "ask them" in reply to a question they can't answer themselves. Rewrites the last unanswered question(s) as a plain bullet list to send to a colleague or client.
---

Take the question(s) you just asked that the user can't answer themselves (the answer belongs to a colleague or client).

Ask the user: French or English if the user does not already specify it.

Then output ONLY a bullet list, nothing else. Rules:

- Plain writing, no jargon, no special characters.
- Write for a non-technical reader: a colleague or client.
- One bullet per question.
- Simple question: one plain sentence.
- Question needs background: three lines, CONTEXTE/CONTEXT, PROBLEME/ISSUE, QUESTION.
- Do not answer the questions, do not add recommendations, nothing before or after the list.

## Example

Agent asked: "Should we cache the pricing data for 5 minutes or 1 hour? Also, is the client okay with showing slightly outdated stock counts?"

User says: "ask them"

Agent asks: "French or English?"

User says: "English"

Output:

- How often does pricing information change
- Is it acceptable for customers to see stock counts that are a few minutes out of date
