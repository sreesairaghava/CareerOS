# AI-Assisted Development Preferences

This file captures project and teaching preferences that should guide future AI-assisted recommendations for CareerOS.

## SwiftUI State Management

- Prefer an explicit view state model when a screen has loading, loaded, empty, or error states.
- Avoid loose optional error flags such as `errorMessage = nil` as the main state management pattern.
- Keep state readable for teaching, especially during screenshare sessions with Shreyas.

## Teaching Workflow

- Provide changes step by step.
- Do not directly implement code changes unless explicitly asked.
- Explain why each change exists before moving to the next step.
- Wait for manual validation before continuing to the next implementation step.
