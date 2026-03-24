# Pressure Scenarios for Folder Structure Architecture Skill

## Purpose
These scenarios test whether an agent can design appropriate folder structures under various pressures. Run these WITHOUT the skill first to document baseline rationalizations and failures.

---

## Scenario 1: Full-Stack E-Commerce Platform (Time Pressure + Complexity)

**Context:**
You're building an e-commerce platform with the following requirements:
- Frontend: Next.js 14 with App Router, React Server Components
- Backend: Node.js with Express, PostgreSQL database
- Features: User auth, product catalog, shopping cart, checkout, order tracking, admin dashboard
- Payment integration: Stripe
- Search: Elasticsearch
- File storage: AWS S3 for product images

**Pressures:**
1. **Time pressure:** "We need to start coding today - the MVP deadline is in 3 weeks"
2. **Complexity pressure:** Multiple domains (auth, products, orders, payments, shipping)
3. **Team pressure:** 4 developers will work on this simultaneously

**Task:**
Propose a folder structure that balances quick start with long-term maintainability.

**What to watch for (baseline failures):**
- Jumping straight into code without architectural reasoning
- Choosing structure by framework defaults without considering domain boundaries
- Not explaining WHY the structure fits the requirements
- Mixing concerns (e.g., putting business logic in API routes)
- Not considering testability
- Ignoring scalability (what happens when order volume grows 10x?)

**Rationalizations to document verbatim:**
- "We can refactor later"
- "Next.js has a standard way, let's just follow that"
- "This is simple enough, we don't need over-engineering"
- "I'll add tests after the core features work"

---

## Scenario 2: Microservices Migration (Sunk Cost + Authority Pressure)

**Context:**
Your company has a monolithic Django application that's becoming unmaintainable. You're migrating to microservices. The monolith has:
- User management
- Content management
- Analytics
- Billing
- Notifications

**Pressures:**
1. **Sunk cost pressure:** "We've already invested 2 months in the monolith, can't we just improve the structure?"
2. **Authority pressure:** "The CTO wants to keep it as a monorepo for 'easier code sharing'"
3. **Migration pressure:** "We need to migrate incrementally without downtime"

**Task:**
Design a folder structure that supports gradual migration from monolith to microservices.

**What to watch for (baseline failures):**
- Agreeing to keep monolith structure due to sunk cost
- Not pushing back on poor authority decisions
- Not defining clear service boundaries
- Mixing shared libraries with service-specific code
- Not considering deployment boundaries
- Ignoring data migration implications

**Rationalizations to document verbatim:**
- "The CTO knows best, let's follow their direction"
- "We can always split it later"
- "A monorepo is fine if we organize it well"
- "Let's not overcomplicate - we can figure out services when we get there"

---

## Scenario 3: Cross-Platform Mobile App (Exhaustion + Ambiguity Pressure)

**Context:**
Building a fitness tracking app for iOS and Android. Requirements:
- Share business logic between platforms
- Platform-specific UI components
- Offline-first with sync
- Health kit integrations (Apple Health, Google Fit)
- Social features (challenges, leaderboards)
- Premium subscription tier

**Pressures:**
1. **Exhaustion pressure:** "We've been discussing architecture for 2 hours, can we just pick something?"
2. **Ambiguity pressure:** Requirements keep changing ("might add web version later")
3. **Technology pressure:** "Should we use React Native, Flutter, or Kotlin Multiplatform?"

**Task:**
Recommend a folder structure that supports code sharing while allowing platform customization.

**What to watch for (baseline failures):**
- Picking technology without understanding trade-offs
- Not separating shared vs platform-specific code clearly
- Ignoring offline-first implications for data layer
- Not considering feature flag structure for premium tier
- Mixing UI and business logic

**Rationalizations to document verbatim:**
- "React Native is most popular, so it's the safe choice"
- "We'll figure out the web version if it happens"
- "Let's just start with one platform and add the other later"
- "The folder structure doesn't matter that much - good code is good code"

---

## Scenario 4: Plugin-Based CLI Tool (Multiple Independent Subsystems)

**Context:**
Building a CLI tool for database migrations with a plugin architecture:
- Core CLI with command parsing
- Migration engine (SQL generation, execution, rollback)
- Database adapters (PostgreSQL, MySQL, SQLite, MongoDB)
- Plugin system for custom transformations
- CI/CD integration hooks
- Schema visualization

**Pressures:**
1. **Complexity pressure:** Multiple independent subsystems
2. **Extensibility pressure:** Unknown future plugin requirements
3. **Testing pressure:** Each adapter needs different test setup

**Task:**
Design a folder structure that makes the plugin system obvious and extensible.

**What to watch for (baseline failures):**
- Not defining clear plugin interface boundaries
- Mixing core functionality with plugins
- Not considering versioning for plugins
- Ignoring discovery mechanism (how do plugins register?)
- Not separating adapter interface from implementations

**Rationalizations to document verbatim:**
- "Plugins can go in a /plugins folder, simple"
- "We'll document the plugin API separately"
- "Let's build the core first and see what plugins need"
- "This is over-engineering - users will just write scripts"

---

## Scenario 5: Data Pipeline Platform (Domain-Driven Design Test)

**Context:**
Building a data pipeline orchestration platform:
- Pipeline definitions (DAGs of jobs)
- Job execution (distributed workers)
- Scheduling (cron-like, event-triggered)
- Data lineage tracking
- Monitoring and alerting
- Multi-tenant with resource quotas

**Pressures:**
1. **Domain complexity:** Heavy business logic in pipeline semantics
2. **Scale pressure:** Must handle 10,000+ concurrent jobs
3. **Multi-tenancy:** Isolation between customers

**Task:**
Apply Domain-Driven Design to create a folder structure reflecting domain boundaries.

**What to watch for (baseline failures):**
- Organizing by technical layer instead of domain
- Not identifying aggregates and bounded contexts
- Mixing orchestration logic with execution logic
- Not considering event sourcing implications
- Ignoring multi-tenancy in data access patterns

**Rationalizations to document verbatim:**
- "DDD is overkill for this"
- "Let's organize by /controllers, /services, /models - it's standard"
- "We can add domain logic later"
- "The database schema will drive the structure"

---

## Scenario 6: Real-Time Collaboration Tool (Event-Driven Architecture Test)

**Context:**
Building a real-time collaborative whiteboard:
- WebSocket server for real-time sync
- Operational transformation for conflict resolution
- Canvas rendering (frontend)
- Room management
- Asset storage (images, exports)
- Presence indicators

**Pressures:**
1. **Real-time pressure:** Event-driven architecture required
2. **State management:** Complex synchronization logic
3. **Performance pressure:** Low latency requirements

**Task:**
Design a folder structure that makes event flows and state management clear.

**What to watch for (baseline failures):**
- Not separating command/query responsibilities
- Mixing real-time and persistence logic
- Not considering event sourcing structure
- Ignoring replay/debugging implications
- Not separating client/server concerns clearly

**Rationalizations to document verbatim:**
- "Events can go in an /events folder"
- "We'll use Redux, it handles state"
- "Real-time is just WebSocket, doesn't change structure"
- "Let's optimize later if performance is an issue"

---

## Evaluation Criteria

After running each scenario WITHOUT the skill, document:

### 1. Architectural Reasoning
- [ ] Did the agent explain WHY the structure fits the requirements?
- [ ] Did it consider trade-offs between approaches?
- [ ] Did it identify domain boundaries?

### 2. Structure Quality
- [ ] Clear separation of concerns?
- [ ] Testability considered?
- [ ] Scalability addressed?
- [ ] Deployment boundaries clear?

### 3. Pressure Resistance
- [ ] Did it push back on poor constraints?
- [ ] Did it avoid "we can refactor later" traps?
- [ ] Did it maintain architectural integrity under time pressure?

### 4. Methodology Application
- [ ] Applied appropriate methodology (FSD, DDD, layered, etc.)?
- [ ] Explained why chosen methodology fits?
- [ ] Considered alternatives?

### 5. Rationalizations Captured
List verbatim quotes of rationalizations for avoiding best practices.

---

## Running Baseline Tests

For each scenario:

1. **Dispatch subagent** with scenario prompt (no skill loaded)
2. **Document choices** agent makes
3. **Capture rationalizations** verbatim
4. **Identify patterns** across scenarios
5. **Use findings** to write skill that addresses specific failures

**Example dispatch:**
```
I'm building [scenario context]. 

I need you to help me design the folder structure architecture for this project. Consider:
- What architectural methodology fits best (FSD, DDD, layered, etc.)?
- How should we organize files and folders?
- What are the trade-offs?

[Include specific pressures from scenario]
```

**After running all scenarios:**
- Compile list of recurring rationalizations
- Identify which pressures trigger violations
- Note which architectural concepts agents misunderstand
- Use this to write targeted skill content
