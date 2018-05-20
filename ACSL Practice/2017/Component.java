import java.io.*;
import java.util.*;

class Component{
  
  public static void main(String[] args){
    BufferedReader f = new BufferedReader(new FileReader("Component 4 input.txt"));
    String line = f.readLine();
    
    while(line != null){
      String[] chs = line.split(", ");
      int numOfVers = Integer.parseInt(chs[0]);
      
      int edges = Integer.valueOf(chs[1],16);
      String edgesBits = String.valueOf(edges);
      
      int[][] components = new int[numOfVers][numOfVers];
      for(int i=; i){
      
      }
    }
  }
  
}