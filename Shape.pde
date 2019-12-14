public class Shape{
   
  private int[][] piece, oP;  //oP(originalPiece) is a placeholder of the piece for when I want to rotate it
  private int count, rotCount;
  private float w;
  private int choice, r, g, b;
  private int floor; //This will represent the 'floor'
  private boolean isActive;
  
  //SHAPES  THERE ARE 7 BASIC TETRIS SHAPES
  private int[][] ln = {{0,0}, {1,0}, {2,0}, {3,0}};
  private int[][] square = {{1,1}, {1,0},{0,1}, {0,0}};
  private int[][] rightL = {{0,0}, {1,0}, {2,0}, {0,1}};
  private int[][] leftL = {{0,0}, {1,0}, {2,0}, {2,1}};
  private int[][] tri = {{0,0}, {1,0}, {2,0}, {1,1}};
  private int[][] s = {{0,0}, {1,0}, {1,1}, {2,1}};
  private int[][] otherS = {{0,1}, {1,1}, {1,0}, {2, 0}};
  
  public Shape(){
      isActive = true;
      floor = 22;
      w = width/12;
      count = 1;
      choice = (int)random(7);
      switch(choice){
        case 0:
          piece = ln;
          oP = ln;
          r = 200;
          break;
        case 1:
          piece = square;
          oP = square;
          g = 200;
          break;
        case 2:
          piece = rightL;
          oP = rightL;
          b = 200;
          break;
        case 3:
          piece = leftL;
          oP = leftL;
          r = 155;
          g = 155;
          break;
        case 4:
          piece = tri;
          oP = tri;
          r = 200;
          b = 200;
          break;
        case 5:
          piece = s;
          oP = s;
          b = 155;
          g = 155;
          break;
        case 6:
          piece = otherS;
          oP = otherS;
          g = 200;
          b = 200;
          break;          
      }
  }  
  
  public void display(){
     fill(r,g,b);
     for(int i = 0; i < 4; i++){
       if(piece[i][1] > floor){
         isActive = false;
       }
     }
     for(int i = 0; i < 4; i++){
         rect(piece[i][0]*w, piece[i][1]*w, w, w); 
         if(count%50==0 && isActive){
           piece[i][1]++;
         } 
     }
     count++;
  }
  
  public boolean checkSide(String side){
      switch(side){
        case "RIGHT":
          for(int i = 0; i < 4; i++){
            if(piece[i][0] > 10){
              return false;
            } 
          } return true;
        case "LEFT": 
           for(int i = 0; i < 4; i++){
            if(piece[i][0] < 1){
              return false;
            } 
          } return true;  
        case "DOWN":
          for(int i = 0; i < 4; i++){
            if(piece[i][1] > floor){
              return false;
            } 
          } return true; 
        case "FLOOR":
           for(int i = 0; i < 4; i++){
            if(piece[i][1] > floor){
              return true;
            } 
          } return false; 
          
          //STILL IMPLEMENTING THIS PART --- KENON'S CODE
         case "PIECE BELOW":
           for(int i = 0; i < 4; i++){
            if(get(int(piece[i][0]*w), int(piece[i][1]*w+1.5*w))==-13487566){
              return false;
            } 
          } return true;           
          
        default:
          return true;
      }
    
  }
  
  public void rotateShape(){
      int[][] rotated = new int[4][2];
      if(rotCount % 4 == 0){
        for(int i = 0; i < 4; i++){
          rotated[i][0] = oP[i][1] - piece[1][0];
          rotated[i][1] = -oP[i][0] - piece[1][1];
          
        }
      } else if(rotCount % 4 == 1) {
        for(int i = 0; i < 4; i++){
            rotated[i][0] = -oP[i][0] - piece[1][0];
            rotated[i][1] = -oP[i][1] - piece[1][1];
        } 
      } else if(rotCount % 4 == 2) {
         for(int i = 0; i < 4; i++){
            rotated[i][0] = -oP[i][1] - piece[1][0];
            rotated[i][1] = oP[i][0] - piece[1][1];
        }        
      } else {
        for(int i = 0; i < 4; i++){
            rotated[i][0] = oP[i][0] - piece[1][0];
            rotated[i][1] = oP[i][1] - piece[1][1];
        } 
      }
    piece = rotated;
  } 
}
