set -g fish_greeting
set -gx GTK_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx
set -gx SDL_IM_MODULE fcitx
set -gx INPUT_METHOD fcitx
set -Ux OLLAMA_API_BASE http://127.0.0.1:11434
set -U fish_user_paths $fish_user_paths ~/go/bin
set -x MANGOHUD 1
set -x SUDO_EDITOR nvim
set -x SYSTEMD_EDITOR nvim
set -x EDITOR nvim
set -gx NPM_CONFIG_PREFIX $HOME/.npm-global
set -gx NODE_PATH (npm root -g)
set -gx QT_QPA_PLATFORM xcb
fish_add_path $HOME/.npm-global/bin


# Library paths for matlab
# set -gx LD_LIBRARY_PATH /usr/lib/gnutls3.8.9 $LD_LIBRARY_PATH

#if status is-interactive
#and not set -q TMUX
# exec tmux
#end

if not set -q SSH_AGENT_PID
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end
clear


if status is-interactive
    #exported paths

    export EDITOR="nvim"
    export BAT_THEME='Catppuccin Mocha'
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:$HOME/../../usr/local/texlive/2024/bin/x86_64-linux/"
    export PATH="$PATH:$HOME/tmux/"
    export PATH="$PATH:$HOME/bin"
    export PATH="$PATH:$HOME/apps/"
    
    export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux/tlmgr"


export PATH="$PATH:/usr/local/bin/node"
    # alias vim="nvim"
end
if status is-interactive
    set -g fish_greeting
    fish_add_path /usr/bin/bat
end
# setup homebrew alias 
if status is-interactive
    fish_add_path --prepend /usr/bin
    zoxide init fish | source
    alias cd="z"
    alias cdi="zi"
    alias fetch="clear && fastfetch"
    alias ni="clear && nitch"
    alias t="tmux"
    alias td="tmux detach"
    alias py="python3"
    # alias python="python3"
    alias cat="bat"
    alias c="clear"
    alias l="eza"
    alias ll="eza -l"
    alias lla="eza -la"
    alias gp="git pull"
    alias gu="git push"
    alias ga="git add ."
    alias gpf="git push --force-with-lease"
    alias gc="git clone"
    alias gwip="git commit -m 'Work In Progress'"
    alias v="nvim"
    alias lg="lazygit"
    alias gbd="git branch --merged | grep -v "\*" | xargs -n 1 git branch -d"
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




# Start a D-Bus session if not already running
if not set -q DBUS_SESSION_BUS_ADDRESS
    eval (dbus-launch --sh-syntax)
end

if status is-login
    if test (tty) = /dev/tty1
    if not set -q GNOME_KEYRING_CONTROL
        for line in (gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
            set var (string split "=" $line)[1]
            set val (string split "=" $line)[2..-1]
            set -gx $var $val
        end
    end
        if not set -q WAYLAND_DISPLAY
            
            uwsm start hyprland.desktop

        end
    end
end





starship init fish | source
enable_transience
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
