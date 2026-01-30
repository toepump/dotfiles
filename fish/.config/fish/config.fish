if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cdp="cd ~/Documents/projects/"
alias cdpg="cd ~/Documents/projects/godot/gun-beast-heroes-3"
alias cdpb="cd ~/Documents/projects/godot/joepump/bulletfall-1988/"
alias cdd="cd ~/dotfiles/"

# set the XDG_CONFIG_HOME for terminal sessions.
# macos uses a different default for lazygit specifically which is why this
# is needed.
export XDG_CONFIG_HOME=$HOME/.config


# start starship prompt when fish initializes
starship init fish | source
