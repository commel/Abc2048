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

  private function shiftLeft(x:Int, y:Int, value:Int):Void {
    // sind wir schon am rand?
    if (x < 0) {
      return;
    }

    // ist das feld bereits gefüllt?
    if (gameField[x][y] != 0) {
      // ist es derselbe wert wie unserer?
      if (gameField[x][y] == value) {
        
      }
    }

    shiftLeft(x-1, y, value);
  }

  public function shiftLeft():Void {
    trace("left");
    for(row in 0...4) {
      for(col in 0...4) {
        // Ganz links gehts nicht weiter
        if (col == 0) {
          continue;
        }

        // Leere Felder garnicht beachten
        if (gameField[row][col] == 0) {
          continue;
        }

        // Wert des Nachbarn ermitteln
        var neighbor = gameField[row][col-1];

        
        // Wert um eins nach links verschieben 

      }
    }
  }

  public function shiftRight():Void {
    trace("right");
  }

  public function shiftUp():Void {
    trace("up");
  }

  public function shiftDown():Void {
    trace("down");
  }

}
