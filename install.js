var rimraf = require('rimraf');
var fs = require('fs');
var path = require('path');

var home = '/home/tom/';

var files = [
  { src: 'functions', dest: '.config/fish/functions' },
  { src: 'dunst/dunstrc', dest: '.config/dunst/dunstrc' },
  { src: 'git/gitconfig', dest: '.gitconfig' },
  { src: 'git/gitignore', dest: '.gitignore' },
  { src: 'vim', dest: '.vim' },
  { src: 'X/xbindkeysrc', dest: '.xbindkeysrc' },
  { src: 'X/xinitrc', dest: '.xinitrc' },
  { src: 'tmux/tmux.conf', dest: '.tmux.conf' }
];

files.map(function(file) {
  var dest = path.join(home, file.dest);
  var src = path.join(__dirname, file.src);

  rimraf(dest, function() {
    console.log('Removed ' + dest);
    fs.symlink(src, dest, function() {
      console.log('Created symlink: ' + dest + ' -> ' + src);
    });
  });
});
