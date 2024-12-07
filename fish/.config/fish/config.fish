#if status is-interactive
#and not set -q TMUX
# exec tmux
#end
if status is-interactive
    #exported paths

    export EDITOR="/usr/bin/nvim.appimage"
    export BAT_THEME='Catppuccin Mocha'
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:$HOME/../../usr/local/texlive/2024/bin/x86_64-linux/"
    export PATH="$PATH:$HOME/tmux/"
    export PATH="$PATH:$HOME/bin"
    export PATH="$PATH:$HOME/apps/"

export PATH="$PATH:/usr/local/bin/node"
    # alias vim="nvim"
end
if status is-interactive
    set -g fish_greeting
    fish_add_path /usr/bin/bat
end
# setup homebrew alias 
if status is-interactive
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc
    zoxide init fish | source
    alias cd="z"
    alias cdi="zi"
    alias fetch="clear && fastfetch"
    alias t="tmux"
    alias td="tmux detach"
    alias py="python3"
    alias python="python3"
    alias cat="bat"
    alias c="clear"
    alias ls="exa"
    alias ll="exa -l"
    alias lla="exa -la"
    alias gp="git push"
    alias gpf="git push --force-with-lease"
    alias gpl="git pull"
    alias gc="git checkout"
    alias gcl="git clone"
    alias gca="git commit -a"
    alias nvim="/usr/bin/nvim.appimage"
    alias v="/usr/bin/nvim.appimage"
    alias bat="bat"
    alias lg="lazygit"
    # oh-my-posh init fish --config ~/tokyonight.toml | source
end

set -Ux FZF_DEFAULT_OPTS "
	--color=fg:$subtle,bg:$base,hl:$rose
	--color=fg+:$text,bg+:$overlay,hl+:$rose
	--color=border:$highlightMed,header:$pine,gutter:$base
	--color=spinner:$gold,info:$foam
	--color=pointer:$iris,marker:$love,prompt:$subtle"

# Created by `pipx` on 2024-09-04 21:21:33
set PATH $PATH /home/bd23/.local/bin

function starship_transient_prompt_func
    starship module character

end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
cd ~/
starship init fish | source
enable_transience
