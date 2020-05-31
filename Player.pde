class Player{
  private int x;
  private int y;
  private int movement;
  
  public Player(int x, int y, int movement){
    this.x = x;
    this.y = y;
    this.movement = movement;
  }
  
  public void show(){
    push();
    translate(this.x, this.y);
    stroke(51);
    fill(51);
    circle(0, 0, 10);
    pop();
  }
  
  public void update(int xDiff, int yDiff) {
    this.x += xDiff;
    this.y += yDiff;
  }
  
}
