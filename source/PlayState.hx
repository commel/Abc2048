package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

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
        drawGameField();
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

  private function drawGameField():Void {
    var gf = game.getCurrentState();
    for (row in 0...4) {
      for (col in 0...4) {
        var value = gf[col][row];
        trace('Adding entity for $row/$col with value $value');

        add(new Entity(row*75, col*75, value));
      }
    }
  }

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

    if (game.hasLost()) {
      trace("You've lost!");
      var lostTxt = new FlxText(20, 0, 0, "Game Over");
      lostTxt.alignment = "center";
      lostTxt.screenCenter(true, false);
      add(lostTxt);
      return;
    }

    if (game.hasWon()) {
      trace("You've won!");
      var winTxt = new FlxText(20, 0, 0, "You've won - congratulations!");
      winTxt.alignment = "center";
      winTxt.screenCenter(true, false);
      add(winTxt);
      return;
    }

    if (FlxG.keys.justPressed.F1) {
      game.printCurrentState();
    }

    if (FlxG.keys.justPressed.F2) {
      game.randomize();
      drawGameField();
    }

    if (FlxG.keys.justPressed.LEFT) {
      game.shiftLeft();
      drawGameField();
    }

    if (FlxG.keys.justPressed.RIGHT) {
      game.shiftRight();
      drawGameField();
    }

    if (FlxG.keys.justPressed.UP) {
      game.shiftUp();
      drawGameField();
    }

    if (FlxG.keys.justPressed.DOWN) {
      game.shiftDown();
      drawGameField();
    }
	}

}
