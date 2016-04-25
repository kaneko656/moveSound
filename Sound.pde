/*
 * 単一の音源 クラス
 */

class Sound {
  Minim minim;
  AudioPlayer player;
  RandomMove randomMove = new RandomMove();
  LoadTemplate template = new LoadTemplate();
  MOVESTATE moveState = MOVESTATE.RANDOM;

  float posX=0;
  float posY=0;

  Sound(Minim _minim, String fileName) {
    minim = _minim;
    player = minim.loadFile(fileName);
    player.loop();
  }

  void changeMoveMode(MOVESTATE ms) {
    moveState = ms;
  }

  void soundMove() {
    if (moveState == MOVESTATE.RANDOM) {
      randomMove();
    }
    if (moveState == MOVESTATE.MOUSE) {
      mouseMove();
    }
    if (moveState == MOVESTATE.TEMPLATE) {
      templateMove();
    }
  }


  // マウスで動く
  void mouseMove() {// 引数にする
    posX = 1.0*mouseX/width; // 0~1
    posY = 1.0*mouseY/height; // 0~1
    float value = posX*2 - 1;
    setPan(value);
  }

  // 乱数
  void randomMove() {
    posX = randomMove.getX(); // 0~1
    posY = randomMove.getY(); // 0~1
    randomMove.update();
    float value = posX*2 - 1;
    setPan(value);
  }

  // Template
  void templateMove() {
    posX = template.getX(); // 0~1
    posY = template.getY(); // 0~1
    float value = posX*2 -1;
    setPan(value);
    template.next();
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

  void draw(int wid, int heigh) {
    noFill();
    int x = (int)(posX*wid);
    int y = (int)(posY*heigh);
  
    if (moveState == MOVESTATE.MOUSE) {
      // 静止
      if (player.isMuted()) {
        stroke(30);
        // 動く
      } else {
        stroke(125);
      }
      rect(x-25, y-25, 50, 50);
    } else {
      noFill();
      stroke(125);
      rect(x-25, y-25, 50, 50);
    }
  }
}
