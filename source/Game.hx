class Game {

  private var gameField:Array<Array<Int>> = [ [0,0,0,0], 
                                              [0,0,0,0],
                                              [0,0,0,0],
                                              [0,0,0,0]  ];

  private var initialized:Bool = false;

  public function new():Void { }

  private function addNewEntity():Void {
    var valueSet = false;
    while (!valueSet) {
        var x = Std.random(4);
        var y = Std.random(4);

        trace('Random Field x=$x,y=$y');

        if (gameField[x][y] == 0) {
            gameField[x][y] = 2;
            valueSet = true;
        }
    }
  }

  public function hasLost():Bool {
    var zerosLeft:Int = 0;
    for (row in gameField) {
        for (i in 0...4) {
            if (row[i] == 0) {
                zerosLeft++;
            }
        }
    }

    return zerosLeft == 0; // No zeros left, you have lost
  }

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

    var n = new Array<Int>();

    for(i in 0...4) {
        if (i == 4) {
            n.push(i);
            continue;
        }
        if (l[i] == l[i+1]) {
            n.push(l[i] * 2);
            l[i] = 0;
            l[i+1] = 0;
            continue;
        }
        n.push(l[i]);
    }

    return cleanLine(n);
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
    for (i in 0...4) {
        var res = shift(gameField[i]);
        res.reverse(); // modify to return to unnormalized state
        gameField[i] = res;
    }
    addNewEntity();
  }

  public function shiftRight():Void {
    trace("shift right");
    for (i in 0...4) {
        gameField[i] = shift(gameField[i]);
    }
    addNewEntity();
  }

  public function shiftUp():Void {
    trace("shift up");

    for (c in 0...4) {
        var col:Array<Int>(4);
        for(row in 0...4) {
            col.push(gameField[row][c]);
        }
    }

    shift(col);

    addNewEntity();
  }

  public function shiftDown():Void {
    trace("shift down");
    addNewEntity();
  }

}
