set PATH $PATH ~/bin ~/.npm-packages/bin ~/.cargo/bin

set -xg VISUAL "/usr/bin/vim"
set -xg EDITOR "/usr/bin/vim"
set -xg BROWSER "/usr/bin/firefox"
set -xg ANDROID_HOME "/home/tom/Android/Sdk"

fish_vi_key_bindings

function reload
  clear
  source ~/.config/fish/config.fish
end

function fish_greeting
  echo
  neofetch
end

function fish_mode_prompt
end

function fish_prompt
  printf '\n\u250C\u2500\u2500 '
  switch $fish_bind_mode
    case default
      set_color --bold --background red black
      printf 'Normal'
    case insert
      set_color --bold --background yellow black
      printf 'Insert'
    case visual
      set_color --bold --background magenta black
      printf 'Visual'
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
  # virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
end

function q
  exit
end

function r
  trash-put $argv
end

function xclip2
  xclip -selection c
end

function outdated 
  clojure -Aoutdated -a outdated
end

function atom-backup
  apm list --installed --bare > ~/git/dotfiles/atom/packages.list
end

function atom-reset
  apm install --packages-file ~/git/dotfiles/atom/packages.list
end

function du1
	 du -ch --max-depth 0 * | sort -h
end

# includes hidden files/folders
function dua1
	 du -ch --max-depth 0 * .* | sort -h
end

function du2
	 du -ch --max-depth 1 * | sort -h
end

# includes hidden files/folders
function dua2
	 du -ch --max-depth 1 * .* | sort -h
end

function su
	 /bin/su --shell=/usr/bin/fish $argv
end

function clear-tree
	 exa -T -I node_modules $argv
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

function ga
	 git add $argv
end

function gb
  git checkout -b $argv
end

function gba
  git branch -av $argv
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
	 curl -L -s https://www.gitignore.io/api/$argv
end

function gl
  git log --format='%Cred%h%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset%C(yellow)%d%Creset' $argv
end

function gp
	 git push $argv
end

function gs
	 git status -sb $argv
end

function yclip
  youtube-dl (xclip -o)
end

function yclip-subs
  youtube-dl --write-auto-sub --embed-subs (xclip -o)
end

# convert .webm files to .mp3 w/ ffmpeg
function webmp3
  find . -type f -iname "*.webm" -exec bash -c 'FILE="$1"; ffmpeg -i "${FILE}" -vn -ab 128k -ar 44100 -y "${FILE%.webm}.mp3";' _ '{}' \;
end

# eval (direnv hook fish)

