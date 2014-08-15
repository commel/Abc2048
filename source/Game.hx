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

    var mergedVals = new Map<Int, Bool>();
    for(i in 0...4) {
        if (i == 4) {
            n.push(i);
            continue;
        }
        if (l[i] == l[i+1] && !mergedVals.exists(l[i] * 2)) {
            mergedVals.set(l[i] * 2, true);
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
        var line = gameField[i];
        line.reverse();
        var res = shift(line);
        res.reverse();
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
   
    for (row in 0...4) {
      // normalise row
      var c = [ gameField[3][row], gameField[2][row], gameField[1][row], gameField[0][row] ];
      var res = shift(c);

      gameField[0][row] = res[3];
      gameField[1][row] = res[2];
      gameField[2][row] = res[1];
      gameField[3][row] = res[0];
    }
    
    addNewEntity();
  }

  public function shiftDown():Void {
    trace("shift down");

    for (row in 0...4) {
      var c = [ gameField[0][row], gameField[1][row], gameField[2][row], gameField[3][row] ];
      trace("column        : " + c);
      var res = shift(c);
      trace("shifted column: " + res);

      gameField[0][row] = res[0];
      gameField[1][row] = res[1];
      gameField[2][row] = res[2];
      gameField[3][row] = res[3];
    }

    addNewEntity();
  }

}
