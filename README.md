# toepump's dotfiles

These are my dotfiles for my tool/environment configurations.

How it works: install the tools, clone this repo into `~`, stow it, and make
fish your login shell. After that, you only `git pull` to update.

Each top-level folder (`fish`, `nvim`, `tmux`, ...) is a stow package: `stow`
mirrors its contents into `~` as symlinks.

---

## Linux (Arch)

### 1. Install the tools

```bash
sudo pacman -S git stow fish neovim starship tmux lazygit git-delta \
    kitty ghostty ttf-firacode-nerd mpd rmpc openssh podman
```

### 2. Give GitHub an SSH key

The repo and its submodules clone over SSH, so this must come first.

```bash
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
```

Paste the output into GitHub → Settings → SSH and GPG keys → New SSH key.

### 3. Clone into your home folder

```bash
cd ~
git clone --recurse-submodules git@github.com:toepump/dotfiles.git
```

`--recurse-submodules` also clones the 2 submodules: `toepump/toepump.nvim`
(my neovim config) and `catppuccin/tmux`.

### 4. Stow

```bash
cd ~/dotfiles
./stow_all.fish
```

If stow says a file "already exists", a default config is in the way (often
`~/.gitconfig`). Move it aside (`mv ~/.gitconfig ~/.gitconfig.bak`) and run
`./stow_all.fish` again.

> [!NOTE]
> You can stow just some packages instead (see [Stowing individual packages](#stowing-individual-packages)).

### 5. Make fish your login shell

```bash
chsh -s /usr/bin/fish
```

### 6. Log out and back in

This is required so every terminal and tmux picks up fish.

### 7. Check

Open a new terminal:

```fish
echo $SHELL          # /usr/bin/fish
```

You should see the starship prompt. Run `tmux new` and check `echo $SHELL`
there too.

### 8. Set up pi (coding agent)

```fish
pis-update        # builds the pi container (takes a few minutes)
cd ~/some/project
pi                # then type /login and paste your OpenCode Go key
```

See [pi sandbox](#pi-sandbox) for how it works.

---

## macOS

### 1. Install Homebrew

```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the "Next steps" it prints, so `brew` works in this terminal.

### 2. Install the tools

```bash
brew install git stow fish neovim starship tmux lazygit git-delta rmpc podman
brew install --cask ghostty kitty font-fira-code-nerd-font
```

Skip whichever terminal (ghostty or kitty) you don't use.

### 3. Give GitHub an SSH key

The repo and its submodules clone over SSH, so this must come first.

```bash
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
```

Paste the output into GitHub → Settings → SSH and GPG keys → New SSH key.

### 4. Clone into your home folder

```bash
cd ~
git clone --recurse-submodules git@github.com:toepump/dotfiles.git
```

`--recurse-submodules` also clones the 2 submodules: `toepump/toepump.nvim`
(my neovim config) and `catppuccin/tmux`.

### 5. Stow

```bash
cd ~/dotfiles
./stow_all.fish
```

If stow says a file "already exists", a default config is in the way (often
`~/.gitconfig`). Move it aside (`mv ~/.gitconfig ~/.gitconfig.bak`) and run
`./stow_all.fish` again.

> [!NOTE]
> You can stow just some packages instead (see [Stowing individual packages](#stowing-individual-packages)).

`mpd` gets stowed too. It's Linux-only, but harmless on a Mac.

### 6. Make fish your login shell

```bash
grep fish /etc/shells || echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/fish"
```

The first line adds fish to the list of allowed shells only if it's missing.

### 7. Log out and back in

This is required so every terminal and tmux picks up fish.

### 8. Check

Open Ghostty or kitty:

```fish
echo $SHELL                      # /opt/homebrew/bin/fish
command -v starship nvim delta   # each prints a path
lazygit --print-config-dir       # ~/.config/lazygit
```

You should see the starship prompt. Run `tmux new` and check `echo $SHELL`
there too.

### 9. Set up pi (coding agent)

podman runs containers inside a small Linux VM on macOS. Create it once:

```fish
podman machine init
podman machine start   # after a reboot, run this again before using pi
```

Then:

```fish
pis-update        # builds the pi container (takes a few minutes)
cd ~/some/project
pi                # then type /login and paste your OpenCode Go key
```

---

## Updating later

On any machine:

```bash
cd ~/dotfiles
git pull --recurse-submodules
```

Make changes on one machine, commit, push, then pull on the other. Don't
hand-edit paths per machine. If something needs to differ, make the config
detect it (see `config.fish` for examples).

New package folder added to the repo? Run `stow <folder>` (or
`./stow_all.fish` again).

Pulled a change to `pi/Containerfile`? Run `pis-update` on that machine.

## pi sandbox

`pi/` holds the pi coding agent setup. It is not a stow package;
`config.fish` puts `pi/bin` on PATH.

| Path | What it is |
|---|---|
| `pi/bin/pi` | Starts pi in a podman container that can only see the current folder |
| `pi/bin/pis-update` | Rebuilds the container image (latest pi + updates) |
| `pi/Containerfile` | Recipe for the container |
| `pi/agent/` | pi's config, mounted into the container as `~/.pi/agent` |

Shared via git: `settings.json`, `models.json`, `AGENTS.md`, `skills/`,
`themes/`. Per machine (gitignored): `auth.json` (login), `sessions/`, `npm/`
(installed plugins), caches. The container's home folder is
`~/.local/share/pi-sandbox/home` (per machine, not in git).

Changes pi makes to its settings (e.g. via `/model`) show up in `git status`.
Commit them like any other change.

The only Linux/Mac difference is in `pi/bin/pi`: on Linux the container can
reach local models (Ollama on port 11434, llama-server on 8080); on macOS it
can't. The `ollama/…` model still shows in `/model` on the Mac but won't work.

## Stowing individual packages

Run these from `~/dotfiles`:

| Action | Command |
|---|---|
| Stow one package | `stow {DIRECTORY_NAME}` (e.g. `stow nvim`) |
| Un-stow one package | `stow -D {DIRECTORY_NAME}` |
| Stow / un-stow everything | `./stow_all.fish` / `./unstow_all.fish` |

> [!NOTE]
> Why only stow pieces? Not all of the dotfiles are valid in all scenarios. For example, if you don't use `fish` at work then why stow it? Additionally, the `.gitconfig` in particular contains things like your git email and username, which may not be the same for personal vs professional use.

## Git submodules

| Action                                          | Command                                                                    |
| ----------------------------------------------- | -------------------------------------------------------------------------- |
| Add a new submodule                             | `git submodule add https://github.com/USER/REPO.git {PKG}/.config/{TARGET}`|
| Sync submodules to commits tracked by main repo | `git submodule update --init --recursive`                                  |
| Pull latest from submodule remotes              | `git submodule update --remote --merge`                                    |
| Pull main repo + submodules together            | `git pull --recurse-submodules`                                            |
| Commit submodule update                         | `git add nvim/.config/nvim && git commit -m "Update submodule"`            |

## If something goes wrong

| Problem | Fix |
|---|---|
| Terminal opens bash/zsh, not fish | Redo the "login shell" step, then log out and back in. Run `tmux kill-server` too. |
| `command not found` for brew tools (Mac) | Open a new terminal. If it still happens, check `ls /opt/homebrew/bin/brew` exists. |
| nvim has no plugins / tmux has no theme | Submodules are missing: `git submodule update --init --recursive`, then `./stow_all.fish`. |
| Undo all symlinks | `cd ~/dotfiles && ./unstow_all.fish` |
