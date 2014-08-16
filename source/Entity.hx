package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class Entity extends FlxSprite {
  
  public function new(x:Int=0, y:Int=0, value:Int=0) {
    super(x,y);
    switch(value) {
      case 0: makeGraphic(50, 50, FlxColor.WHITE);
      case 2: makeGraphic(50, 50, FlxColor.GRAY);
      case 4: makeGraphic(50, 50, FlxColor.YELLOW);
      case 8: makeGraphic(50, 50, FlxColor.GREEN);
      case 16: makeGraphic(50, 50, FlxColor.BLUE);
      case 32: makeGraphic(50, 50, FlxColor.RED);
      case 64: makeGraphic(50, 50, FlxColor.BLACK);
    }
  }

}
