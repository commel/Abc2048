class GameTest extends haxe.unit.TestCase {

  var g:Game;

  public override function setup():Void {
    g = new Game();
  }

  public function testShiftEmpty():Void {
    assertEquals(Std.string([0,0,0,0]), Std.string(g.shift([0,0,0,0])));
  }

  public function testShiftSingleValue():Void {
   assertEquals(Std.string([0,0,0,2]), Std.string(g.shift([2,0,0,0])));
   assertEquals(Std.string([0,0,0,2]), Std.string(g.shift([0,2,0,0])));
   assertEquals(Std.string([0,0,0,2]), Std.string(g.shift([0,0,2,0])));
   assertEquals(Std.string([0,0,0,2]), Std.string(g.shift([0,0,0,2])));
  }

  public function testStrangeToggling():Void {
   assertEquals(Std.string([0,0,4,2]), Std.string(g.shift([0,0,4,2])));
  }

  public function testShiftMerge():Void {
    assertEquals(Std.string([0,2,2,4]), Std.string(g.shift([2,2,2,2])));
  }

  public function testShiftMerge4():Void {
    assertEquals(Std.string([0,0,4,4]), Std.string(g.shift([2,0,2,4])));
  }
  
  public function testShiftMerge3():Void {
    assertEquals(Std.string([0,0,4,16]), Std.string(g.shift([2,2,8,8])));
  }

  public function testShiftMerge2():Void {
      assertEquals(Std.string([0,0,0,8]), Std.string(g.shift([0,0,4,4])));
  }

  static function main():Void {
    var runner = new haxe.unit.TestRunner();
    runner.add(new GameTest());
    var success = runner.run();
    Sys.exit(success ? 0 : 1);
  }

}
