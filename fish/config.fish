set --universal fish_user_paths $fish_user_paths ~/bin/ ~/.npm/bin/

function header
	set_color yellow
	printf $argv
	set_color normal
	printf "\n\n"
end

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

function fish_greeting
	cat ~/git/dotfiles/fish/greeting.txt
end

function git-commands
	cat ~/git/dotfiles/fish/g.txt
end

function git-check
	for file in /home/tom/git/*
    set_color yellow
    echo \n $file
    set_color normal
    cd $file
    gs
  end
	cd /home/tom/git
end

function ga
	header "Snuffles was my slave name"
	git add $argv
end

function gc
	header "I don't like it here Morty. I can't abide bureaucracy. I don't like being told where to go and what to do. I consider it a violation. Did you get those seeds all the way up your butt?"
	git commit $argv
end

function gd
	header "You're not gonna believe this, because it usually never happens, but I made a mistake"
	git diff --word-diff $argv
end

function gi
	header "25 shmeckles? I-I-I-I don't even know what that- what is that? Is that a lot?"
	curl -L -s https://www.gitignore.io/api/$argv
end

function gl
	header "THOSE GUYS ARE INSIDE YOU BUILDING A PIECE OF SHIT ETHAN!!\nTHEY'RE INSIDE YOU BUILDING A MONUMENT TO COMPROMISE!!\nfuck them... fuck those people... fuck this whole thing ETHAN."
	git log $argv
end

function gp
	header "It's a figure of speech, Morty! They're bureaucrats! I don't respect them.\nJust keep shooting, Morty! You have no idea what prison is like here!"
	git push $argv
end

function gs
	header "Where are my testicles, Summer?"
	git status -sb $argv
end

function q
	exit
end

function du1
	du -h --max-depth 0 * | sort -h
end

function du2
	du -h --max-depth 1 * | sort -h
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
