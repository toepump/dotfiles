# toepump's dotfiles

These are my dotfiles for my tool/environment configurations.

## How to Use

Clone this repo to the your home directory (typically `~/`).

You should end up with `~/dotfiles/` directory and inside of it you should see a hidden `.config` directory. You will also see any other global configs like `.gitconfig` for example.

Go into the dotfiles directory: `cd ~/dotfiles`.

Ensure that you have GNU Stow installed: `yay stow`
This tool will take the contents and structure of your dotfiles directory and mirror it to the home directory (`~/`) via symlinks.

In `~/dotfiles`, run `stow .`

You should then have all of the symlinks generated intot he home directory.

To Unstow, run `stow -D .`

---

If the contents of `dotfiles` has a directory in it (for example, `~/nvim/`), then that means that that directory should be stowed/unstowed individually.
It will not be included in the above `stow .` command.

To stow/unstow that individual directory run `stow nvim` or `stow -D nvim` respectively.
