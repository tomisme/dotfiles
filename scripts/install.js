var fs      = require('fs');
var trash   = require('trash');
var _       = require('lodash');

var homeDir = process.env.HOME;

var locations = [
  { src: 'functions', dest: homeDir + '/.config/fish/functions' },
  { src: 'gitconfig', dest: homeDir + '/.gitconfig' },
  { src: 'vim', dest: homeDir +  '/.vim' },
  { src: 'xbindkeysrc', dest: homeDir +  '/.xbindkeysrc' },
  { src: 'xinitrc', dest: homeDir +  '/.xinitrc' }
];

_.map(locations, function(location) {
  var dest = fs.realpathSync(location.dest);
  var src = fs.realpathSync(location.src);

  console.log('Removing ' + dest);
  fs.rmdir(dest, function() {
    console.log('Removed ' + dest);
    console.log('Creating symlink from ' + src + ' to ' + dest);
    fs.symlink(src, dest, function() {
      console.log('Created symlink from ' + src + ' to ' + dest);
    });
  });
});
