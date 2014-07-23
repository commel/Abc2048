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

  private var gameField:Array<Array<Int>> = [ [0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0] ];

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
    trace("Entered Playstate");

    var btn = new FlxButton(100, 100, "Points!", clickForPoints);
    add(btn);
    drawState();
	}

  private function hasWinningCondition():Bool {
    for (row in 0...4) {
      for (col in 0...4) {
        if (getValue(row, col) >= 2048) {
          return true;
        }
      }
    }
    return false;
  }

  private function getValue(x:Int, y:Int):Int {
    return gameField[x][y];
  }

  private function setValue(x:Int, y:Int, value:Int):Void {
    gameField[x][y] = value;
  }

  private function increment(x:Int, y:Int):Void {
    var previousVal:Int = getValue(x,y);

    setValue(x,y, getNewState(getValue(x,y)));
  }

  private function getNewState(value:Int):Int {
    return value == 0 ? 2 : value * 2;
  }

  private function createEntity(x:Int, y:Int):Entity {
    return new Entity( (x+1)*30, (y+1)*30, getValue(x,y) );
  }

  private function drawState():Void {
    for (row in 0...4) {
      for (col in 0...4) {
        add(createEntity(row, col)); 
      }
    }
  }

  private function printState():Void {
    for (row in gameField) {
      trace('$row');
    }
  }

  private function clickForPoints():Void {
    increment(0,0);
    if (hasWinningCondition()) {
      var winnerText = new FlxText(0, 0, "GEWONNEN!");
      add(winnerText);
      winnerText.screenCenter();
    }
    printState();
    drawState();
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
