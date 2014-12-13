package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;
using FlxSpriteExtender;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
    trace("created Menustate");
		super.create();

    var title = new FlxText(0, 30, 0, "Haxe2048", 36);
    title.h_center();

    add(title);

    var startButton = new FlxButton(0, 100, "Start", startClicked);
    startButton.h_center();
    add(startButton);

    var quitButton = new FlxButton(0, 140, "Quit", quitClicked);
    quitButton.h_center();
    add(quitButton);
	}

  private function startClicked():Void {
    trace("start clicked");
    FlxG.switchState(new PlayState());
  }

  private function quitClicked():Void {
    Sys.exit(0);
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
