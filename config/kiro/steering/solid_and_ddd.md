---
inclusion: manual
---

Use SOLID principles whenever possible and DDD-Tactical principles.
Use hexagonal architecture principles.

More specifically for DDD:
- Push the logic deeper into the domain
- Make sure to use Single Responsability Principle (SRP) with DDD to make short and simple blocks.
- When unsure about the ubiquitous language, asks for how to name it first.
- Prefer Value Objects over Entities
- Ensure Value Objects validate themselves upon creation (fail-fast) and have no side effects.
- Maintain Domain Purity: The domain layer must be completely decoupled from frameworks, databases, and external APIs. 
- Use interfaces/ports for infrastructure (like Repositories) and keep concrete implementations strictly in the infrastructure layer.
- Prefer one class per file and to make types in their own files
- Follow Clean Code principles such as no magic strings (prefer enums) and no magic numbers.
- Prefer dedicated Index/Collection classes over raw `Map` or `Array` for domain data structures. Encapsulate lookup, deduplication, and aggregation logic inside these classes rather than scattering it across adapters or services (e.g., `RouteEquipmentIndex` instead of `Map<string, Map<string, T>>`). This keeps call sites simple and makes the intent explicit.
