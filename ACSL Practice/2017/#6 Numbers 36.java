//not finished yet

import java.io.*;
import java.util.*;

class Numbers{

  //static method 1: find smallest
  //static method 2: find next smallest
  //static method 3: find largest
  //static method 4: find avg of max and min
  
  public static void main(String[] args){
    BufferedReader f = new BufferedReader(new FileReader("input.txt"));
    String line = f.readLine();
    
    while(line != null){
    
      
      
      
      //@outpur 1: smallest
      System.out.println();
      //@output 2: largest
      System.out.println();
      //@output 3: 50th largest
      System.out.println(findLarge(50));
      //@output 4: kth smallest
      System.out.println(findSmall(k));
      //@output 5: num closest to the mean of min and max(if a tie, print both??)
      System.out.println();
      
    }
    
  }

}
