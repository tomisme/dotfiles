set --universal fish_user_paths $fish_user_paths ~/bin/ ~/.npm/bin/

function fish_prompt --description 'Write out the prompt'
	if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

	# if current directory is a git repo, show git branch
	if git status >/dev/null ^/dev/null
	  set git_branch_name (git branch | grep '*' | cut -c3-)
		set git_branch (printf '(%s)' $git_branch_name)
	end

  printf '\n\u250C\u2500\u2500 %s%s %s%s@%s %s%s %s%s %s\f\r\u2514\u2500\u25B6 ' \
    (set_color yellow) \
    (date "+%H:%M") \
    (set_color blue) \
    $USER \
    $__fish_prompt_hostname \
    (set_color $fish_color_cwd) \
    (prompt_pwd) \
    (set_color normal) \
    $git_branch
end

function check
	for file in /home/tom/git/*
    set_color yellow
    echo \n $file
    set_color normal
    cd $file
    gs
  end
  cd /home/tom/git
end

function du1
	du -h --max-depth 0 * | sort -h
end

function du2
	du -h --max-depth 1 * | sort -h
end

function fish_greeting
	fortune
end

function ga
	git add $argv
end

function gc
	git commit $argv
end

function gd
	git diff --word-diff $argv
end

function gi
	curl -L -s https://www.gitignore.io/api/$argv
end

function gl
	git log $argv
end

function gp
	git push $argv
end

function gs
	git status -sb $argv
end

function q
	exit
end

function search
	aura -As $argv
	aura -Ss $argv
end

function secrets
	sudo swapoff -a
	tomb open secrets.tomb -k secrets.tomb.key
end

function su
	/bin/su --shell=/usr/bin/fish $argv
end

function t
	clear
	tree -C -I node_modules $argv
end

function t1
	t -L 1 $argv
end

function t2
	t -L 2 $argv
end

function t3
	t -L 3 $argv
end

function v
	vim $argv
end
