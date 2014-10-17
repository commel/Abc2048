package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class Entity extends FlxSprite {

    public function new(x:Int=0, y:Int=0, value:Int=0) {
        super(x,y);

        if (value > 0) {
            loadGraphic("assets/images/" + value + ".png");
        } else {
            makeGraphic(32, 32, FlxColor.GRAY);
        }
    }

}
