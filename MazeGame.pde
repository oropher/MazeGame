
Maze maze;
Ray[] rays;
int rowSize = 50;
int colSize = 50;
int raysNo = 18;
float distMax = 50;
Player player;
boolean up;
boolean down;
boolean left;
boolean right;

void setup(){
  size(501, 501);
  maze = new Maze(rowSize, colSize);
  maze.evalCell(0, 0);
  rays = new Ray[raysNo];
  for(int i = 0; i < raysNo; i++){
    float angle = TWO_PI / raysNo * i;
    rays[i] = new Ray(100, 200, new PVector(1*cos(angle), 1*sin(angle)));
  }
  player = new Player(25, 25, 4);
}


void draw(){
  background(50, 125, 168);
  //maze.show();
  showRays();
  int mov[] = getMovement();
  player.update(mov[0], mov[1]);
  player.show();
}

public int[] getMovement(){
  int mov[] = new int[2];
  mov[0] = 0;
  mov[1] = 0;
  if(up){
    mov[1]--;
  }
  if(down){
    mov[1]++;
  }
  if(left){
    mov[0]--;
  }
  if(right){
    mov[0]++;
  }
  return mov;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      up = true;
    } 
    if (keyCode == DOWN) {
      down = true;
    } 
    if (keyCode == RIGHT) {
      right = true;
    } 
    if (keyCode == LEFT) {
      left = true;
    } 
  }
  loop();
}

void keyReleased(){
  if (key == CODED) {
    if (keyCode == UP) {
      up = false;
    } 
    if (keyCode == DOWN) {
      down = false;
    } 
    if (keyCode == RIGHT) {
      right = false;
    } 
    if (keyCode == LEFT) {
      left = false;
    } 
  }
}

public void showRays(){
  for(int rayIndex = 0; rayIndex<raysNo; rayIndex++) {
    Ray ray = rays[rayIndex];
    //ray.updatePos(mouseX, mouseY);
    ray.updatePos(player.x, player.y);
    PVector punto = null;
    float minDist = 9999999999f;
    Cell cells[][] = maze.cells;
    for(int iCellIdx = 0; iCellIdx < cells.length; iCellIdx++) {
      for(int jCellIdx = 0; jCellIdx < cells[iCellIdx].length; jCellIdx++) {
        Wall[] walls = cells[iCellIdx][jCellIdx].walls;
        for(int wallIndex = 0; wallIndex < walls.length; wallIndex++) {
          PVector puntoAux = ray.cast(walls[wallIndex]);
          if(puntoAux == null){
            continue;
          }
          float distAux = PVector.dist(puntoAux, ray.pos);
          if(distAux < minDist && distAux <= distMax){
            if(distAux <= 8){
            }
            punto = puntoAux;
            minDist = distAux;
            walls[wallIndex].show();
          }
        }
      }
    }
    if(punto != null) {
      ray.show(punto);
    }
  }
}
