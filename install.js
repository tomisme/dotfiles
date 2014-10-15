var rimraf = require('rimraf');
var fs = require('fs');
var _ = require('lodash');

var destDir = '/home/tom/';
var srcDir = '/home/tom/git/dotfiles/';

var locations = [
  { src: 'functions', dest: '.config/fish/functions' },
  { src: 'git/gitconfig', dest: '.gitconfig' },
  { src: 'vim', dest: '.vim' },
  { src: 'X/xbindkeysrc', dest: '.xbindkeysrc' },
  { src: 'X/xinitrc', dest: '.xinitrc' }
];

_.map(locations, function(location) {
  var dest = destDir + location.dest;
  var src = srcDir + location.src;

  rimraf(dest, function() {
    console.log('Removed ' + dest);
    fs.symlink(src, dest, function() {
      console.log('Created symlink: ' + dest + ' -> ' + src);
    });
  });
});
