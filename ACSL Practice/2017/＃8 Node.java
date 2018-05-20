import java.io.*;
import java.util.*;


class Node{
  //attributes
  Node left = null;
  Node right = null;
  Node parent = null;
  String val;
  int depth;
  
  //constructor
  public Node(String val){
    this.val = val;
  }
  
  //method 1: build a tree 
  //@return: void
  public void buildTree(String[] chs){//probably ArrayList
    for (int i=1; i<chs.length; i++){
      String ch = chs[i];
      this.insert(ch);    
    }
  }
  
  //method 2: insert a Node into a tree(Node)
  //@return: void
  public void insert(String ch){
    //create a new Node
    Node in = new Node(ch);
    //find a place for it
    Node parentNode = this.findPlace(ch);
    //insert it
    in.parent = parentNode; //point to the same address
    if(ch.compareTo(parentNode.val)<=0){
      parentNode.left = in;
    }else{
      parentNode.right = in;
    }
    //let inserted Node in knows its depth
    in.depth = in.findDepth();
  
  }
  
  //method 3: find a parentNode for @parameter str
  //@return: parentNode
  public Node findPlace(String ch){
    Node current = this;
    Node parentNode = this;
    
    while(current != null){
      //until current becomes null, then parentNode will be current's parent
      parentNode = current;
      if(ch.compareTo(parentNode.val)<=0){
        current = parentNode.left;
      }else{
        current = parentNode.right;
      }
    }
    return parentNode;
  }
  
  //method 4: find the depth of a @given Node
  //@return: depth
  public int findDepth(){
    Node parent = this.parent;//point to the same address
    int depth = 0;
    while(parent != null){
      depth++;
      parent = parent.parent;
    }
    return depth;
  }
  
  //method 5: count the depth of a @given Tree(Node)
  //@return: treeDepth
  public int countDepth(){
    int treeDepth = 0;
    
    
  }
  
  
  public static void main(String[]args) throws IOException{
  
    BufferedReader f = new BufferedReader(new FileReader("input.txt"));
    String line = f.readLine();  
    
    while(line != null){
      String[] chs = line.split("");
      for(int i=0; i<chs.length; i++){
        //to delete all " " and still chs(try ArrayList? Python may be easier)
      }
      
      //create a tree(Node)
      Node root = new Node(chs[0]);
      root.buildTree(chs);
      
      //@output 1: depth of the tree
      //@output 2: # leaf nodes
      //@output 3: # Node with one child
      //@output 4: internal path (depth of all nodes)
      //@output 5: external path (depth of all external nodes(null spaces))
      
    }
    
  }

}
