# Open WebUI Dockerfile for Choreo

# Version

v0.8.3

# Releases

## [0.8.3] - 2026-02-17

### Added

- ✏️ **Model edit shortcut.** Users can now edit models directly from the model selector dropdown menu, making it faster to modify model settings without navigating to separate admin or workspace pages. [Commit](https://github.com/open-webui/open-webui/commit/519ff40cb69cdc1d215cee369e9db70ff7438153)
- 🎨 **Image edit API background support.** The image edit API now supports the background parameter for OpenAI's gpt-image-1 model, enabling background transparency control ("transparent", "opaque", "auto") when the feature is exposed in the UI. [#21459](https://github.com/open-webui/open-webui/pull/21459)
- ⚡ **Faster model filtering.** Model access control filtering no longer makes a redundant database query to re-fetch model info that is already available in memory, reducing latency when loading model lists for non-admin users. [Commit](https://github.com/open-webui/open-webui/commit/34cd3d79e8688f589e3dd2f03415f8a8f9a13115)
- 🔧 **Tool call display improvements.** Tool call results now display arguments in a cleaner key-value format instead of raw JSON, with a responsive layout that shows only the tool name on narrow screens and the full label on wider screens, preventing text wrapping to multiple lines. [Commit](https://github.com/open-webui/open-webui/commit/2ce935bdb10d2b26b230cd54cb649f5c667ed96a)
- 🔄 **General improvements.** Various improvements were implemented across the application to enhance performance, stability, and security.
- 🌐 Translations for Portuguese (Brazil), Simplified Chinese, and Traditional Chinese were enhanced and expanded.

### Fixed

- 📧 **USER_EMAIL variable fix.** The {{USER_EMAIL}} template variable now correctly returns the user's email address instead of "Unknown" in prompts. [#21479](https://github.com/open-webui/open-webui/pull/21479), [#21465](https://github.com/open-webui/open-webui/issues/21465)
- 🖼️ **Image and file attachment handling fixes.** Uploaded images are now correctly sent to vision-enabled models, and file attachments now work even when no user text is entered alongside a system prompt. This fixes two issues where the backend was not properly processing file attachments: images weren't converted to the expected format for API requests, and file context was dropped when the user sent only a file without accompanying text. [Commit](https://github.com/open-webui/open-webui/commit/f1053d94c7ef7b8b78682dd73586b65a84d202a1), [#21477](https://github.com/open-webui/open-webui/issues/21477), [#21457](https://github.com/open-webui/open-webui/issues/21457)
- 🛡️ **Missing function error handling.** Models that reference deleted functions no longer cause the entire /api/models endpoint to crash; instead, the missing functions are skipped and logged, allowing the rest of the models to load successfully. [#21476](https://github.com/open-webui/open-webui/pull/21476), [#21464](https://github.com/open-webui/open-webui/issues/21464)
- 🚀 **Startup model pre-fetch error handling.** If model pre-fetching fails during app startup, the application now logs a warning and continues instead of crashing entirely. [Commit](https://github.com/open-webui/open-webui/commit/337109e99ce390f55a9085d0a301853637923779)
- ⚙️ **Function module loading error handling.** Function modules that fail to load during startup or model processing are now caught and logged, preventing crashes when models reference functions with loading errors. [Commit](https://github.com/open-webui/open-webui/commit/15b893e651de71b033408e1b713e0b51f6829ab8)
- 🗄️ **PostgreSQL group query fix.** The '/api/v1/groups/' endpoint no longer fails with a GROUP BY error when using PostgreSQL; member counts are now calculated using correlated subqueries for better database compatibility. [#21458](https://github.com/open-webui/open-webui/pull/21458), [#21467](https://github.com/open-webui/open-webui/issues/21467)