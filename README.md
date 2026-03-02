# Open WebUI Dockerfile for Choreo

# Version

v0.8.7

# Releases

## [0.8.7] - 2026-03-01

### Fixed

- 🔒 **Connection access control privacy.** Tool server and terminal connections without explicit access grants are now private (admin-only) by default, fixing a bug where connections configured with no access grants were visible to all users instead of being restricted. [Commit](https://github.com/open-webui/open-webui/commit/2751a0f0b)
- 🧠 **ChatControls memory leak.** The ChatControls panel no longer leaks event listeners, ResizeObserver instances, and media query handlers when navigating between chats, fixing memory accumulation that could degrade performance during extended use. [#22112](https://github.com/open-webui/open-webui/pull/22112)
- 💾 **Temporary chat params preservation.** Model parameters are now correctly saved when creating a temporary chat, ensuring custom settings like temperature and top_p persist across the session. [Commit](https://github.com/open-webui/open-webui/commit/fe837d80e)
- ⚡ **Faster artifact content updates.** Artifact content extraction during streaming is now debounced via requestAnimationFrame, reducing redundant DOM reads and improving CPU efficiency when tokens arrive faster than the browser can paint. [Commit](https://github.com/open-webui/open-webui/commit/6863ca482)