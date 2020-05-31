
class Cell {
  
  private int x;
  private int y;
  private int rowSize;
  private int colSize;
  private boolean visited = false;
  private Wall[] walls;
 
  public Cell(int x, int y, int rowSize, int colSize){
    this.x = x;
    this.y = y;
    this.rowSize = rowSize;
    this.colSize = colSize;
    int i = x*colSize;
    int j = y*rowSize;
    walls = new Wall[4];
    walls[0] = new Wall(i, j, i+colSize, j);
    walls[1] = new Wall(i+colSize, j, i+colSize, j+rowSize);
    walls[2] = new Wall(i+colSize, j+rowSize, i, j+rowSize);
    walls[3] = new Wall(i, j+rowSize, i, j);
  }

  public void show(){
    int i = x*colSize;
    int j = y*rowSize;
    if(this.visited){
      noStroke();
      //fill(50, 125, 168);
      rect(i, j, rowSize, colSize);
    }
    stroke(255);
    if(walls[0].active){
      line(i, j, i+colSize, j);
    }
    if(walls[1].active){
      line(i+colSize, j, i+colSize, j+rowSize);
    }
    if(walls[2].active){
      line(i+colSize, j+rowSize, i, j+rowSize);
    }
    if(walls[3].active){
      line(i, j+rowSize, i, j);
    }
  }
  
  public void hightlight(){
    int i = x*colSize;
    int j = y*rowSize;
    noStroke();
    fill(0, 0, 255, 100);
    rect(i, j, rowSize, colSize);
  }
  
  public String toString(){
    return "x,y: " + x +", " + y + " walls: " + walls[0] + ", " + walls[1] + ", " + walls[2] + ", " + walls[3];
  }
}
