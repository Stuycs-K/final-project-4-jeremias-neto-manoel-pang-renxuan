public class rounds{
  private String[] info = new String[]{
    "max 40",
    "red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red", "done",
    
    "max 25",
    "red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red", "red","red", "red","red", "red", "red","red", "red","red", "red", "red","red", "red","red", "red", "done",
    
    "red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red", "red","red", "red","red", "red", "blue", "blue", "blue", "blue", "blue", "done",
    
    "max 20",
    "red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red","red", "red", "red","red", "red","red", "red", "red","red", "red","red", "red", "red","red", "red","red", "red",
    "max 10",
    "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "done"
    
    ,"blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue","blue", "blue", "red","red", "red","red", "red","blue", "blue", "blue","blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "done"
    
    ,"max 25",
    "green", "green", "green", "green",
    "red", "red","red", "red","red","red", "red","red", "red","red","red", "red","red", "red","red", "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", "done"
    
    ,"max 25",
    "red", "red","red", "red","red","red", "red","red", "red","red","red", "red","red", "red","red", 
    "blue", "blue", "blue", "blue", "blue","green", "green", "green", "green", "green","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", "done"
    
    ,"blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", 
    "max 5", 
    "red", "red","red", "red","red","red", "red","red", "red","red","red", "red","red", "red","red","red", "red","red", "red","red","red", "red","red", "red","red",
    "max 10",
    "green", "green","green", "green","green", "green","green", "green","green", "green","green", "green","green", "green","done"
    
    ,"max 40",
    "green", "green","green", "green","green","green", "green","green", "green","green","green", "green","green", "green","green","green", "green","green", "green","green","green", "green","green", "green","green","green", "green","green", "green","green", "done"
  
    ,"max 20",
    "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", 
    "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", 
    "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", 
    "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", 
    "max 10",
    "blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue","blue", "blue", "blue", "blue", "blue", 
    "blue", "blue", "done"

  };
  private int counter = 0;

  public rounds(){
  }
  
  public String getInfo(){
    String text = info[counter];
    counter ++;
    return text;
  }
  
  public boolean empty(){
    return counter == info.length;
  }
  
  public void foundDone(){
    counter --;
  }
}
