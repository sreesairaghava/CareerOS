# CareerOS – AI Development Context

## Project Overview

CareerOS is a long-term production-quality iOS application being built using SwiftUI and modern Apple frameworks. This is **not** a tutorial project or a throwaway learning app. The goal is to build an application that can eventually be released on the App Store.

The project is being developed incrementally as feature slices while maintaining production-level architecture from the beginning.

The implementation should optimize for:

* Maintainability
* Scalability
* Testability
* Clear architectural boundaries
* Domain-driven thinking
* Modern SwiftUI APIs
* Long-term evolution

Avoid shortcuts that introduce technical debt.

---

# Technology Stack

* SwiftUI
* Swift 6
* SwiftData
* NavigationStack
* Swift Concurrency where appropriate
* iOS 18+

No UIKit unless absolutely necessary.

---

# Architectural Principles

The project follows a feature-first architecture.

```
CareerOS
│
├── App
├── Core
├── Features
└── Resources
```

Each feature contains:

```
Feature
│
├── Domain
├── Data
└── Presentation
```

---

# Architectural Rules

## Domain

Domain models represent business concepts.

They must not depend on:

* SwiftUI
* SwiftData
* Persistence
* UI

Example:

```
Company
CompanyNote
```

---

## Persistence

SwiftData models represent storage.

They must not leak into the Presentation layer.

Example:

```
CompanyEntity
CompanyNoteEntity
```

---

## Mapping

Domain and persistence are intentionally separated.

```
Company
        ↕
CompanyMapper
        ↕
CompanyEntity
```

The rest of the application should work with Domain models.

---

## Repository

Views communicate with repositories.

Views should not directly manipulate SwiftData models.

```
View
    ↓
Repository Protocol
    ↓
Repository Implementation
    ↓
SwiftData
```

---

## Dependency Composition

Dependencies are composed at the application level.

Current implementation includes:

* AppDependencies
* CompanyRepositoryFactory
* AppDependencyContainer
* EnvironmentKey

Views consume dependencies instead of constructing implementations.

Avoid:

```
SwiftDataCompanyRepository(...)
```

inside presentation code.

---

# Product Vision

CareerOS is a personal operating system for managing a software engineer's career.

It is **not** simply an interview tracker.

Future modules include:

* Companies
* Applications
* Interviews
* Professional People
* Events
* Interactions
* Preparation
* Analytics

---

# Domain Model

Current core entities:

```
Company
CompanyNote
```

Future entities:

```
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

# Important Domain Decisions

## Company is a first-class entity

Applications should not store:

```
companyName: String
```

Instead they should reference Company.

---

## Company Notes

Notes are separate entities.

Do not store notes directly on Company as a String.

Reason:

Notes will eventually support:

* categories
* timestamps
* relationships
* future tagging

---

## Interview Ownership

Interview cannot exist independently.

```
Application
    owns
        Interviews
```

---

## Professional Relationships

Eventually:

```
Person
    ├── Interactions
    ├── Notes
    └── Companies
```

This will support networking history.

---

# Current Implementation Status

Implemented:

* Project structure
* RootView
* Dashboard
* Companies tab
* Domain models
* CompanyFactory
* SwiftData entities
* Mapper
* Repository
* Dependency container

The Company feature is partially implemented.

Current goal is to finish the first production-ready vertical slice.

---

# Current Feature Target

Complete Companies.

Required functionality:

1. Create Company
2. List Companies
3. Company Detail
4. Delete Company
5. Search Companies

All persisted using SwiftData.

---

# Development Philosophy

Do not generate large amounts of code at once.

Build vertically.

Every feature should be:

```
UI
↓
Domain
↓
Repository
↓
Persistence
```

and remain functional before moving to the next feature.

---

# Coding Guidelines

* Prefer type-safe enums over string literals.
* Avoid magic numbers and hardcoded values.
* Keep business logic outside SwiftUI views.
* Use expressive types.
* Keep responsibilities focused.
* Favor composition over large monolithic classes.

Do not introduce abstractions without a clear need, but once introduced, use them consistently.

---

# AI Guidance

When proposing changes:

* Preserve existing architecture.
* Do not collapse Domain and Persistence models.
* Do not bypass repositories.
* Do not move SwiftData logic into Views.
* Do not replace dependency composition with direct object creation.
* Explain architectural decisions before implementing them.
* Prefer incremental pull-request-sized changes over large rewrites.

Assume this project will continue for months and eventually be shipped to the App Store.

---

# Immediate Next Task

Finish the Companies feature using the existing architecture.

Specifically:

* Complete CreateCompanyView.
* Wire repository through the existing dependency container.
* Display Companies in CompaniesView.
* Persist companies using SwiftData.
* Navigate to Company Detail.
* Support delete.
* Add search.

Do not refactor the existing architecture unless a clear design issue is identified and explained first.

