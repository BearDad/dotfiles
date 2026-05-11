function s
    sesh connect (sesh list -i | gum filter --limit 1 --no-sort --fuzzy --placeholder 'Pick a sesh' --prompt='⚡')
end
