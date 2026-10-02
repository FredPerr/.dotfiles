# Testing Conventions — Frontend & Backend

## Framework & Tools

- **Vitest** for all unit tests in both frontend and backend
- **React Testing Library** (`@testing-library/react`) for component tests in the frontend
- No snapshot testing unless there is a compelling, explicit use case (e.g., serialized AST output)

## File Naming & Location

- Test files are **co-located** next to the file being tested
- File name matches the source: `Button.test.tsx`, `capitalize.test.ts`, `CreateProject.test.ts`
- Type-level tests use the suffix `.test-d.ts` (e.g., `ProjectStatus.test-d.ts`)

## Structure & Style (BDD)

- Use **Given / When / Then** reasoning to structure each test case
- Use **Arrange / Act / Assert** sections within the test body
- Group tests with `describe` matching the function, hook, or component name
- Use `it` (not `test`) for individual cases — phrased as behavior: `it('returns an error when the name is empty')`
- Always **explicitly import** vitest globals at the top of the file:
  ```ts
  import { describe, it, expect, vi, beforeEach } from 'vitest';
  ```

## What to Test

- **Test behavior, not implementation** — assert on outputs, side effects, and rendered content, not on internal state or method calls
- **Test what should happen**, not what should not happen — avoid writing tests for impossible states or irrelevant negative cases
- **Keep tests small and focused** — a single `it` block should verify one behavior, ideally in a few lines
- **Don't test external dependencies** — don't test AWS SDK, axios internals, or third-party libraries we don't control. Test our code's behavior around them.
- **Backend**: don't unit-test raw entity definitions or repository DynamoDB calls for now (they will be managed by dynamodb-toolbox). Test use cases and domain logic.

## Test Data & Setup

- Create **builder/factory utility functions** at the top of the test file (or in a shared `test-utils/`) to generate test data:
  ```ts
  function buildProject(overrides?: Partial<Project>): Project {
    return {
      id: 'project-1',
      name: 'Test Project',
      status: 'active',
      ...overrides,
    };
  }
  ```
- Use `beforeEach` / `beforeAll` to set up shared state and prevent duplication across `it` blocks
- A test body should be short — if it's more than ~10 lines, the setup likely belongs in a helper or `beforeEach`

## Clean Code in Tests

- **No magic numbers or magic strings** — extract literal values into named constants or builder defaults so tests read as intent, not arbitrary data
- Use descriptive constant names that convey the test scenario:
  ```ts
  const VALID_PROJECT_NAME = 'My Project';
  const EMPTY_NAME = '';
  const DEFAULT_USER_ID = 'user-1';
  ```
- When a literal is repeated across multiple `it` blocks, hoist it to a `describe`-level constant
- Exception: single-use literals that are self-explanatory in context (e.g., `expect(result.data).toHaveLength(2)` when the mock returns exactly 2 items) are acceptable
- **No type casting (`as`) in test files** — if the test needs access to a type or value that isn't exported, export it from the source file rather than casting. Tests should use the same public API as production code.

## Mocking

- Mock **sparingly** — only mock what is necessary to isolate the unit under test
- Never mock so much that you're testing mocks instead of real behavior
- Mock boundaries: external APIs, infrastructure adapters (repositories, HTTP clients)
- Don't mock: domain logic, pure functions, value objects — test those directly
- Use `vi.fn()` and `vi.mock()` from vitest

## Example (Backend Use Case)

```ts
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { CreateProject } from '@application/projects/CreateProject';

describe('CreateProject', () => {
  const projectRepository = { save: vi.fn() };
  const auditLogger = { log: vi.fn() };
  let useCase: CreateProject;

  beforeEach(() => {
    vi.clearAllMocks();
    useCase = new CreateProject(projectRepository, auditLogger);
  });

  it('creates a project with the given name', async () => {
    const result = await useCase.execute({ name: 'My Project', userId: 'user-1' });

    expect(result.isOk()).toBe(true);
    expect(result._unsafeUnwrap().name).toBe('My Project');
    expect(projectRepository.save).toHaveBeenCalledOnce();
  });

  it('returns an error when the name is empty', async () => {
    const result = await useCase.execute({ name: '', userId: 'user-1' });

    expect(result.isErr()).toBe(true);
    expect(result._unsafeUnwrapErr().code).toBe('INVALID_PROJECT_NAME');
  });
});
```

## Example (Frontend Component)

```tsx
import { describe, it, expect } from 'vitest';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { ProjectCard } from './ProjectCard';

describe('ProjectCard', () => {
  function buildProps(overrides?: Partial<ProjectCardProps>): ProjectCardProps {
    return {
      project: { projectId: '1', name: 'Demo', status: 'active' },
      onArchive: vi.fn(),
      ...overrides,
    };
  }

  it('displays the project name', () => {
    render(<ProjectCard {...buildProps()} />);

    expect(screen.getByText('Demo')).toBeInTheDocument();
  });

  it('calls onArchive when the archive button is clicked', async () => {
    const props = buildProps();
    render(<ProjectCard {...props} />);

    await userEvent.click(screen.getByRole('button', { name: /archive/i }));

    expect(props.onArchive).toHaveBeenCalledWith('1');
  });
});
```

## Example (Frontend Hook)

```ts
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { renderHook, waitFor } from '@testing-library/react';
import { UseProjects } from './UseProjects';
import { createQueryWrapper } from '@/test-utils/QueryWrapper';

describe('UseProjects', () => {
  it('returns the list of projects', async () => {
    const { result } = renderHook(() => UseProjects(), { wrapper: createQueryWrapper() });

    await waitFor(() => expect(result.current.isSuccess).toBe(true));

    expect(result.current.data).toHaveLength(2);
  });
});
```
