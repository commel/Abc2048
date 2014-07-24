package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

using flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{

  private var game:Game;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
    trace("Entered Playstate");
    game = new Game();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
    game = null;
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

    if (FlxG.keys.justPressed.F1) {
      game.printCurrentState();
    }

    if (FlxG.keys.justPressed.F2) {
      game.randomize();
    }

    if (FlxG.keys.justPressed.LEFT) {
      game.shiftLeft();
    }

    if (FlxG.keys.justPressed.RIGHT) {
      game.shiftRight();
    }

    if (FlxG.keys.justPressed.UP) {
      game.shiftUp();
    }

    if (FlxG.keys.justPressed.DOWN) {
      game.shiftDown();
    }
	}	
}
