import java.util.*;
char[][] map;
ArrayList<int[]> mapInfo;
ArrayList<Bloons> bloons;
LinkedList<Guiders> guide;
PImage grass;
PImage road;

void setup(){
  grass = loadImage("grass.jpg");
  road = loadImage("road.jpg");
  size(1800, 1000);
  rect(1500,0,300,1000);
  map = new Map(30,20).getMap();
  grass.resize(0,750);
}

void background(){
  
}
