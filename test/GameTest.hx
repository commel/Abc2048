class GameTest extends haxe.unit.TestCase {

  var g:Game;

  public override function setup():Void {
    g = new Game();
  }

  public function testGame1():Void {
    assertArrayEquals([0,0,0,0], g.shift([0,0,0,0]));
  }

  public function testShiftSingleValue():Void {
   assertArrayEquals([0,0,0,2], g.shift([2,0,0,0]));
   assertArrayEquals([0,0,0,2], g.shift([0,2,0,0]));
   assertArrayEquals([0,0,0,2], g.shift([0,0,2,0]));
   assertArrayEquals([0,0,0,2], g.shift([0,0,0,2]));
  }

  public function testShiftSingleValueWithOther():Void {
   assertArrayEquals([0,0,2,4], g.shift([2,0,4,0]));
   assertArrayEquals([0,0,2,4], g.shift([0,2,4,0]));
   assertArrayEquals([0,0,2,4], g.shift([0,0,2,4]));
  }

  private function assertArrayEquals(a: Array<Int>, b: Array<Int>):Void {
    assertEquals(a.length, b.length);
    for (i in 0...a.length) {
      assertEquals(a[i], b[i]);
    }
  }

  static function main():Void {
    var runner = new haxe.unit.TestRunner();
    runner.add(new GameTest());
    var success = runner.run();
    Sys.exit(success ? 0 : 1);
  }

}
