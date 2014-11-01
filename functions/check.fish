function check
	for file in /home/tom/git/*
    set_color yellow
    echo \n $file
    set_color normal
    cd $file
    git status
  end
  cd /home/tom/git
end
