function ks
    kitty --session ~/.config/kitty/sessions/$argv[1].kitty-session &
    disown
    kitty @ close-tab --self
end
