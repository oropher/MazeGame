import java.util.List;
import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.Deque;


class Maze{


  private int rows;
  private int cols;
  private Cell cells[][];
  private List<Cell> neighborsList = new ArrayList();
  private Deque<Cell> stack;

  public Maze(int rowSize, int colSize){
    this.rows = floor(height / rowSize);
    this.cols = floor(width / colSize);
    cells = new Cell[rows][cols];
    for(int i = 0; i<rows; i++){
      for(int j = 0; j<cols; j++){
        cells[i][j] = new Cell(i, j, rowSize, colSize);
      }
    }
  }


  public void show(){
    for(int i = 0; i<rows; i++){
      for(int j = 0; j<cols; j++){
        cells[i][j].show();
      }
    }
  }

  public void evalCell(int x, int y){
    stack = new ArrayDeque();
    cells[x][y].visited = true;
    stack.push(cells[x][y]);
    while(!stack.isEmpty()){
      Cell currentCell = stack.pop();
      currentCell.hightlight();
      if(hasUnvisitedNeighbors(currentCell)){
        stack.push(currentCell);
        Cell choosenCell = getUnvisitedNeighbor();
        neighborsList.clear();
        removeWalls(currentCell, choosenCell);
        choosenCell.visited = true;
        choosenCell.show();
        stack.push(choosenCell);
      }
    }
  }
  
  
  public void removeWalls(Cell current, Cell choosen){
    int x = current.x - choosen.x;
    if(x == 1){
      current.walls[3].setActive(false);
      choosen.walls[1].setActive(false); 
    } else if(x==-1){
      current.walls[1].setActive(false);
      choosen.walls[3].setActive(false);
    }
    int y = current.y - choosen.y;
    if(y == 1){
      current.walls[0].setActive(false);
      choosen.walls[2].setActive(false); 
    } else if(y==-1){
      current.walls[2].setActive(false);
      choosen.walls[0].setActive(false);
    } 
  }
  
  
  public Cell getUnvisitedNeighbor(){
    int i = floor(random(0, neighborsList.size()));
    return neighborsList.get(i);
  }
  
  
  public boolean hasUnvisitedNeighbors(Cell cell){
    int x = cell.x;
    int y = cell.y;
    Cell top =
    getCellAt(x, y-1);
    Cell right = getCellAt(x+1, y);
    Cell bottom = getCellAt(x, y+1);
    Cell left = getCellAt(x-1, y);
    if(top != null && !top.visited){
      neighborsList.add(top);
    }
    if(right!= null && !right.visited){
      neighborsList.add(right);
    }
    if(bottom!= null && !bottom.visited){
      neighborsList.add(bottom);
    }
    if(left!= null && !left.visited){
      neighborsList.add(left);
    }
    if(!neighborsList.isEmpty()){
      return true;
    }
    return false;
  }
  
  public Cell getCellAt(int x, int y){
    if(x<0 || y<0 || x>cols-1 || y>rows-1){
     return null;
    }
    return cells[x][y];
  }

}
