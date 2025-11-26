# Flutter Accessibility Agent - Copilot Instructions

## Project Overview
This is a Flutter-based Task Manager application focused on accessibility and WCAG 2.1 compliance. The application allows users to create, manage, and visualize tasks with features like task completion status, task deletion, and statistics dashboard. Built with Flutter, Material Design 3, and in-memory storage for data persistence during app session.

## Project Focus: Accessibility (WCAG 2.1 Level AA)
This project prioritizes digital inclusion and accessibility. All components must comply with WCAG 2.1 Level AA standards to ensure users with disabilities can use the application effectively.

## Code Standards

### Required Before Commit
- All tests must pass: `flutter test`
- Code must follow Dart and Flutter best practices
- Ensure proper widget structure and separation of concerns
- Verify accessibility compliance: `semanticLabel`, contrast ratios, touch targets
- Check for WCAG 2.1 Level AA violations in UI components
- Run static analyzer: `flutter analyze`

### Flutter/Dart Patterns
- Follow functional widget patterns with State/StatelessWidget
- Use proper Dart naming conventions (camelCase for variables, PascalCase for classes)
- Follow composition over inheritance principles
- Use `semanticLabel` for all interactive components and icons
- Apply proper type annotations (strongly typed code)
- Keep widgets focused on a single responsibility
- Use descriptive variable and function names
- Add JSDoc-style comments for complex functions

### Material Design & Accessibility Standards
- Use Material Design 3 components from Flutter
- Follow the established color scheme defined in `main.dart`
- Use consistent spacing: 8dp, 16dp, 24dp increments
- Ensure responsive design works across different screen sizes and orientations
- **Accessibility Critical**:
  - Minimum touch target size: 48x48 dp
  - Text contrast ratio: 4.5:1 for normal text (WCAG AA)
  - Provide `semanticLabel` for all icons and icon-only buttons
  - Use `Semantics()` widget to structure content hierarchy
  - Add tooltips to all interactive elements
  - Support TalkBack (Android) and VoiceOver (iOS)

## Development Flow

- Install dependencies: `flutter pub get`
- Start development (Android): `flutter run`
- Start development (iOS): `flutter run -d ios`
- Run tests: `flutter test`
- Run tests with coverage: `flutter test --coverage`
- Analyze code: `flutter analyze`
- Build for production (Android): `flutter build apk --release`
- Build for production (iOS): `flutter build ios --release`

## Repository Structure
- `/lib`: Main application source code
  - `/main.dart`: Application entry point and theme configuration
  - `/models/`: Data models (e.g., Task model)
  - `/services/`: Business logic and state management (e.g., TaskManager Singleton)
  - `/pages/`: Full-screen widgets representing app screens
  - `/widgets/`: Reusable UI components
- `/test`: Unit and widget tests
- Configuration files:
  - `pubspec.yaml`: Project dependencies and configuration
  - `analysis_options.yaml`: Dart analyzer configuration

## Key Guidelines

1. **Widget Architecture**:
   - Organize widgets by feature (all task-related widgets in one area)
   - Each widget should have a single responsibility
   - Use composition to build complex UIs from simple widgets
   - Keep widgets reasonably sized and focused
   - Extract reusable widgets early

2. **State Management**:
   - Use Singleton pattern for services (e.g., TaskManager)
   - Keep state management simple and centralized
   - Use `setState()` for local widget state updates
   - Document state structure and flow
   - Consider migration to Provider/Riverpod for larger apps

3. **Accessibility (WCAG 2.1 Level AA) - CRITICAL**:
   - ✅ All interactive elements must have `semanticLabel` or `tooltip`
   - ✅ Touch targets must be minimum 48x48 dp
   - ✅ Text contrast ratio must be at least 4.5:1
   - ✅ Use `Semantics()` to create proper widget hierarchy
   - ✅ Test with TalkBack (Android) and VoiceOver (iOS)
   - ✅ Provide clear error messages and field labels
   - ✅ Don't use color alone to communicate information
   - ✅ Ensure proper focus management in dialogs and forms

4. **UI/UX Standards**:
   - Use Material Design 3 components consistently
   - Follow the established color scheme from theme
   - Maintain consistent spacing and sizing
   - Provide visual feedback for all interactions (button press, loading, error)
   - Use appropriate animations sparingly for clarity
   - Ensure all text is readable (minimum 14sp font size)

5. **Testing**:
   - Write tests for all business logic (services)
   - Write widget tests for UI components
   - Test accessibility features with semantic labels
   - Test both normal and edge cases
   - Aim for >80% code coverage

6. **Documentation**:
   - Include Dart doc comments for public functions/classes
   - Document complex logic and algorithms
   - Document widget purpose and parameters
   - Document accessibility decisions in code
   - Add comments for WCAG compliance decisions

7. **Performance Considerations**:
   - Use `const` constructors when possible
   - Avoid unnecessary rebuilds with proper state management
   - Use `ListView.builder` for large lists
   - Profile performance with DevTools
   - Keep animations performant with `SingleTickerProviderStateMixin`

## Accessibility Checklist (Before Every Commit)

- [ ] All interactive elements have `semanticLabel` or `tooltip`
- [ ] Touch targets are minimum 48x48 dp
- [ ] Text contrast ratio is at least 4.5:1
- [ ] Form fields have visible labels
- [ ] Error messages are clear and actionable
- [ ] Navigation is logical and intuitive
- [ ] Color is not the only way to communicate information
- [ ] Tested with at least one screen reader
- [ ] All tests pass: `flutter test`
- [ ] No analyzer warnings: `flutter analyze`

## WCAG 2.1 Level AA Reference
- **Perceivable**: Content must be perceivable (text contrast, text size, alternatives)
- **Operable**: UI must be operable (keyboard navigation, touch targets, no traps)
- **Understandable**: Information and operations must be understandable (clear labels, instructions)
- **Robust**: Content must work with assistive technologies (semantic labels, proper structure)

See `.github/prompts/accessibilityagent.prompt.md` for detailed accessibility analysis guidelines.