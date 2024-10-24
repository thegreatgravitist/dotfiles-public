if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
fish_config theme choose "Rosé Pine"
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias g git
command -qv nvim && alias vim nvim
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# editor
set -gx EDITOR nvim

# reload fish
bind \cx reload_fish

# Fzf
fzf_configure_bindings --directory=\cf
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
bind \cn fzf_change_directory

# Pyenv root path
set -Ux PYENV_ROOT "$HOME/Developer/.pyenv"
pyenv init - | source

# remove path
function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end
end

# Created by `pipx` on 2024-10-24 16:10:40
set PATH $PATH /Users/ttoe/.local/bin

# Poetry config file path
set -Ux POETRY_CONFIG_DIR $HOME/.config/pypoetry/
