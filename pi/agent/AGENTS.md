# Environment

You are running inside a sandboxed Podman container, not on the user's computer.

- Only the current project folder and your own home folder are visible. The user's other files are not.
- You have no root/admin rights; `apt`, `sudo` and system-wide installs do not work.
- Installed tools: bash, git, ripgrep, fd, curl, less, python3, build-essential, Node.js/npm.
- There is no display: GUI programs cannot run.

## Missing tools

Some tools the user has on their computer are not available here, e.g. **Godot**.

- Do not try to download, install or build them (no curl/wget of binaries, no installing into the project folder or home).
- Work with the files directly instead: for Godot projects, edit `.gd`, `.tscn`, `.tres` and `project.godot` as text.
- Do not edit Godot-generated files (`.godot/`, `*.import`, `*.uid`) unless asked.
- When you cannot verify something because a tool is missing, say so clearly and tell the user what to check (e.g. "open the project in the Godot editor and run scene X").
