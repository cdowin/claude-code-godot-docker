# Claude Code + Godot Docker

Docker image for using Claude Code with Godot game development. Extends [claude-code-docker](https://github.com/cdowin/claude-code-docker) with Godot headless binary and GDScript tooling.

## What's included

- Everything from `ghcr.io/cdowin/claude-code-docker` (Claude Code, firewall, gh CLI, etc.)
- Godot 4.6.2 headless binary
- [gdtoolkit](https://github.com/Scony/godot-gdscript-toolkit) — GDScript linter/formatter

## Usage

Pull the pre-built image:

```bash
docker pull ghcr.io/cdowin/claude-code-godot-docker:latest
```

Or use with the `run-claude.sh` script from claude-code-docker by setting `IMAGE_NAME` in your `claude-docker.conf`:

```bash
IMAGE_NAME=ghcr.io/cdowin/claude-code-godot-docker
```

## Building locally

```bash
docker build -t claude-code-godot .
```

To pin a different Godot version:

```bash
docker build --build-arg GODOT_VERSION=4.4 --build-arg GODOT_RELEASE=stable -t claude-code-godot .
```
