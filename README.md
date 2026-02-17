# Open WebUI Dockerfile for Choreo

# Version

v0.8.2

# Releases

## [0.8.2] - 2026-02-16

### Added

- 🧠 **Skill content handling.** User-selected skills now have their full content injected into the chat, while model-attached skills only display name and description in the available skills list. This allows users to override skill behavior while model-attached skills remain flexible. [Commit](https://github.com/open-webui/open-webui/commit/393c0071dc612c5ac982fb37dfc0288cb9911439)
- ⚙️ **Chat toggles now control built-in tools.** Users can now disable web search, image generation, and code execution on a per-conversation basis, even when those tools are enabled as builtin tools on the model. [#20641](https://github.com/open-webui/open-webui/issues/20641), [#21318](https://github.com/open-webui/open-webui/discussions/21318), [Commit](https://github.com/open-webui/open-webui/commit/c46ef3b63bcc1e2e9adbdd18fab82c4bbe33ff6c), [Commit](https://github.com/open-webui/open-webui/commit/f1a1e64d2e9ad953b2bc2a9543e9a308b7c669c8)
- 🖼️ **Image preview in file modal.** Images uploaded to chats can now be previewed directly in the file management modal, making it easier to identify and manage image files. [#21413](https://github.com/open-webui/open-webui/issues/21413), [Commit](https://github.com/open-webui/open-webui/commit/e1b3e7252c1896c04d498547908f0fce111434e1)
- 🏷️ **Batch tag operations.** Tag creation, deletion, and orphan cleanup for chats now use batch database queries instead of per-tag loops, significantly reducing database round trips when updating, archiving, or deleting chats with multiple tags. [Commit](https://github.com/open-webui/open-webui/commit/c748c3ede)
- 💨 **Faster group list loading.** Group lists and search results now load with a single database query that joins member counts, replacing the previous pattern of fetching groups first and then counting members in a separate batch query. [Commit](https://github.com/open-webui/open-webui/commit/33308022f)
- 🔐 **Skills sharing permissions.** Administrators can now control skills sharing and public sharing permissions per-group, matching the existing capabilities for tools, knowledge, and prompts. [Commit](https://github.com/open-webui/open-webui/commit/88401e91c)
- ⚡ **Long content truncation in preview modals.** Citation and file content modals now truncate markdown-rendered content at 10,000 characters with a "Show all" expansion button, preventing UI jank when previewing very large documents.
- 🌐 **Translation updates.** Translations for Spanish and German were enhanced and expanded.

### Fixed

- 🔐 **OAuth session error handling.** Corrupted OAuth sessions are now gracefully handled and automatically cleaned up instead of causing errors. [Commit](https://github.com/open-webui/open-webui/commit/7e224e4a536b07ec008613f06592e34050e7067c)
- 🐛 **Task model selector validation.** The task model selector in admin settings now correctly accepts models based on the new access grants system instead of rejecting all models with an incorrect error. [Commit](https://github.com/open-webui/open-webui/commit/9a2595f0706d0c9d809ae7746001cf799f98db1d)
- 🔗 **Tool call message preservation.** Models no longer hallucinate tool outputs in multi-turn conversations because tool call history is now properly preserved instead of being merged into assistant messages. [#21098](https://github.com/open-webui/open-webui/discussions/21098), [#20600](https://github.com/open-webui/open-webui/issues/20600), [Commit](https://github.com/open-webui/open-webui/commit/f2aca781c87244cffc130aa2722e700c19a81d66)
- 🔧 **Tool server startup initialization.** External tool servers configured via the "TOOL_SERVER_CONNECTIONS" environment variable now initialize automatically on startup, eliminating the need to manually visit the Admin Panel and save for tools to become available. This enables proper GitOps and containerized deployments. [#18140](https://github.com/open-webui/open-webui/issues/18140), [#20914](https://github.com/open-webui/open-webui/pull/20914), [Commit](https://github.com/open-webui/open-webui/commit/f20cc6d7e6da493eb75ca1618f5cbd068fa57684)
- ♻️ **Resource handle cleanup.** File handles are now properly closed during audio transcription and pipeline uploads, preventing resource leaks that could cause system instability over time. [#21411](https://github.com/open-webui/open-webui/issues/21411)
- ⌨️ **Strikethrough shortcut conflict fix.** Pressing Ctrl+Shift+S to toggle the sidebar no longer causes text to become struck through in the chat input, by disabling the TipTap Strike extension's default keyboard shortcut when rich text mode is off. [Commit](https://github.com/open-webui/open-webui/commit/38ae91ae2)
- 🔧 **Tool call finish_reason fix.** API responses now correctly set finish_reason to "tool_calls" instead of "stop" when tool calls are present, fixing an issue where external API clients (such as OpenCode) would halt prematurely after tool execution when routing Ollama models through the Open WebUI API. [#20896](https://github.com/open-webui/open-webui/issues/20896)