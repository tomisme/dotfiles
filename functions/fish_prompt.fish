function fish_prompt --description 'Write out the prompt'
	if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  printf '\n\u250C\u2500\u2524 \u25D4%s%s %s%s@%s %s%s %s%s \f\r\u2514\u2500\u25B6 ' \
    (set_color yellow) \
    (date "+%H:%M") \
    (set_color blue) \
    $USER \
    $__fish_prompt_hostname \
    (set_color red) \
    (prompt_pwd) \
    (set_color normal)
end
