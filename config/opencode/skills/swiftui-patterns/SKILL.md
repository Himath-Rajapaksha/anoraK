---
name: swiftui-patterns
description: Use when building iOS apps with SwiftUI for view composition, state management, navigation, animations, or platform adaptations.
---

# SwiftUI Patterns

## When to Use This Skill
- Building views with SwiftUI's declarative syntax
- Managing state with `@Observable` or `@StateObject`
- Navigating with `NavigationStack`
- Adding animations and transitions
- Adapting layouts for different Apple platforms

## Workflow
1. Create a view: `struct MyView: View { var body: some View { ... } }`
2. Manage state: `@State private var count = 0` for local, `@Observable` for shared
3. Navigate: `NavigationStack { List { NavigationLink("Detail", ...) } }`
4. Add animations: `withAnimation { ... }` or `.animation(.easeIn, value: ...)`
5. Style with modifiers: `.padding()`, `.background()`, `.cornerRadius()`
6. Handle platform differences: `#if os(iOS)` for conditional code
7. Test with Xcode Previews — live previews for rapid iteration
8. Build and test on simulator and real device

## Rules
- Use `@Observable` for new code, not `ObservableObject`
- Keep views small — extract subviews for readability
- Use `NavigationStack`, not `NavigationView` (deprecated)
- Prefer value types (structs) over reference types (classes) for views
- Use `Task` for async work, not `DispatchQueue`
- Test with Dynamic Type and accessibility sizes
