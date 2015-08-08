set --universal fish_user_paths $fish_user_paths ~/bin/ ~/.npm/bin/

fish_vi_mode

function reload
  source ~/.config/fish/config.fish
end

function header
	set_color -b cyan -o black
	printf $argv
	set_color normal
	printf "\n\n"
end

function fish_mode_prompt
end

function fish_prompt
  printf '\n\u250C\u2500\u2500 '
  if set -q __fish_vi_mode
    switch $fish_bind_mode
      case default
        set_color --bold --background red white
        printf 'Normal'
      case insert
        set_color --bold --background green white
        printf 'Insert'
      case visual
        set_color --bold --background magenta white
        printf 'Visual'
    end
  end
    set_color normal
    if not set -q __fish_prompt_hostname
      set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    # if current directory is a git repo, show git branch
    if git status >/dev/null ^/dev/null
      set git_branch_name (git branch | grep '*' | cut -c3-)
      set git_branch (printf '(%s)' $git_branch_name)
    end
    printf ' %s%s %s%s@%s %s%s %s%s %s\f\r\u2514\u2500\u25B6 ' \
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


function prompt
end

function fish_greeting
	cat ~/git/dotfiles/fish/greeting.txt
end

function git-check
	for file in /home/tom/git/*
    cd $file
    set_color yellow
    echo \n $file
    set_color normal
    gs
  end
	cd /home/tom/git
end

function ga
	header "Snuffles was my slave name"
	git add $argv
end

function gc
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
git log --format='%Cred%h%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset%C(yellow)%d%Creset' $argv
end

function gp
	header "THOSE GUYS ARE INSIDE YOU BUILDING A PIECE OF SHIT ETHAN!!\nTHEY'RE INSIDE YOU BUILDING A MONUMENT TO COMPROMISE!!\nfuck them... fuck those people... fuck this whole thing ETHAN."
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
