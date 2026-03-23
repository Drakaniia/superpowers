---
name: dashboard-design
description: Use when designing dashboard UIs, admin panels, or data-dense interfaces that need to feel clean and usable
---

# Dashboard Design

## Overview

Dashboards fail not because they're ugly, but because they're disorganized and messy. This skill provides a systematic approach to designing dashboards that feel effortless to use by reducing cognitive load and following strict visual hierarchy.

**Core principle:** Do one thing well. If your dashboard looks like it requires a PhD to operate, it's too complex.

## When to Use

Use when designing:
- Admin panels, analytics dashboards, project management interfaces
- Data-dense interfaces with multiple metrics and actions
- SaaS application homepages with navigation and content management

**Do NOT use for:** Landing pages, marketing sites, content-heavy blogs (different patterns apply)

## Core Components

All dashboards comprise **four main components**. Master these and you can build any dashboard page:

### 1. Lists and Tables
Most common. Used for displaying collections (links, projects, users).

**Separation methods (choose one):**
| Method | When to use |
|--------|-------------|
| Space only | Minimal, clean look (Linear-style) |
| Lines/dividers | Traditional, clear separation |
| Color/background | Distinct groups or states |

**Table functionality (what makes it interactive):**
- Search, filter, sort capabilities
- Bulk actions (reveal contextual button when multiple items selected)
- Empty states (design these early—what shows when there's no data?)

### 2. Cards
Includes charts, stat blocks, toast notifications.

**Styling rule:**
- **Light mode:** Use background colors for card distinction
- **Dark mode:** Use borders/outlines

**Spacing:** Keep margins well-spaced so content isn't tightly packed.

### 3. User Input
Forms, modals, popovers for data entry.

### 4. Tabs
Add new pages without cluttering sidebar. Use for different views of related data (like Notion settings).

## Layout Structure

### Sidebar (The Spine)

The sidebar houses persistent, globally relevant elements. Think of it as the spine of your product.

```
┌─────────────────────┐
│  [Logo/Profile]     │  ← Top: Profile management (clickable with avatar)
├─────────────────────┤
│  → Links            │  ← Navigation grouped by relevance
│    Analytics        │     - Start with recognizable icon + short title
│    Projects         │     - Makes sidebar collapsible easier
│                     │     - Add notification badges or "New" chips
│  ─────────────────  │  ← Divider
│                     │
│    Settings         │  ← Bottom: Rarely used items
│    Help Center      │
│                     │
│  ┌─────────────────┐│  ← Optional: Notifications in empty space
│  │ 📊 3 new clicks ││     (like Linear, Dub)
│  └─────────────────┘│
└─────────────────────┘
```

**Key decisions:**
- **Profile at top** with avatar—makes it identifiable and clickable
- **Group navigation** by relevance to reduce cognitive load
- **Settings/help at bottom**—rarely used, so they don't compete
- **Active state indicator**—highlight current section (rectangle background or left border)
- **Nested dropdowns**—use when link count expands

### Top Bar

Reserved for important page actions or simple navigation.

```
[Dropdown/Filter]  [Primary Action Button]              [Search] [Notifications] [Profile]
```

**Example for link dashboard:**
- Left: Dropdown (filter by domain/tags) + "Create Link" button
- Right: Search, notifications, profile (if not in sidebar)

### Main Content Area (The Dashboard)

**CRITICAL:** What you put here reflects what's MOST important to the user.

| Dashboard type | Show at top |
|----------------|-------------|
| Project management | Project status, active tasks |
| Financial | Investments, portfolio value |
| Link tracking | Link management table, recent links |
| Analytics | Key metrics, trend charts |

**Grid structure:**
Dashboards follow **stricter grids** than landing pages because you're using most/all screen space.

**Recommended:** Two-column, two-row grid
```
┌─────────────────────────────────────────────────────────────┐
│  [Top Bar: Actions/Filters]                                 │
├─────────────────────────────────────────────────────────────┤
│  ┌───────────────────────────────────────────────────────┐  │
│  │  Primary Content (65-70%) │ Secondary Content (30-35%)│  │
│  │  (e.g., Links Table)      │ (e.g., Click Trend Chart) │  │
│  │                           │                           │  │
│  │  - Most important data    │  - Context/summary        │  │
│  │  - Where users act        │  - Visual pattern check   │  │
│  └───────────────────────────┴───────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Typography and Spacing

**Dashboard vs Landing Page:**

| Element | Landing Page | Dashboard |
|---------|--------------|-----------|
| Font sizes | Large, varied scale | Small, tight scale |
| Spacing | Generous, dramatic | Compact, consistent |
| Grid | Flexible | Strict adherence |

**Dashboard typography:**
- Use smaller font sizes than you think
- Keep size scale tight (e.g., 12px, 14px, 16px, 18px—not 12px to 48px)
- No more than 3 font sizes per view

## Interactive Elements

### Modal vs Popover vs New Page

| Pattern | When to use | Examples |
|---------|-------------|----------|
| **Popover** | Simple context, non-blocking, click away without consequences | Display settings, quick actions, copy/share menu |
| **Modal** | Complex context, blocking (must confirm/cancel), related to current view | Create new item, edit form, confirmation dialogs |
| **New Page** | Permanent context, very large content, drilling into detail | Viewing full item details, comprehensive settings |

**Modal best practices:**
- Blocking: User must click create/cancel before doing other things
- Show toast notification on success (confirming changes)
- Related to content on screen (don't modal something unrelated)

**New page requirements:**
- **Must have:** Back button or breadcrumb navigation
- Use when context is permanent or content is extensive

### Toast Notifications

The notification system of your dashboard.

**Use for:**
- Success confirmation (item created, saved, deleted)
- Warnings or error states (frequently missed—design these!)
- Any awareness without full-screen takeover

**Design:**
- Auto-dismiss after 3-5 seconds
- Provide undo option for destructive actions

## Charts Done Right

**Don't:**
- ❌ Weird 3D charts, donut charts with unclear meaning
- ❌ Charts without labels or grid lines

**Do:**
- ✅ Basic line graphs for trends over time
- ✅ Bar charts for comparison (by item, by category)
- ✅ Grid lines and numbers (everyone forgets these!)
- ✅ Summary and date range selector
- ✅ Clear legends and labels

**Example structure:**
```
┌─────────────────────────────────────────┐
│  Click Trends          [Last 7 days ▼] │
├─────────────────────────────────────────┤
│     │                   ●               │
│  500│             ●       ●           ● │
│     │         ●                       │ │
│    0└─────────────────────────────────┘ │
│     Mon  Tue  Wed  Thu  Fri  Sat  Sun   │
└─────────────────────────────────────────┘
```

## Animation and Interaction

**Principle:** Tame and user-focused (not showy like landing pages).

**Good dashboard animations:**
- Hover states on charts (show exact value, dim other bars)
- Smooth transitions on expand/collapse
- Optimistic UI updates (see below)

**Optimistic UI (critical for "snappy, fast" feel):**
- When user deletes/acts, update UI **instantly**
- Assume server request will succeed
- User doesn't see awkward pause waiting for confirmation
- Example: Gmail delete—email disappears immediately

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Dashboard looks like drawer emptied on screen | Reduce to one primary purpose. Move secondary to dedicated pages. |
| No empty states designed | Design empty state before populating with fake data |
| Charts without grid lines or labels | Always add both—users need reference points |
| Too many stat cards at top | Show only what's MOST important. 3-4 max. |
| Inline buttons for every action | Use popover (three-dot menu) for secondary actions |
| No bulk action pattern | Add multi-select → reveal contextual bulk actions button |
| Modals for simple actions | Use popover for non-blocking simple context |
| No back button on detail pages | Always provide back navigation or breadcrumbs |
| Heavy shadows on dark mode | Use borders/outlines instead of backgrounds |
| Pausable/slow feel | Implement optimistic UI updates |

## Quick Reference

**Dashboard design checklist:**
- [ ] Sidebar: Profile top, navigation grouped, settings bottom
- [ ] Top bar: Primary actions or filters
- [ ] Main content: Most important user data at top
- [ ] Grid: Strict adherence, 2-column layout
- [ ] Typography: Small, tight scale (3 sizes max)
- [ ] Tables: Search, filter, sort, bulk actions, empty state
- [ ] Charts: Basic types, grid lines, labels, date selector
- [ ] Modals: For complex, blocking actions
- [ ] Popovers: For simple, non-blocking actions
- [ ] Toasts: Success, error, warning notifications
- [ ] Navigation: Back button/breadcrumb on detail pages
- [ ] Performance: Optimistic UI for instant feedback

## Real-World Examples

**Study these for patterns:**
- **Linear:** Minimal sidebar, notification integration, clean tables
- **GitHub:** Activity previews, dense but scannable tables
- **Vercel:** Typography hierarchy, dark mode with borders
- **Dub:** Sidebar notifications, link management patterns
- **Notion:** Tabs for views, settings organization

## The Bottom Line

A great dashboard:
1. **Does one thing well**—clear primary purpose
2. **Shows what matters most** at the top
3. **Uses strict grids** and small, consistent typography
4. **Provides all four components** appropriately (lists, cards, inputs, tabs)
5. **Feels fast** through optimistic UI
6. **Handles edge cases** (empty states, errors, bulk actions)

If you follow these principles, your dashboard will feel effortless—not like it requires a PhD to operate.
