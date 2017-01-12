Phoenix.set({
    openAtLogin: true
});

var ALT = ['alt'];
var ALT_SHIFT = ['alt', 'shift'];

//Directions
var NORTH = 'north';
var EAST = 'east';
var SOUTH = 'south';
var WEST = 'west';
var NW = 'nw';
var NE = 'ne';
var SW = 'sw';
var SE = 'se';

var VERTICAL = [NORTH, SOUTH, NW, NE, SW, SE];
var HORIZONTAL = [WEST, EAST, NW, NE, SW, SE];

var keyDirs = {
  'w' : NORTH,
  's' : SOUTH,
  'a' : WEST,
  'd' : EAST,
  'q' : NW,
  'e' : NE,
  'z' : SW,
  'c' : SE
}

Window.prototype.maximize = function(){
  var screen = this.screen();
  var frame = screen.flippedVisibleFrame()
  this.setFrame(frame);
};

Window.prototype.halveFrame = function(dir){
  var screen = this.screen();
  var frame = screen.flippedVisibleFrame()

  if(HORIZONTAL.indexOf(dir) > -1){
    frame.width /= 2;
  }
  if(VERTICAL.indexOf(dir) > -1){
    frame.height /= 2;
  }

  return frame;
};

// Snap a window in a given direction
Window.prototype.to = function (dir) {
  var screenFrame = this.screen().flippedVisibleFrame();
  var frame = this.halveFrame(dir);

  if ([EAST, NE, SE].indexOf(dir) > -1) {
    frame.x += screenFrame.width - frame.width;
  }

  if ([SOUTH, SE, SW].indexOf(dir) > -1){
    frame.y += screenFrame.height - frame.height;
  }

  this.setFrame(frame);
};

for(var key in keyDirs){
  if(keyDirs.hasOwnProperty(key)) {
    (function (){
      var k = key;

      Key.on(k, ALT, function () {
        var window = Window.focused();

        if (window) {
          window.to(keyDirs[k]);
        }
      });
    }());
  }
}

Key.on('m', ALT, function () {
  var window = Window.focused();

  if (window) {
    window.maximize();
  }
});
