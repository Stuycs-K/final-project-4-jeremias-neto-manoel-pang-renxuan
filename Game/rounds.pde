public class rounds{
  private String[] info = new String[]{
    "max 20",
    //"red",
    //"red",
    //"blue",
    //"blue",
    //"green",
    //"green",
    //"done",
    //"max 200",
    //"yellow",
    //"yellow",
    //"pink",
    //"pink",
    //"done",
    //"red",
    //"red"
    //"black",
    //"white",
    "zebra"
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
