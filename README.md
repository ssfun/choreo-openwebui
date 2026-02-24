# Open WebUI Dockerfile for Choreo

# Version

v0.8.5

# Releases

## [0.8.5] - 2026-02-23

### Added

- ⌨️ **Voice dictation shortcut.** Users can now toggle voice dictation using Cmd+Shift+L (or Ctrl+Shift+L on Windows/Linux), making it faster to start and stop dictation without clicking the microphone button.

### Fixed

- 🚫 **Model access KeyError fix.** The /api/models endpoint no longer crashes with a 500 error when models have incomplete info metadata missing the user_id field (e.g. models using global default metadata).
- 🔄 **Frontend initialization resilience.** The app layout now gracefully handles individual API failures during initialization (getModels, getBanners, getTools, getUserSettings, setToolServers) instead of blocking the entire page load when any single call fails.
- 🛡️ **Backend config null safety.** Language detection during app initialization no longer crashes when the backend config fetch fails, preventing a secondary cause of infinite loading.