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
  private var scoreLabel:FlxText;
  private var scoreValue:FlxText;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
        trace("Entered Playstate");
        game = new Game();
        game.start();

        scoreLabel = new FlxText(20, 400, 150, "Score:");
        scoreValue = new FlxText(60, 400, 150, "0");

        add(scoreLabel);
        add(scoreValue);
        repaint();

	}

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	    game = null;
	  scoreLabel.destroy();
        scoreLabel = null;
        scoreValue.destroy();
        scoreValue = null;
	}
  
  private function repaint():Void {
    drawGameField();
    updateScore();
  }

  // updates the score
  private function updateScore():Void {
    scoreValue.text = Std.string(game.getCurrentScore());
  }

  // Updates the game field
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
      var gos = new GameOverState(game.getCurrentScore());
      FlxG.switchState(gos);
      return;
    }

    if (game.hasWon()) {
      var gos = new GameWonState(game.getCurrentScore());
      FlxG.switchState(gos);
      return;
    }

    if (FlxG.keys.justPressed.F1) {
      game.printCurrentState();
    }

    if (FlxG.keys.justPressed.F2) {
      game.randomize();
      repaint();
    }

    if (FlxG.keys.justPressed.LEFT) {
      game.shiftLeft();
      repaint();
    }

    if (FlxG.keys.justPressed.RIGHT) {
      game.shiftRight();
      repaint();
    }

    if (FlxG.keys.justPressed.UP) {
      game.shiftUp();
      repaint();
    }

    if (FlxG.keys.justPressed.DOWN) {
      game.shiftDown();
      repaint();
    }

    if (FlxG.keys.justPressed.F9) {
      game.instaWin();
      repaint();
    }
	}

}
