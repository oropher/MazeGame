

class Wall {

  private PVector a;
  private PVector b;
  private boolean active;

  public Wall(float x1, float y1, float x2, float y2) {
    a = new PVector(x1, y1);
    b = new PVector(x2, y2);
    active = true;
  }

  public void show(){
    if(active) {
      stroke(255);
      line(a.x, a.y, b.x, b.y);
    }
  }
  
  public void setActive(boolean active){
    this.active = active;
  }
  
  public boolean isActive(){
    return this.active;
  }

  public String toString(){
    return "active: " + this.active;
  }
}
