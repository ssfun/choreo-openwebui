# Open WebUI Dockerfile for Choreo

# Version

v0.8.8

# Releases

## [0.8.8] - 2026-03-02

### Added

- 📁 **Open Terminal file moving.** Users can now move files and folders between directories in the Open Terminal file browser by dragging and dropping them. [Commit](https://github.com/open-webui/open-webui/commit/0c42cd2c012f9f49816adac897e2b46573b3cb6c), [Commit](https://github.com/open-webui/open-webui/commit/72951324dfeef64e09f4776898d675bc1c44f040), [Commit](https://github.com/open-webui/open-webui/commit/395098c6f1b7499d37ad55145a5931431d3e72e9), [Commit](https://github.com/open-webui/open-webui/commit/11487d66fc1a2dfafbdaa2b7ef939a86caaf3872)
- 📄 **Open Terminal HTML file preview.** Users can now preview HTML files directly in the Open Terminal file browser, with a rendered iframe view and source toggle, enabling iterative AI editing of HTML files. [Commit](https://github.com/open-webui/open-webui/commit/3909b62ffcf49839fa57346ed8487ae759811503), [Commit](https://github.com/open-webui/open-webui/commit/933a3bbbd3f4fc3eeb0ec52c7965e9ac1c4cea39)
- 🌐 **Open Terminal WebSocket proxy.** Added a new WebSocket proxy endpoint for interactive terminal sessions, enabling real-time bidirectional terminal communication with the terminal server. [Commit](https://github.com/open-webui/open-webui/commit/4f6cb771f1afded09aad6199cdb244dd8a6c77a6)
- ⚙️ **Open Terminal feature toggle.** Administrators can now enable or disable the Interactive Terminal feature for Open Terminal via configuration on the terminal server, controlling access to terminal routes. [Commit](https://github.com/open-webui/open-webui/commit/b5c3395f79bcc7ff5bc1d82bb86a60583bb3b5bd)
- 🔄 **General improvements.** Various improvements were implemented across the application to enhance performance, stability, and security.
- 🌐 Translations for Simplified Chinese, Traditional Chinese, Irish, and Catalan were enhanced and expanded.

### Fixed

- 🔧 **Middleware variable shadowing.** Fixed a variable shadowing issue in the middleware that could cause incorrect tool output processing during chat. [#22145](https://github.com/open-webui/open-webui/pull/22145)
- ⚡ **ChatControls reactivity fix.** Fixed a Svelte reactivity issue where the active tab state in the ChatControls panel was not properly saved when switching between chats. [#22127](https://github.com/open-webui/open-webui/pull/22127)
- 🔧 **ChatControls TypeScript fix.** Fixed a TypeScript syntax error in ChatControls.svelte where the module script block was missing lang="ts", causing esbuild to fail during vite dev. [#22131](https://github.com/open-webui/open-webui/pull/22131)
- 🔌 **Open Terminal tools for direct connections.** Fixed an issue where Open Terminal tools were not available to the model when the terminal was configured via direct connection settings, ensuring users can now interact with terminal files and operations through the AI. [#22137](https://github.com/open-webui/open-webui/issues/22137)
- 📜 **Chat history pagination.** Fixed an issue where older messages in long chats were not loaded when scrolling to the top. [Commit](https://github.com/open-webui/open-webui/commit/d7147d6cddfd314f0f1be77b15cec406a609ef36), [Commit](https://github.com/open-webui/open-webui/commit/c701ebe07bd152eecb42b0bf6de26071358a5c76)
- 🔧 **Terminal tool null parameter handling.** Fixed a bug where null parameters in terminal tool calls were sent as the string "None" instead of being omitted, causing 422 validation errors from the open-terminal server. [#22124](https://github.com/open-webui/open-webui/issues/22124), [#22144](https://github.com/open-webui/open-webui/pull/22144)

### Changed