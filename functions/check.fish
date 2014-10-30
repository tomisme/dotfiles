function check
	for file in /home/tom/git/*
    echo $file
    cd $file
    git status
  end
  cd /home/tom/git
end
