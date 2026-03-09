# MovieApp

A SwiftUI iOS app for searching movies using the [OMDB API](https://www.omdbapi.com/).

## Features

- Search movies by title with keyboard submit
- Paginated results with infinite scroll
- Movie detail view with full metadata
- Async image loading for posters

## Architecture

Clean Architecture with the following layers:

```
Views → ViewModels → UseCases → Repositories (Protocols) → Implementations → ApiClient
```

- **Views** — SwiftUI, `SearchView`, `MovieDetailView`
- **ViewModels** — `ObservableObject`, state machine via `enum State`
- **UseCases** — `SearchMoviesUseCase`, `FetchMovieDetailsByIdUseCase`
- **Repositories** — `MovieSearchProtocol`, `MovieDetailsProtocol`
- **Networking** — `ApiClientImplementation` wrapping `URLSession`

## Dependency Injection

Uses [Swinject](https://github.com/Swinject/Swinject) via a custom `@Inject` property wrapper. All dependencies are registered in `AppAssembler` at app launch against protocol types, making ViewModels fully testable.

## Unit Tests

| Test file | What it covers |
|---|---|
| `ApiClientTests` | Status code handling (200, 401, 404, 500) via `MockURLProtocol` |
| `MovieSearchImplementationTests` | Repository success/failure using `MockApiClient` |
| `MovieDetailsImplementationTests` | Repository success/failure using `MockApiClient` |
| `SearchViewModelTests` | State transitions, pagination |
| `MovieDetailViewModelTests` | State transitions |

Mocks conform to use case protocols directly — no subclassing. `stubbedData` is encoded to `Data` and decoded back through `JSONDecoder` to match the real code path exactly.

## Requirements

- iOS 17+
- Xcode 16+
- OMDB API key (set in `GetMovieUrlBuilder`)

## Dependencies

- [Swinject](https://github.com/Swinject/Swinject) — dependency injection
- [swift-confidential](https://github.com/securevale/swift-confidential) — compile-time obfuscation of the OMDB API key
- [swift-confidential-plugin](https://github.com/securevale/swift-confidential-plugin) — Swift Package Manager build plugin that generates the obfuscated secret at build time

## API Key Setup

The OMDB API key is stored using `swift-confidential` rather than hardcoded in source. The key is defined in a `.confidential` configuration file and the plugin generates the obfuscated access code at build time. Never commit your raw API key to source control.
