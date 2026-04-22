# Open WebUI Dockerfile for Choreo

# Version

v0.9.1

# Releases


### Fixed

- 🐛 **Missing `aiosqlite` dependency.** Fixed a startup crash (`ModuleNotFoundError: No module named 'aiosqlite'`) when installing Open WebUI via `pip` or `uv` by adding the missing `aiosqlite` package to `pyproject.toml`. The dependency was listed in `requirements.txt` but not in the published package metadata, so it was not installed automatically. [#23916](https://github.com/open-webui/open-webui/issues/23916)
- 🐛 **Missing `asyncpg` dependency.** Added the missing `asyncpg` package to `pyproject.toml` to prevent the same startup crash for PostgreSQL users. Like `aiosqlite`, it was present in `requirements.txt` but absent from the published package dependencies.

