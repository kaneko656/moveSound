/*
 * 単一の音源 クラス
 */

class Sound {
  Minim minim;
  AudioPlayer player;
  RandomMove randomMove = new RandomMove();
  MOVESTATE moveState = MOVESTATE.RANDOM;

  Sound(Minim _minim, String fileName) {
    minim = _minim;
    player = minim.loadFile(fileName);  //groove.mp3をロードする
    player.loop();  //再生
  }

  void changeMoveMode(MOVESTATE ms) {
    moveState = ms;
  }
  
  void soundMove(){
    if(moveState == MOVESTATE.RANDOM){
      randomMove();
    }
    if(moveState == MOVESTATE.MOUSE){
      mouseMove();
    }
  }


  // マウスで動く
  void mouseMove() {// 引数にする
    float value = 1.0*mouseX/width*2 - 1;
    setPan(value);
  }

  void randomMove() {
    randomMove.update();
    float value = 1.0*randomMove.getX()/width*2 - 1;
    setPan(value);
  }

  void setPan(float value) { // -1 ~　1
    player.setBalance(value);
  }

  void mute() {
    player.mute();
  }

  void unmute() {
    player.unmute();
  }

  void stop() {
    player.close();  //サウンドデータを終了
    minim.stop();
  }
}
