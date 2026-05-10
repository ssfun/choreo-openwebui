# Open WebUI Dockerfile for Choreo

# Version

v0.9.4

# Releases


### Fixed

- 📜 **Chat scroll position on load.** Opening a chat conversation now reliably scrolls to the bottom of the message history, fixing a regression caused by `content-visibility: auto` where estimated element sizes prevented the initial scroll from reaching the true bottom.
