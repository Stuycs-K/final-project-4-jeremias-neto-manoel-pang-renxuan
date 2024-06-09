import java.util.*;
public class Bloons{
  private int row, col, hp;
  float speed;
  private int counter = 0;
  PImage type = null;
  int IFrame = 0;
  Dart D;
  
  public Bloons(int x, int y, String type){
    if (type.equals("red")){
      row = y; col = x; this.hp = 1; this.speed = 3;
      this.type = red;
    }
    else if (type.equals("blue")){
      row = y; col = x; this.hp = 2; this.speed = 3;
      this.type = blue;
    }
    else if (type.equals("green")){
      row = y; col = x; this.hp = 3; this.speed = 3;
      this.type = green;
    }
    else if (type.equals("yellow")){
      row = y; col = x; this.hp = 4; this.speed = 4;
      this.type = yellow;
    }
    else if (type.equals("pink")){
      row = y; col = x; this.hp = 5; this.speed = 5;
      this.type = pink;
    }
    else if (type.equals("black")){
      row = y; col = x; this.hp = 6; this.speed = 3;
      this.type = black;
    }
    else if (type.equals("white")){
      row = y; col = x; this.hp = 6; this.speed = 3;
      this.type = white;
    }
    else if (type.equals("zebra")){
      row = y; col = x; this.hp = 7; this.speed = 3;
      this.type = zebra;
    }
    else if (type.equals("rainbow")){
      row = y; col = x; this.hp = 8; this.speed = 3;
      this.type = rainbow;
    }
    else if (type.equals("ceram")){
      row = y; col = x; this.hp = 8+10; this.speed = 3;
      this.type = Ceram1;
    }
    else if (type.equals("lead")){
      row = y; col = x; this.hp = 7; this.speed = 3;
      this.type = lead;
    }
    else if (type.equals("Massive Ordinary Air Blimp")){
      row = y; col = x; this.hp = 272; this.speed = 2;
      this.type = MOAB;
    }
    else{
      row = y; col = x; this.hp = 3; this.speed = 3;
      this.type = green;
    } 
  }
  
  public void act(){
    if (counter != guide.size()){
    float distance = dist(getX(), getY(), guide.get(counter).getX(), guide.get(counter).getY());
    if (distance > 3){
      float xComp = (guide.get(counter).getX() - this.getX());
      float yComp = (guide.get(counter).getY() - this.getY());
      PVector move = new PVector(xComp, yComp);
      move.normalize();
      move.mult(speed);
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
      if (dist(getX(), getY(), d.getX(), d.getY()) < 30 && IFrame == 0 && d.getPierce() > 0){
        d.pierced();
        if (getType() == black && d.getProjType() == 3) return false;
        if (getType() == zebra && d.getProjType() == 3) return false;
        if (getType() == lead && d.getProjType() == 1) return false;
        POP.play();
        image(pop, getX()-35, getY()-45);
        IFrame = 10;
        D = d;
        return true;
      }
    }
    return false;
  }
  
  public boolean pop(){
    int dmg = D.getDamage();
    return pop(dmg);
  }
  
  public boolean pop(int dmg){
    if (dmg >= getHP()) {money += getHP(); return true;}
    if (hp > 18 && hp <= 72){
      Bloons extra = new Bloons(getX(), getY(), "ceram");
      Bloons extra2 = new Bloons(getX()-3, getY()-3, "ceram");
      Bloons extra3 = new Bloons(getX()-5, getY()-5, "ceram");
      Bloons extra4 = new Bloons(getX()-7, getY()-7, "ceram");
        extra.setCounter(this.getCounter());
        extra.setIFrame(7);
        extra.setSpeed();
        extra2.setCounter(this.getCounter());
        extra2.setIFrame(7);
        extra2.setSpeed();
        extra3.setCounter(this.getCounter());
        extra3.setIFrame(7);
        extra3.setSpeed();
        extra4.setCounter(this.getCounter());
        extra4.setIFrame(7);
        extra4.setSpeed();
     bloons.add(extra);
     bloons.add(extra2);
     bloons.add(extra3);
     bloons.add(extra4);
     return true;
    }
    if (hp >= 10 && hp <= 18){
      if (hp == 8){
        Bloons extra = new Bloons(getX(), getY(), "rainbow");
        extra.setCounter(this.getCounter());
        extra.setIFrame(7);
        extra.setSpeed();
        extra.pop(dmg-1);
      }
    }
    if (hp == 8){
      Bloons extra = new Bloons(getX()-5, getY()-5, "zebra");
      extra.setCounter(this.getCounter());
      extra.setIFrame(7);
      extra.setSpeed();
      extra.pop(dmg-1);
      if (dmg > 1){
      Bloons extra2 = new Bloons(getX(), getY(), "zebra");
      extra2.setCounter(this.getCounter());
      extra2.setIFrame(7);
      extra2.setSpeed();
      extra2.pop(dmg-1);
      }
      money += dmg;
      return true;
    }
    if (hp == 7){
      Bloons extra = new Bloons(getX()-5, getY()-5, "white");
      extra.setCounter(this.getCounter());
      extra.setIFrame(7);
      extra.setSpeed();
      extra.pop(dmg-1);
      if (dmg > 1){
      Bloons extra2 = new Bloons(getX(), getY(), "black");
      extra2.setCounter(this.getCounter());
      extra2.setIFrame(7);
      extra2.setSpeed();
      extra2.pop(dmg-1);
      }
      money += dmg;
      return true;
    }
    if (hp == 6){
      Bloons extra = new Bloons(getX(), getY(), "pink");
      Bloons extra2 = new Bloons(getX()-5, getY()-5, "pink");
      extra.takeDMG(dmg-1);
      extra2.takeDMG(dmg-1);
      if (extra2.getHP() == 6) extra2.setType(black);
      extra.setCounter(this.getCounter());
      extra2.setCounter(this.getCounter());
      extra.setIFrame(7);
      extra2.setIFrame(7);
      extra.setSpeed();
      extra2.setSpeed();
      bloons.add(extra);
      bloons.add(extra2);
      money += dmg;
      return true;
    }
    this.hp -= dmg;
    this.setSpeed();
    money += dmg;
    if (hp <= 0) return true;
    return false;
  }
  
  public int getCounter(){
    return counter;
  }
  
  public void takeDMG(int n){
    this.hp-=n;
  }
  
  public PImage getType(){
    if (type == MOAB) return MOAB;
    if (hp == 18 || hp == 17) return Ceram1;
    if (hp == 16 || hp == 15) return Ceram2;
    if (hp == 14 || hp == 13) return Ceram3;
    if (hp == 12 || hp == 11) return Ceram4;
    if (hp == 10 || hp == 9) return Ceram5;
    if (hp == 8) return rainbow;
    if (hp == 7 && type == lead) return lead;
    if (hp == 7) return zebra;
    if (hp == 6 && type == black) return black;
    else if (hp == 6) return white;
    if (hp == 5) return pink;
    if (hp == 4) return yellow;
    if (hp == 3) return green;
    if (hp == 2) return blue;
    else return red;
  }
  
  public void setSpeed(){
    if (this.getHP() == 5) speed = 5;
    else if (this.getHP() == 4) speed = 4;
    else if (this.getHP() > 18) speed = 2;
    else speed = 3;
  }
  
  public void setSpeed(int n){
    speed = n;
  }
  
  public void setIFrame(int n){
    IFrame = n;
  }
  
  public void setCounter(int n){
    counter = n;
  }
  public void setType(PImage n){
    type = n;
  }
}
