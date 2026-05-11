function ksave
    set project (pwd)
    kitty @ action save_as_session ~/.config/kitty/sessions/(basename $project).kitty-session 
end
