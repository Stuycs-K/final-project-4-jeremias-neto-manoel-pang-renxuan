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
    else if (type.equals("green")){
      row = y; col = x; this.hp = 3; this.speed = 3; isCamo = false;
      this.type = green;
    }
    else if (type.equals("yellow")){
      row = y; col = x; this.hp = 4; this.speed = 4; isCamo = false;
      this.type = yellow;
    }
    else if (type.equals("pink")){
      row = y; col = x; this.hp = 5; this.speed = 5; isCamo = false;
      this.type = pink;
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
  
  public int getHP(){
    return hp;
  }
  
  public boolean hit(){
    if (IFrame > 0) IFrame--;
    for (Dart d : DartList){
      if (dist(getX(), getY(), d.getX(), d.getY()) < 30 && IFrame == 0){
        //d.pierced();
        IFrame = 10;
        return true;
      }
    }
    return false;
  }
  
  public boolean pop(){
    if (hp == 4 || hp == 5) speed --;
    this.hp--;
    money++;
    if (hp <= 0) return true;
    return false;
  }
  
  public int getCounter(){
    return counter;
  }
  
  public PImage getType(){
    if (hp == 5) return pink;
    if (hp == 4) return yellow;
    if (hp == 3) return green;
    if (hp == 2) return blue;
    else return red;
  }
}
