# Open WebUI Dockerfile for Choreo

# Version

v0.9.2

# Releases


### Added

- 🧠 **PaddleOCR-vl document extraction.** Administrators can now use PaddleOCR-vl as a content extraction engine for document processing, with configurable API URL and token settings in document retrieval configuration. [#23945](https://github.com/open-webui/open-webui/pull/23945)
- 🔥 **Firecrawl v2 API.** Firecrawl web loading now uses the v2 API directly with proper retry logic, exponential backoff on rate limits, and configurable timeout handling, improving reliability for both cloud and self-hosted Firecrawl setups. [#23934](https://github.com/open-webui/open-webui/pull/23934)
- ⏰ **Calendar event reminder customization.** Calendar events now support a configurable `reminder_minutes` parameter, allowing models to set custom reminder durations instead of the default 10-minute notification.
- 🔑 **Custom API key header.** Administrators can now configure a custom header name for API key authentication via the `CUSTOM_API_KEY_HEADER` environment variable, enabling compatibility with reverse proxies that use the `Authorization` header for their own authentication.
- 🔌 **OAuth session disconnection.** Users can now disconnect OAuth sessions for specific providers (e.g., MCP connections) through a new API endpoint, enabling cleaner re-authentication workflows.
- 📚 **Source overflow indicator.** The Sources button now shows a +N badge when more than three sources are available, so hidden sources are clearly indicated in chat responses. [#23918](https://github.com/open-webui/open-webui/pull/23918)
- ⚡ **Model list performance.** Model list API responses now strip base64 profile image data from paginated results, and model tags are fetched via a dedicated efficient query instead of loading all models. This significantly reduces payload sizes and improves workspace Models page responsiveness.
- ⚡ **Model avatar cache reuse.** Default model profile images now redirect to a shared static path instead of reading files from disk per-request, reducing repeated I/O and improving loading efficiency when multiple models use the fallback icon. [#24015](https://github.com/open-webui/open-webui/pull/24015)
- 🚀 **Faster splash image loading.** Splash screen images are now prioritized earlier during page load with preload links, improving first-load LCP behavior and reducing delayed image discovery. [#24011](https://github.com/open-webui/open-webui/pull/24011)
- 🧵 **Streaming markdown performance stability.** Streaming responses now stay more memory-efficient by preventing repeated cleanup callback registration during markdown updates. [#24048](https://github.com/open-webui/open-webui/pull/24048)
- 📊 **Telemetry gauge reliability.** OpenTelemetry user gauge callbacks now use synchronous database queries directly, eliminating cross-thread async bridging issues that could cause silent failures in metric collection.
- 🔄 **General improvements.** Various improvements were implemented across the application to enhance performance, stability, and security.
- 🌐 **Translation updates.** Translations for Finnish, Korean, Portuguese (Brazil), and Dutch were enhanced and expanded.

### Fixed

- 🔧 **MCP task cancellation stability.** Interrupted MCP tool calls no longer cause CPU spikes or runaway cleanup behavior. MCP client disconnection now runs in the same asyncio task as connection, respecting cancel scope constraints, and chat-active events are properly shielded during cancellation.
- 🧠 **Persistent chat skill injection.** Skills mentioned in persisted chats now inject into the system prompt reliably. Skill ID extraction from `<$skillId|label>` message tags is now handled server-side, and tags are stripped before messages reach the model.
- 🗄️ **Async database driver migration.** The async database backend now uses psycopg (v3) instead of asyncpg, eliminating brittle SSL parameter translation and supporting native libpq connection strings including `sslmode`, `options`, and `target_session_attrs` without any stripping or conversion.
- 🐳 **Docker ARM64 reliability.** Docker images built for arm64 via QEMU cross-compilation no longer produce 0-byte corrupted Python dependencies. `UV_LINK_MODE=copy` is now set in the Dockerfile to force reliable file installation.
- 🛠️ **Throttle request handling.** Request handling no longer fails when user activity status updates are throttled with a non-zero interval. [#23979](https://github.com/open-webui/open-webui/pull/23979)
- ✍️ **Rich text extension conflicts.** Rich text editing no longer triggers duplicate extension conflicts for lists and code blocks, improving editor stability. [#24009](https://github.com/open-webui/open-webui/pull/24009)
- 🔇 **Fetch URL null content guard.** The `fetch_url` built-in tool now safely handles `None` content returned by web loaders instead of crashing with a `TypeError`.
- 🌐 **OAuth discovery fallback.** OAuth protected resource discovery now falls back to well-known RFC 9728 URIs when the `WWW-Authenticate` header doesn't contain a `resource_metadata` link, improving compatibility with more MCP server implementations.
- 🔐 **Session token resolution.** Session user endpoints now gracefully handle missing `Authorization` headers by falling back to cookie and request state tokens, preventing errors when used behind forward-auth proxies.
- 🚫 **Direct API error responses.** Chat completion requests without a WebSocket channel (direct API calls) now return proper HTTP error responses instead of silently returning null on failure.
- 📡 **Cancelled response stream cleanup.** Cancelled chat generation now explicitly closes the upstream response body iterator, preventing orphaned async generators from spinning in anyio internals.
- 🔒 **Model profile image path safety.** Model profile image endpoints now validate and sanitize static asset redirect paths, preventing path traversal through encoded dots or malicious URL patterns.
- 📊 **RAG template validation UI.** The Documents settings page now displays a warning when RAG templates contain multiple `[context]` or `{{CONTEXT}}` placeholders, helping administrators avoid accidental redundant context injection.
- 🧩 **Automation model detection.** The `create_automation` tool now correctly detects the current model ID even when `model_id` is not yet set in metadata, falling back to the model dict.
- 🔄 **MCP resource content handling.** MCP tool results with the `resource` content type are now correctly detected and their `resource.text` payload is extracted, instead of being silently ignored.
- 🔄 **Ollama and OpenAI metadata forwarding.** Ollama and OpenAI proxy routes now forward request metadata to downstream handlers, ensuring consistent context propagation.
- 🧹 **Browser-native message virtualization.** The custom JavaScript-based message culling system (spacers, height caching, scroll listeners) was replaced with CSS `content-visibility: auto`, letting the browser natively skip rendering of off-screen messages without destroying component trees. This eliminates scroll jump artifacts and mount/destroy thrashing while preserving memory efficiency in long conversations.
- 📻 **Redis notification compatibility.** Redis pub/sub now handles missing or incompatible `client_name` support more gracefully, preventing connection errors with certain Redis configurations.

### Changed

- ⚙️ **psycopg v3 async driver.** The async database driver has been migrated from `asyncpg` to `psycopg` (v3). This is a transparent change for most deployments, but custom connection strings with `asyncpg`-specific parameters may need adjustment.
- 🔑 **Brotli dependency update.** Brotli has been updated to address CVE-2025-6176.
- 🖥️ **Windows startup script.** The Windows startup batch script has been updated for improved compatibility.

