package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class Entity extends FlxSprite {
  
  public function new(x:Int=0, y:Int=0, value:Int=0) {
    super(x,y);
    makeGraphic(50, 50, FlxColor.RED);
    alpha = value / 2048;
  }

}
