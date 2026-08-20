function ks
    set session ~/.config/kitty/sessions/$argv[1].kitty-session
    if not test -f "$session"
        echo "No such session: $argv[1]"
        return 1
    end
    kitty --session $session &
    disown
    kitty @ close-tab --self
end
