# Working agreements

- Deliver changes in small functional commits. Respect the scope of the user's current request.
- Keep source code idiomatic, concise, and formatted by dart format. Use descriptive names; comments explain only non-obvious decisions.
- Group code by feature. Separate widgets, Riverpod state, domain rules, and data access where needed.
- Add abstractions for a real boundary or a second implementation. Avoid pass-through use cases and interfaces for every class.
- Prefer small widgets, expression bodies, constructor shorthand, and inferred local types. Keep public contracts typed.
- Use Riverpod for state and dependency injection. Do not add a second DI container or state management library.
- Generate repetitive model/serialization code only where it reduces maintained code. Never hand-edit generated files.
- Follow Cupertino conventions on iOS and Material conventions on Android. Keep shared business logic platform independent.
- Put user-facing text in Slovak and English ARB resources. Use flutter_svg for SVG assets.
- Add focused tests with the behavior they protect. Cover persistence, retry/idempotency, validation, and meaningful UI flows; avoid tests that mirror getters or generated code.
- Keep local demo data isolated from authenticated backend data. Enforce backend access with RLS, not UI checks alone.
- Never commit database passwords, management tokens, service-role keys, or signing credentials.
- Distribution is through GitHub artifacts/releases and Firebase App Distribution. Do not configure or publish to mobile stores.
