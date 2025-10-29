# toepump's dotfiles

These are my dotfiles for my tool/environment configurations.

## Initial Setup

1. Clone this repo to the your home directory (typically `~/`).

```
git clone --recurse-submodules git@github.com:toepump/dotfiles.git
```

You should end up with `~/dotfiles/` directory and inside of it you should see a hidden `.config` directory. 
You will also see any other global configs like `.gitconfig` for example.

> [!NOTE] 
> This dotfiles repo contains git submodules for `toepump/toepump.nvim`, `catppuccin/tmux`. 
> The first repo contains my standalone neovim configuration.
> Because of this, the above clone command has the `--recurve-submodules` flag in order to ensure that the submodules are cloned as well.

2. Go into the dotfiles directory: 

```
cd ~/dotfiles`
```

3. Ensure that you have GNU Stow installed 

```
yay stow
```

Use whichever package manager you use for your OS. For macos, you can use `brew install stow`.
`stow` will take the contents and structure of your dotfiles directory and mirror it to the home directory (`~/`) via symlinks.

## Stowing

1. If you want to stow all the valid dotfiles in `~/dotfiles`, navigate into `~/dotfiles` and run: 

```
./stow_all.fish
```

You should then have all of the symlinks generated into the home directory.

2. If you want to stow only some of the directories, then run:

```
stow {DIRECTORY_NAME}
```

For example: `stow nvim`

> [!NOTE]
> Why only stow pieces? Because not all of the the dotfiles may be valid in all scenarios. For example, if you don't use `fish` at work then why stow it? Additionally, the `.gitconfig` in particular contains things like your git email and username, which may not be the same for personal vs professional use. 

## Un-Stowing

1. If you want to un-stow all the valid dotfiles in `~/dotfiles`, navigate into `~/dotfiles` and run:

```
./unstow_all.fish
```

This will then remove all the symlinks that were generated into the home directory.

2. If you want to un-stow only some of the directories, then run:

```
stow -D {DIRECTORY_NAME}
```

For example: `stow -D nvim`

## Git Submodules

> [!NOTE]
> As writing this, there are **2** submodules used in this repo.

Below is a quick reference on how to manage the submodules.

| Action                                          | Command                                                                    |
| ----------------------------------------------- | -------------------------------------------------------------------------- |
| Add a new submodule                             | `git submodule add https://github.com/USER/REPO.git .config/{TARGET_DIR}`  |
| Sync submodules to commits tracked by main repo | `git submodule update --init --recursive`                                  |
| Pull latest from submodule remotes              | `git submodule update --remote --merge`                                    |
| Pull main repo + submodules together            | `git pull --recurse-submodules`                                            |
| Commit submodule update                         | `git add .config/nvim && git commit -m "Update submodule"`                 |
