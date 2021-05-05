/*
This program runs a simple example of the Soduku Game.It will accept characters from the user and then draw
those characters in the positions in the grid that are clicked on by the mouse. The only
valid inputs that should be accepted are digits between 1-9.When the code runs, type a character with the keyboard and 
then click on an empty cell with the mouse. If the cell is empty, draw the character. 
If the cell is not empty, you shouldn’t be able to enter a character in the cell. 
It can remove a user-entered character (but not one that was there at the beginning) and make the cell
available again using the ket 'c'.
*/

import javax.swing.JOptionPane;
//This the default data with the gameBoard in the beginning
char row1[] = {' ',' ','2',' ','8',' ','5',' ',' '}; 
char row2[] = {'8',' ','1','2','5','7',' ','4','9'};
char row3[] = {' ','4',' ',' ',' ','3','8','2','7'};
char row4[] = {' ','8','4','1','9',' ',' ',' ','3'};
char row5[] = {'3',' ',' ','7',' ','5','2',' ',' '};
char row6[] = {'1',' ','7',' ','3','2',' ',' ',' '};
char row7[] = {' ',' ',' ',' ','7','8',' ',' ',' '};
char row8[] = {' ','6',' ',' ',' ','9','1',' ',' '};
char row9[] = {' ','2','8','5',' ',' ',' ','7','4'};

char userKey = ' ' ;
String gameOverMessage ="";

//This is the copy of the data of the gameBoard in the beginning 
char row11[] = {' ',' ','2',' ','8',' ','5',' ',' '}; 
char row22[] = {'8',' ','1','2','5','7',' ','4','9'};
char row33[] = {' ','4',' ',' ',' ','3','8','2','7'};
char row44[] = {' ','8','4','1','9',' ',' ',' ','3'};
char row55[] = {'3',' ',' ','7',' ','5','2',' ',' '};
char row66[] = {'1',' ','7',' ','3','2',' ',' ',' '};
char row77[] = {' ',' ',' ',' ','7','8',' ',' ',' '};
char row88[] = {' ','6',' ',' ',' ','9','1',' ',' '};
char row99[] = {' ','2','8','5',' ',' ',' ','7','4'};

//Checks whether a certain row is empty or not by checking each of the characters in the array
boolean checkBoardStatus(char[] row){
  boolean isEmpty=true;
  
  for(int i = 0; i<row.length; i++){
    if(row[i]==' '){
      isEmpty = false;
    }//if
  }//for

return isEmpty;
}//checkBoardStatus

//Setting up intial board with white background and 600 by 600 canvas
void setup(){
  background(255);
  size(600,600);  
}//setup

//This method is called when a key in the keyboard is pressed.The only valid inputs are 'c' and any number
//from 1-9
void keyPressed(){
  
 if(key=='1' || key=='2'|| key=='3' || key=='4'|| key=='5'|| key=='6'|| key=='7'|| key=='8'|| key=='9'){
  String userString=""+key;
  userKey=userString.toUpperCase().charAt(0);
  println("Typed character: "+userKey);
  println("Now click with the mouse on cell..");
  
}else if(key == 'c'){
  userKey='c';
  println("Typed character: "+userKey);
  println("Now you can remove any wrong entry that you entered!");
  
  }
}//keyPressed

//The draw functions draws the canvas and all the characters
void draw(){
 drawCanvas();  
 drawCharacters();
 drawEmptyCharacters();
}//draw

//This is a helper method for drawEmptyCharacters. It draws square in the empty boxes
void drawSquare(char row[],int index, int position){
  if(row[index]==' '){
 square((index*(width/9))+width/90, (position*(height/9))+height/90,height/10 );
  }
}//drawSquare

void drawEmptyCharacters(){
  fill(255);
  noStroke();
  
  for(int i=0; i<9; i++){
     drawSquare(row1,i, 0);
     drawSquare(row2,i, 1);
     drawSquare(row3,i, 2);
     drawSquare(row4,i, 3);
     drawSquare(row5,i, 4);
     drawSquare(row6,i, 5);
     drawSquare(row7,i, 6);
     drawSquare(row8,i, 7);
     drawSquare(row9,i, 8);
  }//for

}//drawEmptyCharacters

void drawCharacters(){
  
  textSize(width/20);
  fill(0, 102, 153);
  
  for(int i=0; i<9; i++){
      text(row1[i], (width/24)+(i*(width/9)), height/14+(0*(height/9))); 
      text(row2[i], (width/24)+(i*(width/9)), height/14+(1*(height/9)));
      text(row3[i], (width/24)+(i*(width/9)), height/14+(2*(height/9)));
      text(row4[i], (width/24)+(i*(width/9)), height/14+(3*(height/9)));
      text(row5[i], (width/24)+(i*(width/9)), height/14+(4*(height/9)));
      text(row6[i], (width/24)+(i*(width/9)), height/14+(5*(height/9)));
      text(row7[i], (width/24)+(i*(width/9)), height/14+(6*(height/9)));
      text(row8[i], (width/24)+(i*(width/9)), height/14+(7*(height/9)));
      text(row9[i], (width/24)+(i*(width/9)), height/14+(8*(height/9)));
  }//for

}//drawCharacters

//Shows a message dialog in the screen when a duplicate value is found!
void showDuplicateValueMessage(){
   JOptionPane.showMessageDialog(null,  "You are only allowed to enter a unique digit(1-9) in a row, coloumn or a block!\nI did not let you enter "+userKey,"Repeated number Detected!!", JOptionPane.ERROR_MESSAGE);
}//showDuplicateValueMessage

//This is used for checking each row to find if there's a duplicate value
boolean checkRow(char row[],char findKey){
  boolean duplicateValue = false;
  int count=0;
  
    for(int i =0; i<row.length; i++){
        if(row[i]==findKey){
        count++;
       }//if
    }//for

    if(count>0){
      duplicateValue=true;
    }//if
    
return duplicateValue;
}//checkRow

//This is used for checking each column to find if there's a duplicate value
boolean checkCol(int index,char findKey){
  boolean duplicateValue = false;
  int count=0;
  
  if(row1[index]==findKey){
  count++;
  }
  if(row2[index]==findKey){
  count++;
  }
  if(row3[index]==findKey){
  count++;
  }
  if(row4[index]==findKey){
  count++;
  }
  if(row5[index]==findKey){
  count++;
  }
  if(row6[index]==findKey){
  count++;
  }
  if(row7[index]==findKey){
  count++;
  }
  if(row8[index]==findKey){
  count++;
  }
  if(row9[index]==findKey){
  count++;
  }
  
  if(count>0){
  duplicateValue=true;
  }

return duplicateValue;
}//checkCol

//Helper method that checks for each of the box and sees if it is fit for the input
void doGame(char row[],char copyRow[],int i, int position){
  
   if(row[(i/(width/9))]==' ' && userKey!='c'){
        if( !checkRow(row,userKey) && !checkCol(i/(width/9),userKey)){
   row[(i/(width/9))]=userKey;
   text(row[(i/(width/9))], (width/24)+((i/(width/9))*(width/9)), height/14+(position*(height/9)));
        }else{
     showDuplicateValueMessage();
        }
      } else if(row[(i/(width/9))]!=' ' && userKey=='c'){
     if(copyRow[(i/(width/9))]==' '){
       row[(i/(width/9))]=' ';
         
     }else{
       println("Cannot remove character other than userEntered!");
     }
      }

}//doGame

//Check each boxes and finds out if the user has correct response. If all the 
//responses are correct then the game is over
void mouseClicked(){
  textSize(width/20);
  fill(0, 0, 153);
  float xCoordinate = mouseX;
  float yCoordinate = mouseY;
  
  
  for(int i=0; i<(width-(width/9)); i+=(width/9)){
      if(userKey!=' ' ){
    
        if(xCoordinate>=(i) && xCoordinate<=(i+(width/9)) ){
            if(yCoordinate>=(0*height/9) && yCoordinate<=(1*height/9)){
                doGame(row1,row11, i, 0);  
              }
            if(yCoordinate>=(1*height/9) && yCoordinate<=(2*height/9)){
                doGame(row2,row22, i, 1);
              }
            if(yCoordinate>=(2*height/9) && yCoordinate<=(3*height/9)){
                doGame(row3,row33, i, 2);
              }
            if(yCoordinate>=(3*height/9) && yCoordinate<=(4*height/9)){
                doGame(row4,row44, i, 3);
              }
            if(yCoordinate>=(4*height/9) && yCoordinate<=(5*height/9)){
                doGame(row5,row55, i, 4);
              }
            if(yCoordinate>=(5*height/9) && yCoordinate<=(6*height/9)){
                doGame(row6,row66, i, 5);
              }
            if(yCoordinate>=(6*height/9) && yCoordinate<=(7*height/9)){
                doGame(row7,row77, i, 6);
              }
            if(yCoordinate>=(7*height/9) && yCoordinate<=(8*height/9)){
                doGame(row8,row88, i, 7);
              }
            if(yCoordinate>=(8*height/9) && yCoordinate<=(9*height/9)){
                doGame(row9,row99, i, 8);
              } 
         }
       }//userKeyIF
   }//forLoop
 
 winMessage();

}//mouseClicked

//Shows the win message in the screen
void winMessage(){
if(checkBoardStatus(row1) && checkBoardStatus(row2) && checkBoardStatus(row3) && checkBoardStatus(row4)
&& checkBoardStatus(row5) && checkBoardStatus(row6)&& checkBoardStatus(row7)
&& checkBoardStatus(row8) && checkBoardStatus(row9)){
  JOptionPane.showMessageDialog(null,"Game Over!");
}//if

}//winMessage

//Intially before the characters are put in the canvas the canvas is drawn using this function
void drawCanvas(){
  
  //draws the this line
  strokeWeight(1);
  for(int i=0; i<(width); i+=(width/9)){  
  line(i,0,i,width); 
  line(0,i,height,i); 
 }//for
 
 //draws the bold lines
  strokeWeight(5);
  for(int i=0; i<(width); i+=(width/3)){  
  line(i,0,i,width); 
  line(0,i,height,i); 
 }//for

}//drawCanvas
