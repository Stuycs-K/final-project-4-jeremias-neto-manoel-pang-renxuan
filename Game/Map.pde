public class Map{
  private char[][] map;
  private int startRow, startCol;
  public Map(int rows, int cols){
  map = new char[rows][cols];
    for(char[]row:map){
      for(int i = 0; i < row.length;i++){
        row[i]='#';
      }
    }
    carveMaze(1,1);
    placeSE();
    solve();
  }
  
  public void placeSE() {
    for (int i = 0; i < map.length; i ++){
      for (int j = 0; j < map[0].length; j ++){
        if (map[i][j] == '.'){map[i][j] = ' ';}
      }
    }
    boolean placedS = false;
    while(!placedS){
      int rand = (int) (Math.random() * map.length);
      if (map[rand][1] == ' ') {
        map[rand][1] = 'S';
        map[rand][0] = 'F';
        startRow = rand;
        startCol = 1;
        placedS = true;
      }
    }
    boolean placedE = false;
    while(!placedE){
      int rand = (int) (Math.random() * map.length);
      if (map[rand][map[0].length - 2] == ' ') {
        map[rand][map[0].length - 2] = 'E';
        placedE = true;
        map[rand][map[0].length - 1] = 'F';
      }
    }
  }
  
  public int solve(){
    return solve(startRow, startCol);
  }
  
  private int solve(int row, int col){
    if (map[row][col] == 'E') {return 0;}
    if (map[row][col] == '#' || map[row][col] == 'F') {return -1;}
    if (map[row][col] == '@') {return -1;}
    if (map[row][col] == '.') {return -1;}
    else {
      map[row][col] = '@';
      int check = solve(row+1, col);
      if (check > -1){
        return 1 + check;
      }
      if (check < 0){
        check = solve(row-1, col);
        if (check > -1){
          return 1 + check;
        }
      }
      if (check < 0){
        check = solve(row, col-1);
        if (check > -1){
          return 1 + check;
        }
      }
      if (check < 0){
        check = solve(row, col+1);
        if (check > -1){
          return 1 + check;
        }
      }
      map[row][col] = '.';
      return solve(row, col);
    }
  }

  public void carveMaze(int row, int col){
    if (!canCarve(row, col)){
      return;
    }
    else{
      ArrayList<String> moves = new ArrayList<String>(4);
      moves.add("up");
      moves.add("down");
      moves.add("left");
      moves.add("right");

      for (int i = 0; i < 4; i ++){
        int rand = (int)(Math.random()*moves.size());
        String temp = "";
        temp = moves.get(rand);
        moves.remove(temp);

        if (temp.equals("up")){
          map[row][col] = ' ';
          carveMaze(row-1, col);
        }
        
        if (temp.equals("down")){
          map[row][col] = ' ';
          carveMaze(row+1, col);
        }
      
        if(temp.equals("left")){
          map[row][col] = ' ';
          carveMaze(row, col-1);
        }
      
        if(temp.equals("right")){
          map[row][col] = ' ';
          carveMaze(row, col+1);
        }
      }
    }
  }

  public boolean canCarve(int row, int col){
    if (row == 0 || row == map.length-1 || col == 0 || col == map[0].length-1){
      return false;
    }
    int counter = 0;
    if (map[row+1][col] == ' ') counter ++;
    if (map[row-1][col] == ' ') counter ++;
    if (map[row][col-1] == ' ') counter ++;
    if (map[row][col+1] == ' ') counter ++;
    return counter < 2;
  }
  
  public char[][] getMap(){
    return map;
  }
  
  public String toString(){
    String ans = "";
        for (int i = 0; i < map.length; i ++){
            if (i > 0) ans += "\n";
            for (int j = 0; j < map[0].length; j ++){
                ans += map[i][j];
            }
        }
      return ans;
  }
}
