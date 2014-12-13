package ;

import flixel.FlxG;
import flixel.FlxSprite;

class FlxSpriteExtender {

  static public function h_center(s: FlxSprite) {
    s.x = (FlxG.width - s.width) / 2;
  }

}
