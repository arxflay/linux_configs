function fish_prompt
    echo (set_color red)'['(set_color bryellow)(whoami)(set_color brgreen)'@'(set_color blue)(hostname)(set_color red)']'(set_color blue)' '(prompt_pwd)'> '
end


