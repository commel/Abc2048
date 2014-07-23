package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class Entity extends FlxSprite {
  
  public function new(x:Float=0, y:Float=0, value:Int=0) {
    super(x,y);
    makeGraphic(32, 32, FlxColor.BLUE);

    if (value > 0) {
      stamp(new FlxText(x, y, '$value'));
    }
  }

}
