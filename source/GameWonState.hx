package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;

/**
 * A FlxState which can be used for the game's menu.
 */
class GameWonState extends FlxState
{

  private var score:Int;

  public function new(score:Int):Void {
    super();
    this.score = score;
  }

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
    trace("created GameWonState");
		super.create();

    var go = new FlxText(20, 0, 0, "Game Over");
    go.alignment = "center";
    go.screenCenter(false, true);
    go.size = 20;
    add(go);

    var text = new FlxText(20, 0, 0, "Winner!\nYour Score was " + Std.string(score) + ".");
    text.alignment = "center";
    text.screenCenter(true, false);

    var btnBack = new FlxButton(0, 0, "Back", backToMenuClicked);
    add(btnBack);

    add(text);
	}

  private function backToMenuClicked():Void {
    FlxG.switchState(new MenuState());
  }

	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
