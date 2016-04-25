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

void setup(){
  size(800, 800);
  Minim minim = new Minim(this);;  //初期化
  soundManager= new SoundManager(minim);
}

void draw(){
  background(200);
 
  soundManager.update();
  soundManager.draw(); 
}

void keyReleased(){
  if(key==' '){
    soundManager.setmuteMode_move(!soundManager.ismuteMode_move());
  }
}

void stop(){
  soundManager.stop();
  super.stop();
}
