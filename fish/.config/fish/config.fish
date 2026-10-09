if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Homebrew (macOS only): brew's prefix is not on fish's default PATH.
# Checks for the brew binary itself, so this is a no-op on Linux.
for brew in /opt/homebrew/bin/brew /usr/local/bin/brew   # Apple Silicon, Intel
    if test -x $brew
        $brew shellenv fish | source
        break
    end
end

fish_add_path ~/.local/bin

set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
set -g fish_greeting

alias cdp="cd ~/Documents/projects/"
alias cdpg="cd ~/Documents/projects/godot/gun-beast-heroes-3"
alias cdpb="cd ~/Documents/projects/godot/joepump/bulletfall-1988/"
alias cdd="cd ~/dotfiles/"
alias cdpi="cd ~/.local/share/pi-sandbox/home/.pi/agent/"

# start starship prompt when fish initializes (skip if not installed)
if command -q starship
    starship init fish | source
end
