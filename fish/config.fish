set -U fish_user_paths $fish_user_paths ~/bin/ ~/.npm-packages/bin/
set -xg VISUAL "/user/bin/vim"
set -xg EDITOR "/user/bin/vim"
set -xg BROWSER "/user/bin/chromium"

fish_vi_mode

alias q "exit"
alias v "vim"
alias l "ll"
alias h "how2"

function reload
  clear
  source ~/.config/fish/config.fish
end

function header
	set_color -b cyan -o black
	printf $argv
	set_color normal
	printf "\n\n"
end

function fish_greeting
	cat ~/git/dotfiles/fish/greeting.txt
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
    printf ' %s%s %s%s %s%s %s%s %s\f\r\u2514\u2500\u25B6 ' \
      (set_color yellow) \
      (date "+%H:%M") \
      (set_color blue) \
      $USER \
      (set_color $fish_color_cwd) \
      (prompt_pwd) \
      (set_color normal) \
      $git_branch
end

function atom-backup
  apm list --installed --bare > ~/git/dotfiles/atom/packages.list
end

function atom-reset
  apm install --packages-file ~/git/dotfiles/atom/packages.list
end

function ga
	header "What, so everyone's supposed to sleep every single night now? Y-you realize that nighttime makes up half of all time?"
	git add $argv
end

function gb
  header "This is why you don't freeze time, you guys. It's incredibly irresponsible."
  git checkout -b $argv
end

function gba
	header "Where are my testicles, Summer?"
  git branch -av
end

function gc
	git commit $argv
end

function gch
	git checkout $argv
end

function gd
	git diff $argv
end

function gi
	header "25 shmeckles? I-I-I-I don't even know what that- what is that? Is that a lot?"
	curl -L -s https://www.gitignore.io/api/$argv
end

function gl
  git log --format='%Cred%h%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset%C(yellow)%d%Creset' $argv
end

function gp
	header "You're not gonna believe this, because it usually never happens, but I made a mistake"
	git push $argv
end

function gs
  header "All right, everything resolved? Everybody nice and certain about their position in my world?"
	git status -sb $argv
end

function du1
	du -h --max-depth 0 * | sort -h
end

function du2
	du -h --max-depth 1 * | sort -h
end

function su
	/bin/su --shell=/usr/bin/fish $argv
end

function clear-tree
	clear
	tree -C -I node_modules $argv
end

function t
	clear-tree -L 1 $argv
end

function t2
	clear-tree -L 2 $argv
end

function t3
	clear-tree -L 3 $argv
end
