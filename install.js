var rimraf = require('rimraf');
var fs = require('fs');
var path = require('path');

var home = '/home/tom/';

var files = [
  { src: 'fish/functions', dest: '.config/fish/functions' },
  { src: 'fish/config.fish', dest: '.config/fish/config.fish' },
  { src: 'dunst/dunstrc', dest: '.config/dunst/dunstrc' },
  { src: 'git/gitconfig', dest: '.gitconfig' },
  { src: 'git/gitignore', dest: '.gitignore' },
  { src: 'vim', dest: '.vim' },
  { src: 'X/xbindkeysrc', dest: '.xbindkeysrc' },
  { src: 'X/xinitrc', dest: '.xinitrc' },
  { src: 'tmux/tmux.conf', dest: '.tmux.conf' },
  { src: 'dircolors/monokai', dest: '.dir_colors' },
  { src: 'fonts', dest: '.fonts' }
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
