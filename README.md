# toepump's dotfiles

These are my dotfiles for my tool/environment configurations.

## How to Use

1. Clone this repo to the your home directory (typically `~/`).

```
git clone --recurse-submodules git@github.com:toepump/dotfiles.git
```

You should end up with `~/dotfiles/` directory and inside of it you should see a hidden `.config` directory. 
You will also see any other global configs like `.gitconfig` for example.

> [!NOTE] 
> This dotfiles repo contains a git submodule for `toepump.nvim` repo. This repo contains my standalone neovim configuration.
> Because of this, the above clone command has the `--recurve-submodules` flag in order to ensure that the submodule is cloned as well.

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

4. In `~/dotfiles`, run 

```
stow .
```

You should then have all of the symlinks generated into the home directory.

5. To Unstow, run `stow -D .`

## Git Submodules

> [!NOTE]
> As writing this, there are 2 submodules used in this repo. My own (`toepump/toepump.nvim`) and `catppuccin/tmux`.

Below is a quick reference on how to manage the submodules.

| Action                                          | Command                                                    |
| ----------------------------------------------- | ---------------------------------------------------------- |
| Sync submodules to commits tracked by main repo | `git submodule update --init --recursive`                  |
| Pull latest from submodule remotes              | `git submodule update --remote --merge`                    |
| Pull main repo + submodules together            | `git pull --recurse-submodules`                            |
| Commit submodule update                         | `git add .config/nvim && git commit -m "Update submodule"` |

## (Optional) Isolated Directories

If the contents of `dotfiles` has a directory in it (for example, `~/nvim/`), then that means that that directory should be stowed/unstowed individually.
It will not be included in the above `stow .` command.

To stow/unstow that individual directory run `stow nvim` or `stow -D nvim` respectively.

#### Why have Isolated Directories?

> [!NOTE]
> At the time of writing this, I'm not using any isolated directories. So this would be future addition.

I work across a few different OSes for work personal projects. So sometimes it's not appropriate to just copy all of my configs to a system where that configuration or tool doesn't even work.

For example, I use Ghostty terminal at home, but Kitty at work.
Also, some configurations may have file paths or such that only work on one OS vs another.
In those cases it would likely be better to separate those configs and pick-and-choose which one I want to edit and load.
