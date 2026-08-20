complete -c ks -f -a "(ls ~/.config/kitty/sessions/ 2>/dev/null | string replace -r '\.kitty-session\$' '')"
