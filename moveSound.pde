/*
 *  Main
 */

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

SoundManager soundManager;
SaveMouseMove saveMouseMove;
RandomOut templateRandomOut;
    
int templateNum = 7; // 増えたら増加

boolean isView = false;
boolean isCursorView = false;
boolean isHelp= true;

void setup(){
  size(800, 800);
  frame.setResizable(true);
  Minim minim = new Minim(this);  //初期化
  templateRandomOut = new RandomOut(templateNum);
  soundManager= new SoundManager(minim);
  saveMouseMove = new SaveMouseMove();
}

void draw(){
  background(200);
 
  soundManager.update();
  if(isView){
    soundManager.draw();
  }
  if(isHelp){
    helper();
  }
  
  if(frameCount>50){
    saveMouseMove.addPosition(1.0*mouseX/width,1.0*mouseY/height);
  }
  if(frameCount == 900){
    saveMouseMove.save();
  }
}

void keyReleased(){
  if(key=='m'){
    soundManager.setmuteMode_move(!soundManager.ismuteMode_move());
  }
  if(key=='h'){
    isView=!isView;
  }
  if(key=='c'){
    if(isCursorView == true) {
      noCursor();
      isCursorView=false;
    } else {
      isCursorView = true;
      cursor();
    }
  }
  if(key==' '){
    isHelp=!isHelp;
  }
  if(key=='0'){
    soundManager.changeMute(0);
  }
  if(key=='1'){
    soundManager.changeMute(1);
  }
  if(key=='2'){
    soundManager.changeMute(2);
  }
  if(key=='3'){
    soundManager.changeMute(3);
  }
  if(key=='4'){
    soundManager.changeMute(4);
  }
}

void helper(){
  
  stroke(10);
  text(" h : on/off  objectView",50,30);
  text(" c : on/off  cursor",50,60);
  text(" m : on/off  play only during the move",50 ,90);
  text(" space : on/off  help",50 ,120 + 15);
  text(soundManager.toString(),50, 200);
}

void stop(){
  soundManager.stop();
  super.stop();
}
