function ksessionizer
    if test -n "$argv[1]"
        set project (find $argv[1] -maxdepth 2 -type l | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick a session' --prompt='⚡')

    else 
        set project (find ~/git -maxdepth 2 -type d | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick a session' --prompt='⚡')
    end
    if test -z "$project"
        echo "No project found"
        return
    end
    set session ~/.config/kitty/sessions/(basename $project).kitty-session
    if test -f "$session"
        kitty --session $session &
        disown
        kitty @ close-tab --self
    else 
        kitty --working-directory $project &
        disown
        kitty @ close-tab --self
    end
end
