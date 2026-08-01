---
inclusion: always
---
# Personal Coding Style & Preferences

## Code Formatting
- Always use spaces instead of tabs (2-space indentation for TS/JS, 4 for Python).
- Prefer functional components over class components in React.
- Always use descriptive variable names rather than short abbreviations (e.g., `userRepository` instead of `userRepo`).

## General Behavior
- Keep explanations brief and concise, don't add commments unless code it is really hard to understand the intent of the code. 
- If writing code changes, always double-check for edge cases and potential security flaws before outputting.
- When there are multiple possible paths and are not sure about which one to take, ask me as I am the orchestrator/architect.

## Context Finding
- Try to find the relevant official documentation when answering or coding specific features/fixes that require expertise.

## Architecture
- Try to do scalable architecture that is decoupled enough to be scalable but also not too generic. Find the right balance.
- Try to implement Domain Driven Design principles when possible. This may be Tactical Patterns only when inside a Non-DDD project.
