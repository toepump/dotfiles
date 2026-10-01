if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path ~/.local/bin

set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
set -g fish_greeting

alias cdp="cd ~/Documents/projects/"
alias cdpg="cd ~/Documents/projects/godot/gun-beast-heroes-3"
alias cdpb="cd ~/Documents/projects/godot/joepump/bulletfall-1988/"
alias cdd="cd ~/dotfiles/"

# start starship prompt when fish initializes
starship init fish | source
