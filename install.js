'use strict'

const rimraf = require('rimraf');
const fs = require('fs');
const path = require('path');

const HOME = '/home/tom/';

const files = [
  { src: 'atom/keymap.cson', dest: '.atom/keymap.cson' },
  { src: 'atom/styles.less', dest: '.atom/styles.less' },
  { src: 'fish/functions', dest: '.config/fish/functions' },
  { src: 'fish/config.fish', dest: '.config/fish/config.fish' },
  { src: 'git/gitconfig', dest: '.gitconfig' },
  { src: 'git/gitignore', dest: '.gitignore' },
  { src: 'tmux/tmux.conf', dest: '.tmux.conf' },
  { src: 'vim', dest: '.vim' },
  { src: 'X/xbindkeysrc', dest: '.xbindkeysrc' },
  { src: 'X/xinitrc', dest: '.xinitrc' },
  { src: 'fonts', dest: '.fonts' }
];

files.map(function(file) {
  let dest = path.join(HOME, file.dest);
  let src = path.join(__dirname, file.src);

  rimraf(dest, function() {
    console.log('Removed ' + dest);
    fs.symlink(src, dest, function() {
      console.log('Created symlink: ' + dest + ' -> ' + src);
    });
  });
});
