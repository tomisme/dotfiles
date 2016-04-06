'use strict'

const rimraf = require('rimraf');
const fs = require('fs');
const path = require('path');

const HOME = '/home/tom/';

const files = [
  { src: 'atom/snippets.cson', dest: '.atom/snippets.cson' },
  { src: 'atom/keymap.cson', dest: '.atom/keymap.cson' },
  { src: 'atom/config.cson', dest: '.atom/config.cson' },

  { src: 'boot/boot.properties',  dest: '.boot/boot.properties' },

  { src: 'fish/config.fish', dest: '.config/fish/config.fish' },

  { src: 'git/gitconfig', dest: '.gitconfig' },
  { src: 'git/gitignore', dest: '.gitignore' },

  { src: 'lein/profiles.clj', dest: '.lein/profiles.clj' },

  { src: 'npm/npmrc', dest: '.npmrc' },

  { src: 'vim', dest: '.vim' },

  { src: 'X/xinitrc', dest: '.xinitrc' }
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
