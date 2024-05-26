import java.util.*;
public class Bloons{
  private int row, col, hp, speed;
  private int counter = 0;
  boolean isCamo;
  PImage type = null;
  int IFrame = 0;
  
  public Bloons(int x, int y, String type){
    if (type.equals("red")){
      row = y; col = x; this.hp = 1; this.speed = 3; isCamo = false;
      this.type = red;
    }
    else if (type.equals("blue")){
      row = y; col = x; this.hp = 2; this.speed = 3; isCamo = false;
      this.type = blue;
    }
  }
  public Bloons(int x, int y, int hp, int speed, boolean camo){
    row = y; col = x; this.hp = hp; this.speed = speed; isCamo = camo;
  };
  
  public void act(){
    if (counter != guide.size()){
    float distance = dist(getX(), getY(), guide.get(counter).getX(), guide.get(counter).getY());
    //System.out.println(distance);
    if (distance > 3){
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
    if (IFrame > 0) IFrame--;
    Dart cur = null;
    for (Dart d : DartList){
      cur = d;
      if (dist(getX(), getY(), d.getX(), d.getY()) < 30 && IFrame == 0){
        //d.pierced();
        IFrame = 10;
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
  
  public PImage getType(){
    if (hp == 2) return blue;
    else return red;
  }
}
