# Open WebUI Dockerfile for Choreo

# Version

v0.8.10

# Releases


### Added

- 🔐 **Custom OIDC logout endpoint.** Administrators can now configure a custom OpenID Connect logout URL via OPENID_END_SESSION_ENDPOINT, enabling logout functionality for OIDC providers that require custom endpoints like AWS Cognito. [Commit](https://github.com/open-webui/open-webui/commit/3f350f865920daf2844769a758b2d2e6a7ee3efa)
- 🗄️ **MariaDB Vector community support.** Added MariaDB Vector as a new vector database backend, enabling deployments with VECTOR_DB=mariadb-vector; supports cosine and euclidean distance strategies with configurable HNSW indexing. [#21931](https://github.com/open-webui/open-webui/pull/21931)
- 📝 **Task message truncation.** Chat messages sent to task models for title and tag generation can now be truncated using a filter in the prompt template, reducing token usage and processing time for long conversations. [#21499](https://github.com/open-webui/open-webui/issues/21499)
- 🔄 **General improvements.** Various improvements were implemented across the application to enhance performance, stability, and security.
- 🌐 Translations for Portuguese (Brazil), Spanish, and Malay were enhanced and expanded.

### Fixed

- 🔗 **Pipeline filter HTTP errors.** Fixed a bug where HTTP errors in pipeline inlet/outlet filters would silently corrupt the user's chat payload; errors are now properly raised before parsing the response. [#22445](https://github.com/open-webui/open-webui/pull/22445)
- 📚 **Knowledge file embedding updates.** Fixed a bug where updating knowledge files left old embeddings in the database, causing search results to include duplicate and stale data. [#20558](https://github.com/open-webui/open-webui/issues/20558)
- 📁 **Files list stability.** Fixed the files list ordering to use created_at with id as secondary sort, ensuring consistent ordering and preventing page crashes when managing many files. [#21879](https://github.com/open-webui/open-webui/issues/21879)
- 📨 **Teams webhook crash.** Fixed a TypeError crash in the Teams webhook handler when user data is missing from the event payload. [#22444](https://github.com/open-webui/open-webui/pull/22444)
- 🛠️ **Process shutdown handling.** Fixed bare except clauses in the main process that prevented clean shutdown; replaced with proper exception handling. [#22423](https://github.com/open-webui/open-webui/pull/22423)
- 🐳 **Docker deployment startup.** Docker deployments now start correctly; the missing OpenTelemetry system metrics dependency was added. [#22447](https://github.com/open-webui/open-webui/pull/22447), [#22401](https://github.com/open-webui/open-webui/issues/22401)
- 🛠️ **Tool access for non-admin users.** Fixed a NameError that prevented non-admin users from viewing tools; the missing has_access function is now properly imported. [#22393](https://github.com/open-webui/open-webui/issues/22393)
- 🔐 **OAuth error handling.** Fixed a bug where bare except clauses silently caught SystemExit and KeyboardInterrupt, preventing clean process shutdown during OAuth authentication. [#22420](https://github.com/open-webui/open-webui/pull/22420)
- 🛠️ **Exception error messages.** Fixed three locations where incorrect exception raising caused confusing TypeError messages instead of proper error descriptions, making debugging much easier. [#22446](https://github.com/open-webui/open-webui/pull/22446)
- 📄 **YAML file processing.** Fixed an error when uploading YAML files with Docling enabled; YAML and YML files are now properly recognized as text files and processed correctly. [#22399](https://github.com/open-webui/open-webui/pull/22399), [#22263](https://github.com/open-webui/open-webui/issues/22263)
- 📅 **Time range month names.** Fixed month names in time range labels appearing in the wrong language when OS regional settings differ from browser language; month names now consistently display in English. [#22454](https://github.com/open-webui/open-webui/pull/22454)
- 🔐 **OAuth error URL encoding.** Fixed OAuth error messages with special characters causing malformed redirect URLs; error messages are now properly URL-encoded. [#22415](https://github.com/open-webui/open-webui/pull/22415)
- 🛠️ **Internal tool method filtering.** Tools no longer expose internal methods starting with underscore to the LLM, reducing clutter and improving accuracy. [#22408](https://github.com/open-webui/open-webui/pull/22408)
- 🔊 **Azure TTS locale extraction.** Fixed Azure text-to-speech using incomplete locale codes in SSML; now correctly uses full locale like "en-US" instead of just "en". [#22443](https://github.com/open-webui/open-webui/pull/22443)
- 🎤 **Azure speech transcription errors.** Improved Azure AI Speech error handling to display user-friendly messages instead of generic connection errors; empty transcripts, no language identified, and other Azure-specific errors now show clear descriptions. [#20485](https://github.com/open-webui/open-webui/issues/20485)
- 📊 **Analytics group filtering.** Fixed token usage analytics not being filtered by user group; the query now properly respects group filters like other analytics metrics. [#22167](https://github.com/open-webui/open-webui/pull/22167)
- 🔍 **Web search favicon fallback.** Fixed web search sources showing broken image icons when favicons couldn't be loaded from external sources; now falls back to the default Open WebUI favicon. [#21897](https://github.com/open-webui/open-webui/pull/21897)
- 🔄 **Custom model fallback.** Fixed custom model fallback not working when the base model is unavailable; the base model ID is now correctly retrieved from model info instead of empty params. [#22456](https://github.com/open-webui/open-webui/issues/22456)
- 🖼️ **Pending message image display.** Fixed images in queued messages appearing blank; image thumbnails are now properly displayed in the pending message queue. [#22256](https://github.com/open-webui/open-webui/issues/22256)
- 🛠️ **File metadata sanitization.** Fixed file uploads failing with JSON serialization errors when metadata contained non-serializable objects like callable functions; metadata is now sanitized before database insertion. [#20561](https://github.com/open-webui/open-webui/issues/20561)

