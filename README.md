# E-Commerce App (Flutter)

A full-featured **e-commerce client** built with Flutter. It connects to the public [Route E-Commerce API](https://ecommerce.routemisr.com/) so users can browse catalogs, view product details, sign in, and manage a shopping cart—similar to what you would expect from a real store app, but focused on learning and applying **production-style mobile architecture**.

[![Flutter](https://img.shields.io/badge/Flutter-3.7+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7+-0175C2?logo=dart&logoColor=white)](https://dart.dev)

**Active branch:** [`Develop`](https://github.com/mariamamgad18/e_commerce/tree/Develop)

---
# ScreenShot 

<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/fcd76671-7ec1-46a0-8753-ece73a4389f2" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/dc99c64a-88ba-4ef6-8f03-e47f7755c4d1" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/29a8b87c-c06e-44ca-b5f6-ced68381eb27" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/b4d997f6-9040-4d1d-bd40-29e3c3af3d39" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/fd718c30-1c6d-4432-bca5-5c0ea9ae2bdc" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/a3f47c85-9c2c-4ed0-ab7d-fb006c88b8ec" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/d13b6a1f-997a-4a7f-8535-637d3f9ec728" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/e86803f8-6a5b-48fb-a6a7-b63140d7c59a" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/a250ca02-1de3-4b96-b69f-10f95160178b" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/4be2b77e-0ec6-46ff-921e-e79d06b9db19" />
<img width="738" height="1600" alt="image" src="https://github.com/user-attachments/assets/b8a23055-df15-4086-b77d-b5167caad2f4" />









## Table of contents

- [The idea](#the-idea)
- [What the app does](#what-the-app-does)
- [Tech stack and why](#tech-stack-and-why)
- [Architecture](#architecture)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Code generation](#code-generation)
- [Author](#author)

---

## The idea

This project is a **learning-oriented but structurally serious** e-commerce application. The goal is not only to call REST endpoints, but to organize the codebase the way teams do on larger apps: clear boundaries between UI, business rules, and data, testable use cases, and a networking layer that stays maintainable as endpoints grow.

The backend is **Route’s hosted e-commerce API**—a common choice in Flutter training because it provides auth, products, categories, brands, and cart operations without running your own server. The app treats that API as the single source of truth for catalog and cart data, while **authentication state** (the user token) is persisted on the device so returning users skip login when possible.

On launch, the app reads a stored **token** from local storage. If it exists, the user lands on the **home** experience; otherwise they are routed to **login**. Cart actions require that token and send it in request headers, matching how the API secures user-specific resources.

---

## What the app does

| Area | Behavior |
|------|----------|
| **Authentication** | Sign up and sign in; persist the API token for subsequent requests |
| **Home** | Promotional carousel, categories, brands, and featured products |
| **Products** | Product listing and a details screen (images, description, pricing) |
| **Cart** | Add items, list cart contents, update quantity, remove items |
| **Navigation** | Bottom bar: Home, Products, Favorites, Profile |
| **UX** | Responsive layout (`ScreenUtil`), Poppins typography, cached remote images, expandable descriptions |

> **Favorites** tab is currently a placeholder screen—structure is in place for a future wishlist feature.

---

## Tech stack and why

### Flutter & Dart

**What:** UI and app logic on Android, iOS, Web, and desktop from one codebase (Dart SDK ^3.7.2).

**Why:** Flutter gives fast iteration, a rich widget model for custom e-commerce UI, and one project to showcase on GitHub without maintaining separate native apps.

---

### Clean Architecture (layers)

**What:** Code is split into **Features/UI**, **Domain**, **Data**, **api**, and **Core**.

**Why:**

- **Domain** holds entities, repository *contracts*, and **use cases** (e.g. `LoginUseCase`, `GetCartUseCase`). UI does not talk to Dio directly; it goes through use cases so business rules stay in one place.
- **Data** implements repositories and coordinates remote data sources—easy to swap or mock the API later.
- **api** owns **DTOs**, **Retrofit** service definitions, and **mappers** that convert API models into domain entities. That keeps JSON shape changes isolated from the rest of the app.
- **Core** shared utilities: colors, routes, validators, errors, and **SharedPreferences** wrapper.

This separation makes the project easier to extend (e.g. add offline cache or a new feature folder) without turning `main.dart` into a god file.

---

### BLoC / Cubit (`flutter_bloc`)

**What:** Each major screen or flow has a Cubit/ViewModel and explicit states (loading, success, error).

**Why:** E-commerce flows are async-heavy (network, cart updates). BLoC gives a predictable **event → state** flow, keeps widgets mostly declarative, and works well with `BlocProvider` at route level (e.g. cart screen). A custom **`BlocObserver`** logs lifecycle and errors during development.

---

### Dio + Retrofit

**What:** HTTP client (Dio) with a type-safe API interface (`ApiServices`) generated by Retrofit.

**Why:** Raw string URLs and manual JSON parsing do not scale. Retrofit centralizes endpoints in `api_endpoint.dart` and `api_services.dart`, reduces typos, and pairs with **json_serializable** for request/response models. **pretty_dio_logger** helps debug requests in dev.

---

### GetIt + Injectable

**What:** Service locator with compile-time registration (`configureDependencies()` in `main.dart`).

**Why:** Constructors for repositories, use cases, and Cubits get long quickly. Injectable generates `di.config.dart` so dependencies are wired once and injected where needed—closer to how production Flutter apps avoid manual singletons everywhere.

---

### SharedPreferences

**What:** Lightweight key-value storage for the auth **token** (and similar session data).

**Why:** For this scope, full secure storage or a local DB is optional; the API already owns cart data server-side. SharedPreferences is simple and enough to restore session on cold start.

---

### UI helpers

| Package | Why it’s here |
|---------|----------------|
| **flutter_screenutil** | Consistent sizing across phone sizes from a single design baseline |
| **cached_network_image** | Product images load once and cache—important for scroll-heavy lists |
| **flutter_image_slideshow** | Home promotional banners |
| **readmore** | Long product descriptions without cluttering the details screen |
| **awesome_snackbar_content** | Clear success/error feedback after auth or cart actions |

---

## Architecture

Data flows **inward**: UI → Use Case → Repository → Remote data source → Retrofit → API. Responses map **DTO → Entity** before they reach the domain layer.

```
┌──────────────────────────────────────────────────────────┐
│  Features/Ui     Screens, widgets, Cubits (presentation) │
├──────────────────────────────────────────────────────────┤
│  Domain          Entities, repository interfaces,        │
│                  use cases (business rules)              │
├──────────────────────────────────────────────────────────┤
│  Data            Repository implementations,             │
│                  remote data source abstractions         │
├──────────────────────────────────────────────────────────┤
│  api             Retrofit ApiServices, DTOs, mappers   │
├──────────────────────────────────────────────────────────┤
│  Core            Errors, validators, theme utils, cache  │
└──────────────────────────────────────────────────────────┘
                              │
                              ▼
              https://ecommerce.routemisr.com/
```

**API surface (examples):** `auth/signin`, `auth/signup`, `categories`, `brands`, `products`, `cart` (GET/POST/PUT/DELETE with token header).

---

## Project structure

```
lib/
├── Core/              # Shared utilities, cache, app-wide errors
├── Domain/            # Entities, repositories (abstract), use cases
├── Data/              # Repository impls + remote data source contracts
├── api/               # Retrofit client, DTOs, mappers
├── Features/Ui/       # Feature-first UI (Auth, Home, Cart, Product details, …)
├── config/            # Dependency injection, BlocObserver
└── main.dart          # App entry, routing, token-based initial route
```

---

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) compatible with `sdk: ^3.7.2`
- A device, emulator, or Chrome

```bash
flutter doctor
```

### Run the project

```bash
git clone -b Develop https://github.com/mariamamgad18/e_commerce.git
cd e_commerce
flutter pub get

# Required before first run (generates Retrofit, Injectable, JSON code)
dart run build_runner build --delete-conflicting-outputs

flutter run
```

Platform examples:

```bash
flutter run -d chrome
flutter run -d windows   # if enabled for your Flutter install
```

---

## Code generation

Regenerate after changing:

- `@RestApi` / endpoints in `lib/api/api_services.dart`
- `@injectable` classes or modules
- `@JsonSerializable` DTOs

```bash
dart run build_runner build --delete-conflicting-outputs
```

During active development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

Generated files (e.g. `*.g.dart`, `di.config.dart`) are not always committed—run build_runner after clone.

---

## Author

**Mariam Amgad** — [@mariamamgad18](https://github.com/mariamamgad18)

If this README helped you understand the project, consider starring the repo or opening issues/PRs on **`Develop`**.

---

<div align="center">
  <sub>Flutter · Clean Architecture · BLoC · Route E-Commerce API</sub>
</div>
