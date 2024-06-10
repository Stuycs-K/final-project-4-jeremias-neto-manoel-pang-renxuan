public void backgroundAndMap(){
  image(grass, 0, 0);
  road.resize(0,50);
  for (int row = 0; row < map.length; row++){
    for (int col = 0; col < map[0].length; col++){
      if (map[row][col] == '@' || map[row][col] == 'E' || map[row][col] == 'F' || map[row][col] == 'B'){
        if (map[row][col] == 'B'){
          start[0] = col*50-50;
          start[1] = row*50+25;
          start[2] = col;
          start[3] = row;
        }
        image(road,col*50, row*50);
        mapInfo.add(new int[] {row, col});
      }
    }
  }
  placeGuiders(start[2], start[3]);
}

public void songSelection(){
  if(!(BGM1.isPlaying() || BGM2.isPlaying() ||BGM2s.isPlaying() ||BGM3.isPlaying() ||BGM4.isPlaying() ||BGM5.isPlaying() ||BGM6.isPlaying() ||BGM7.isPlaying() ||BGM8.isPlaying())){
    int songSel = (int)(Math.random()*8);
    if (songSel == 0){
      BGM1.play();
    }
    if (songSel == 1){
      int easteregg = (int)(Math.random()*10);
      if(easteregg == 1){
        BGM2s.play();
        cur = BGM2s;
      }
      else{
        BGM2.play();
        cur = BGM2;
      }
    }
    if (songSel == 2){
      BGM3.play();
      cur = BGM3;
    }
    if (songSel == 3){
      BGM4.play();
      cur = BGM4;
    }
    if (songSel == 4){
      BGM5.play();
      cur = BGM5;
    }
    if (songSel == 5){
      BGM6.play();
      cur = BGM6;
    }
    if (songSel == 6){
      BGM7.play();
      cur = BGM7;
    }
    if (songSel == 7){
      BGM8.play();
      cur = BGM8;
    }
  }
}

public void background(){
  image(grass, 0, 0);
  for (int[] x : mapInfo) 
  image(road, x[1]*50, x[0]*50);
  fill(203, 145, 79);
  rect(1500,0,300,1000);
  imageMode(CENTER);
  image(heart, 85, 38);
  imageMode(CORNERS);
  image(coins, 130, 5);
  textSize(40);
  fill(255);
  text(life, 95, 55);
  text("$" + money, 250, 55);
  if (rounds >= 1) text("Round " + rounds + "/40", 1350, 55);
}

public void bloonInteraction(){
  for (int i = 0; i < bloons.size(); i ++){
    if (//bloons.get(i).getType() == MOAB ||
        bloons.get(i).getType() == lead ||
        bloons.get(i).getType() == Ceram1 || 
        bloons.get(i).getType() == Ceram2 || 
        bloons.get(i).getType() == Ceram3 || 
        bloons.get(i).getType() == Ceram4 || 
        bloons.get(i).getType() == Ceram5){
          image(bloons.get(i).getType(), bloons.get(i).getX()-25, bloons.get(i).getY()-55);
        }
    else if (bloons.get(i).getType() != MOAB) image(bloons.get(i).getType(), bloons.get(i).getX()-50, bloons.get(i).getY()-65);
    bloons.get(i).act();
    if(bloons.get(i).hit()){
      if(bloons.get(i).pop()){
      bloons.remove(bloons.get(i));
      i--;
      }
    }
    if (i >= 0 && bloons.get(i).getCounter() == guide.size()){
      life-= bloons.get(i).getHP();
      if (life <= 0) {gameOver = true; break;};
      bloons.remove(bloons.get(i));
      i--;
    }
  }
}

public void monkeySpawning(){
  for (Monkey m : monkeyList){
    m.update();
    if (m.getMode()){
      sidebar.makeUpgrade();
      upgradeMonkey = m;
    }
  }
}

public void sidebarUpdate(){
  sidebar.update();
  if (placingMonkey != null){
    boolean canPlace = placingMonkey.placing();
    if (canPlace){
      monkeyList.add(placingMonkey);
      placingMonkey.setX(mouseX);
      placingMonkey.setY(mouseY);
      placingMonkey.setModeNH();
      placingMonkey = null;
    }
  }
}

public void showFPS(){
  fill(255);
  textSize(18);
  text(frameRate,30,20);
  textSize(18);
  tick = tick % tickMax;
}

public void dartUpdate(){
  for (int i = 0; i < DartList.size(); i ++){
     Dart dart = (Dart)DartList.get(i);
     if(dart.update()){
       DartList.remove(dart);
       i--;
     }
  }
}

public void sidebarOnClick(){
  if(mouseX > 1500){
    for (Monkey monkey : monkeyList){
      if(sidebar.isShop()){
        monkey.setModeNH();
      }
    }
    sidebar.onClick();
  }
  else{
    sidebar.makeShop();
    int shortestDist = 1000;
    Monkey closestMonkey = null;
    for (Monkey monkey : monkeyList){
      if (dist(monkey.getX(), monkey.getY(), mouseX, mouseY) < shortestDist){
        shortestDist = (int)(dist(monkey.getX(), monkey.getY(), mouseX, mouseY)+1);
        closestMonkey = monkey;
      }
      monkey.setModeNH();
    }
    if (closestMonkey != null && shortestDist <= closestMonkey.getSize()){
      closestMonkey.setModeH();
    }
  }
}

public void bloons(int x, int y){
  if (!r.empty()){
    String bloon = r.getInfo();
    if (bloon.equals("done")) {
      if (bloons.size() != 0){
        r.foundDone();
        tick = 1;
        return;
      }
      money += rounds + 100;
      started = false;
    }
    else if (bloon.startsWith("max")){
      tickMax = Integer.parseInt(bloon.substring(4, bloon.length()));
    }
    else {
      Bloons b = new Bloons(x, y, bloon);
      bloons.add(b);
    }
  }
}

public void placeGuiders(int startx, int starty){
  if (startx < 0 || starty < 0 || startx >= map[0].length || starty >= map.length) return;
  char check = map[starty][startx];
  if (check != 'E' && check != '@' && check != 'B' && check != 'F'){
    return;
  }
  else{
    guide.add(new Guiders(startx*50+25, starty*50+25));
    map[starty][startx] = '#';
    placeGuiders(startx+1, starty);
    placeGuiders(startx-1, starty);
    placeGuiders(startx, starty+1);
    placeGuiders(startx, starty-1);
  }
}
