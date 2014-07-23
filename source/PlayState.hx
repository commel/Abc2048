package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{

  private var gameField = new Array<Array<Entity>>();

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
    trace("Entered Playstate");

    for (row in 0...3) {
      for (col in 0...3) {
        trace('Creating $row/$col');
        var r = (row+1) * 10;
        var c = (col+1) * 10;
        gameField[row][col] = new Entity(r, c);
      }
    }
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
    gameField = null;
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
