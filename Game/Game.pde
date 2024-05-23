import java.util.*;
char[][] map;
ArrayList<int[]> mapInfo = new ArrayList<int[]>(15);
ArrayList<Bloons> bloons = new ArrayList<Bloons>(15);
ArrayList<Guiders> guide = new ArrayList<Guiders>();
PImage grass;
PImage road;
int[] start = new int[2];

void setup(){
  grass = loadImage("grass.jpg");
  road = loadImage("road.jpg");
  size(1800, 1000);
  rect(1500,0,300,1000);
  map = new Map(20,30).getMap();
  grass.resize(750,1000);
  image(grass, 0, 0);
  image(grass, 750, 0);
  road.resize(0,50);
  for (int row = 0; row < map.length; row++){
    for (int col = 0; col < map[0].length; col++){
      if (map[row][col] == '@' || map[row][col] == 'E' || map[row][col] == 'F' || map[row][col] == 'B'){
        if (map[row][col] == 'B'){
          start[0] = col*50-50;
          start[1] = row*50+25;
        }
        image(road,col*50, row*50);
        mapInfo.add(new int[] {row, col});
        guide.add(new Guiders(col*50+25, row*50+25));
      }
    }
  }
  bloons(start[0], start[1]);
}

void draw(){
  background();
  for (Bloons b : bloons){
    circle(b.getX(), b.getY(), 50);
    b.act();
  }
}

void background(){
  image(grass, 0, 0);
  image(grass, 750, 0);
  for (int[] x : mapInfo) 
  image(road, x[1]*50, x[0]*50);
  for (Guiders x : guide){
    circle(x.getX(), x.getY(), 10);
  }
}

void bloons(int x, int y){
  Bloons red = new Bloons(x, y, 1, 3, guide);
  bloons.add(red);
}
