import java.io.*;
import java.util.*;

class Component{
  //static method 1: find all vertices that are connected to a @given vertices
  public static void findAllWiths(ArrayList<String> withVer, int[][] components, String ver){
    String chs = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int rowOfVer = chs.indexOf(ver);
    for(int col=0; col<components[rowOfVer].length; col++){
      String ch = chs.substring(col,col+1);//out of range??
      if (components[rowOfVer][col] == 1){//wh.,at about repetition??
        withVer.add(ch);
        findAllWiths(withVer,components,ch);//recursive here? change ojbective variable directly??
      }
    }
  }
  
  
  public static void main(String[] args) throws IOException{
    BufferedReader f = new BufferedReader(new FileReader("Component 4 input.txt"));
    String line = f.readLine();
    
    while(line != null){
      String[] temp = line.split(", ");
      int numOfVers = Integer.parseInt(temp[0]);
      
      int edges = Integer.valueOf(temp[1],16);
      String edgesBits = String.valueOf(edges);
      
      //build a matrix
      int[][] components = new int[numOfVers][numOfVers];
      for(int row=numOfVers; row>0; row--){
        String edgeBit = edgesBits.substring(0,row);//out of range??
        for(int col=1; col<numOfVers; col++){
          components[numOfVers-row][col] = Integer.parseInt(edgeBit.substring(col-1,col));
        }
        edgesBits = edgesBits.substring(row);
      }
      
      //an ArrayList of not marked
      ArrayList<String> notMarked = new ArrayList<String>();
      for(int i=0; i<numOfVers; i++){
        String chs = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        notMarked.add(chs.substring(i,i+1));//out of range??
      }
      
      //an ArrayList of all connected to A
      ArrayList<String> withA = new ArrayList<String>();
      findAllWiths(withA, components, "A");
      
      //find how many connected components
      //find vertices not in withA, go through withA
      //find other vertices in notMarked, until all are marked
      while(notMarked.size() != 0){
      
      }
      
      //@output 1: #connected components
      System.out.println();
      //@output 2: all vertices of the component that includes A
      System.out.println();
    }
  }
  
}
