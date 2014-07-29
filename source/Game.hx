class Game {

  private var gameField:Array<Array<Int>> = [ [0,0,0,0], 
                                              [0,0,0,0],
                                              [0,0,0,0],
                                              [0,0,0,0]  ];

  private var initialized:Bool = false;

  public function new():Void { }

  public function getCurrentState():Array<Array<Int>> {
    return gameField;
  }

  public function printCurrentState():Void {
    trace('field start');

    for (row in gameField) {
      trace('$row');
    }

    trace('field end');
  }

  public function randomize():Void {
    if (initialized) { return; }

    trace("Randomizing start");
    for (_ in 0...2) {
      gameField[Std.random(4)][Std.random(4)] = 2;
    }
    initialized = true;
  }

  public function shift(line:Array<Int>):Array<Int> { 
    var l = cleanLine(line);


    

    return l;
  }

  private function cleanLine(line:Array<Int>):Array<Int> {
     var lst = line.filter(function(v) { return v != 0; });

    // Array links mit nullen auffüllen
    while (lst.length != 4) {
      lst.push(0);
    }

    // umdrehen
    lst.reverse();

    return lst;
  }



  public function shiftLeft():Void {
    trace("shift left");
    for (row in gameField) {
      shift(row);
    }
  }

  public function shiftRight():Void {
    trace("shift right");
  }

  public function shiftUp():Void {
    trace("shift up");
  }

  public function shiftDown():Void {
    trace("shift down");
  }

}
