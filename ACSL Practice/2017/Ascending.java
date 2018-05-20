import java.io.*;
import java.util.*;

class Ascending{

  //static method 1: find next smallest number of @fr digits from @ArrayList digits 
  //              & delete them from ArrayList digits
  //@return: next smallest number
  public static Integer findNextNumber(ArrayList<Integer> digits, int fr){
    int nextNum = 0;//Integer to int
    
    for(int i=fr; i>0; i--){
      
      int smallest = digits.get(0);
      for(int j=0; j<digits.size();j++){
        int a = digits.get(j).intValue();
        if(a < smallest){
          smallest = a;
          digits.remove(j);
          j--;
        }
      }
      nextNum += smallest*(10^i);
    }
    
    return nextNum;
  }
  
  public static void main(String[] args) throws IOException{
    BufferedReader f = new BufferedReader(new FileReader("Ascending 5 input.txt"));
    String line = f.readLine();
    
    while(line != null){
      //how many digits per number
      String first = line.substring(0,1);
      int fr = Integer.parseInt(first);
      
      //turn str into ArrayList<Integer>
      String contents = line.substring(1);
      String[] conts = contents.split("");
      ArrayList<Integer> digits = new ArrayList<Integer>();
      
      for(int i=0; i<digits.size(); i++){
        Integer a = Integer.valueOf(conts[i]);
        digits.add(a);
      }
      
      //compare and form numbers
      ArrayList<Integer> nums = new ArrayList<Integer>();
      int numOfNums = (digits.size())/fr;
      
      for(int j=0; j<numOfNums; j++){
        Integer num = findNextNumber(digits,fr);
        nums.add(num);
      }
      
      //print result
      for(int k=0; k<nums.size(); k++){
        int a = nums.get(k).intValue();
        
        System.out.print(a);
      }
      System.out.println();
      
      line = f.readLine();
    }
    
  }

}