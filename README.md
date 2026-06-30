# Open WebUI Dockerfile for Choreo

# Version

v0.10.1

# Releases


### Fixed

- 🤝 **Shared folder read-only chats no longer sign users out.** Opening or reading chats from shared folders now keeps the current session active when a resource-level access error is returned, instead of incorrectly showing "Session expired. Please sign in again."
