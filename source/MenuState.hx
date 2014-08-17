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
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
    trace("created Menustate");
		super.create();

    var title = new FlxText(100, 100, 200, "Haxe2048");
    title.alignment = "center";
    title.size = 20;
    add(title);

    var startButton = new FlxButton(0, 0, "Start", startClicked);
    add(startButton);
    startButton.screenCenter();

    var quitButton = new FlxButton(0, 0, "Quit", quitClicked);
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
