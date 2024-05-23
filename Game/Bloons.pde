import java.util.*;
public class Bloons{
  private ArrayList<Guiders> path = new ArrayList<Guiders>();
  private int row, col, hp, speed;
  private boolean alive = true;
  
  public Bloons(int x, int y, int hp, int speed, ArrayList<Guiders> guide){
    row = y; col = x; this.hp = hp; this.speed = speed; path = guide;
    alive = true;
  };
  
  public void act(){
    float distance = dist(getX(), getY(), guide.get(0).getX(), guide.get(0).getY());
    PVector position = new PVector(col, row);
    if (alive && distance > 5){
      float xComp = (guide.get(0).getX() - getX());
      float yComp = (guide.get(0).getY() - getY());
      PVector move = new PVector(xComp, yComp);
      move.normalize();
      move.mult(speed);
      position.add(move);
      col = (int) position.x;
      row = (int) position.y;
    }
    else if (distance < 5){
      guide.remove(0);
      //act();
    }
  }
  
  public int getX(){
    return col;
  }
  
  public int getY(){
    return row;
  }
}
