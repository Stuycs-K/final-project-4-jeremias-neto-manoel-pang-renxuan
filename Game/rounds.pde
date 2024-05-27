public class rounds{
  private String[] info = new String[]{
    "red",
    "red",
    //"blue",
    //"blue",
    //"green",
    //"green",
    //"yellow",
    //"yellow",
    //"pink",
    //"pink",
    "done",
    "red",
    "red"
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
