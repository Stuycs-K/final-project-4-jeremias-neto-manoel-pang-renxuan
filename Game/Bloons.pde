import java.util.*;
public class Bloons{
  private ArrayList<Guiders> path = new ArrayList<Guiders>();
  private int row, col, hp, speed;
  private boolean alive = true;
  private int counter = 0;
  
  public Bloons(int x, int y, int hp, int speed, ArrayList<Guiders> guide){
    row = y; col = x; this.hp = hp; this.speed = speed; path = guide;
    alive = true;
  };
  
  public void act(){
    if (counter != guide.size()){
    float distance = dist(getX(), getY(), guide.get(counter).getX(), guide.get(counter).getY());
    //System.out.println(distance);
    if (alive && distance > 3){
      float xComp = (guide.get(counter).getX() - this.getX());
      float yComp = (guide.get(counter).getY() - this.getY());
      PVector move = new PVector(xComp, yComp);
      move.normalize();
      move.mult(speed);
      //System.out.println(move);
      col = (int) move.x + col;
      row = (int) move.y + row;
    }
    else if (distance < speed*2){
      counter ++;
      if (counter != guide.size())
        act();
      }
    }
  }
  
  public int getX(){
    return col;
  }
  
  public int getY(){
    return row;
  }
  
  public boolean hit(){
    Dart cur = null;
    for (Dart d : DartList){
      cur = d;
      if (dist(getX(), getY(), d.getX(), d.getY()) < 30){
        //d.pierced();
        return true;
      }
    }
    //if (cur != null && cur.getPierce() == 0) DartList.remove(cur);
    return false;
  }
  
  public boolean pop(){
    this.hp--;
    if (hp <= 0) return true;
    return false;
  }
  
  public int getCounter(){
    return counter;
  }
}
