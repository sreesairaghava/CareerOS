# CareerOS Architecture

## Overview

CareerOS is a production-quality SwiftUI application built using modern Apple frameworks and Clean Architecture principles.

The architecture emphasizes:

* Clear separation of concerns
* Feature isolation
* Domain-driven design
* Testability
* Incremental development
* Long-term maintainability

The project is intentionally designed to scale over time rather than optimize for rapid prototyping.

---

# High-Level Architecture

```text
CareerOS
│
├── App
│
├── Core
│
├── Features
│
└── Resources
```

---

# App Layer

Responsible for application composition.

Responsibilities:

* App entry point
* Dependency composition
* Environment setup
* Global navigation
* Application lifecycle

Current components:

* CareerOSApp
* RootView
* AppDependencies
* AppDependencyContainer
* EnvironmentKey

The App layer creates dependencies.

Features consume them.

---

# Core Layer

Contains reusable infrastructure shared across features.

Examples:

* Design System
* Navigation
* Persistence helpers
* Shared constants
* Utility extensions

Core must never contain feature-specific business logic.

---

# Feature Architecture

Every feature follows the same structure.

```text
Feature
│
├── Domain
├── Data
└── Presentation
```

Each feature should be independently understandable.

---

# Domain Layer

Represents business concepts.

Characteristics:

* Independent of SwiftUI
* Independent of SwiftData
* Independent of networking
* Pure business models

Example:

```text
Company
Application
Interview
Person
```

The Domain layer should describe how the business thinks.

---

# Data Layer

Responsible for persistence.

Contains:

* SwiftData entities
* Repository implementations
* Mappers
* Local persistence

The Data layer knows how information is stored.

It should not contain UI logic.

---

# Presentation Layer

Contains:

* SwiftUI Views
* View-specific state
* Navigation
* User interactions

Presentation communicates through repository abstractions rather than persistence implementations.

---

# Dependency Composition

Dependencies are created once by the application.

Features receive dependencies instead of constructing them.

Current composition:

```text
CareerOSApp
        ↓
AppDependencies
        ↓
Repository Factories
        ↓
Features
```

Avoid constructing repository implementations directly inside presentation code.

---

# Repository Pattern

Repositories expose business operations.

Example:

```text
CompanyRepository
```

Presentation should not know:

* SwiftData
* SQLite
* Persistence details

The repository hides storage implementation.

---

# Mapping

Domain models and persistence models are intentionally separated.

```text
Domain Model
        ↓
Mapper
        ↓
Persistence Model
```

Benefits:

* Business logic remains persistence-independent.
* Storage can evolve without affecting UI.
* Easier future migrations.

---

# Current Domain Model

Current implemented entities:

```text
Company
CompanyNote
```

Planned entities:

```text
Application
Interview
Person
Interaction
Event
Question
StudyTopic
Weakness
```

---

# Aggregate Ownership

Current decisions:

```text
Company
    owns
        CompanyNotes
```

Future:

```text
Application
    owns
        Interviews
```

Interviews should never exist independently.

---

# Design Principles

* Prefer explicit types over primitive values.
* Prefer enums over raw strings.
* Avoid magic numbers.
* Avoid duplicated business rules.
* Build feature slices vertically.
* Introduce abstractions only when they solve a real problem.
* Keep architecture consistent once a pattern is adopted.

---

# Future Architecture

Potential additions:

* Cloud synchronization
* Background sync
* AI services
* Analytics
* Contact import
* Widgets
* App Intents
* Spotlight indexing

The existing architecture should support these without major restructuring.

