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
    for (row in gameField) {
      trace('$row');
    }
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
    for (i in 0...3) {
      trace('item: $line mit $i');
      // sind wir leer? dann weiter
      if (line[i] == 0) {
        continue;
        trace("Leer dann weiter");
      } else {
        // wir sind nicht leer
        trace("nicht leer");

        // ist der nächste leer?
        if (line[i+1] == 0) {
          trace("nächster ist leer");
          // wert löschen und in den nächsten eintragen
          line[i+1] = line[i];
          line[i] = 0;
        } else {
          // ist der nächste dasselbe wie wir?
          trace("Nächster ist nicht leer");
          if (line[i] == line[i+1]) {
            // zusammenführen
            line[i+1] = line[i] * 2;
            line[i] = 0;
          } else {
            trace("ist unterschiedlich, dann ende");
            // hier ist dann schluss
            continue;
          }
        }
      }
    }

    trace('line2: $line');
    return line;
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
