//check it tomorrow
//Assumed time: 37mins
//Actual time: 15mins
//Point: COOPERATE!!

import java.io.*;
import java.util.*;

public class Capsule{

  public static void main(String[]args) throws IOException{
    BufferedReader f = new BufferedReader(new FileReader("input.txt"));
    //do we have a .txt in the actual contest? or just a string line that can copy?
    
    String line = f.readLine();
    
    while(line != null){
      String[] vars = line.split(",");
      int row = Integer.parseInt(vars[0]);
      int col = Integer.parseInt(vars[1]);
      
      /*1. create the original capsule
       *by cutting the vars[3] into (row) pieces
       * converting each substring into dec then into binary
       * marking each cell's state(really??)
       */
      
      /*2. 
       * */   
       
    }
    
  }
}

class Cell{
  //attributes
  int row;
  int col;
  
  boolean top;
  boolean right;
  boolean bot;
  boolean left;
  
}


