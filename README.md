# Open WebUI Dockerfile for Choreo

# Version

v0.8.12

# Releases


### Added

- 🌐 **Translation updates.** Translations for Simplified Chinese, Catalan, Portuguese (Brazil), Finnish, and Lithuanian were enhanced and expanded.

### Fixed

- 🔒 **Terminal server connection security.** Terminal server verification and policy saving now proxy through the backend, preventing API key exposure and CORS errors when connecting to in-cluster services. [Commit](https://github.com/open-webui/open-webui/commit/a6413257079a52fa4487eda36543f3955d0fbd53), [Commit](https://github.com/open-webui/open-webui/commit/4567cdc0d9cb7b42b6eba7b676c0ced3f4850d31)
- 🛠️ **Terminal tools exception handling.** Exceptions in middleware.py due to invalid return values from get_terminal_tools() have been resolved. [Commit](https://github.com/open-webui/open-webui/commit/52a06bd48aff34fb2211aac2879f0cd028129267)
- 📦 **Missing beautifulsoup4 dependency.** Users can now start Open WebUI using uvx without encountering the "bs4 module missing" error. [Commit](https://github.com/open-webui/open-webui/commit/1994d65306bbcc7406584e1bfef82f5d353fc91c)
- 🔌 **API files list error.** The /api/v1/files/ endpoint no longer returns a 500 error, fixing a regression that prevented file listing via the API. [Commit](https://github.com/open-webui/open-webui/commit/11f52921dc21c2dc61c03f12bcdf6f19140a350c)
- 📜 **License data loading.** License data now loads correctly, displaying the expected color and logo in the interface. [Commit](https://github.com/open-webui/open-webui/commit/16335f866ea4cedf00c4971963622fcc1fe02d82)
- 👑 **Admin model visibility.** Administrators can now see models even when no access control is configured yet, allowing them to manage all available models. [Commit](https://github.com/open-webui/open-webui/commit/f3f8f9874f55282603c2650b91801640cb3f69cb)
- 📊 **Tool call embed visibility.** Rich UI embeds from tool calls (like visualizations) are now rendered outside collapsed groups and remain visible without requiring manual expansion. [Commit](https://github.com/open-webui/open-webui/commit/4c872a8d128757d4a6f311fb86bc382af2ba5d0d), [Commit](https://github.com/open-webui/open-webui/commit/308fa924a5b2b7e08cd1e8f15b9c8c96e1de8f02)

