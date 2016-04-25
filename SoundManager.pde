/*
 * 複数のSoundクラス　管理クラス
 */


class SoundManager {
  Minim minim;
  MouseMove mouseMove;
  ArrayList <Sound> sound =new ArrayList<Sound>();
  boolean muteMode_move = false;
  boolean isMute = false;

  SoundManager(Minim _minim) {
    minim = _minim;
    createSoundObject(minim, "centerfront_flute.mp3");
    createSoundObject(minim, "centerfront_oboe.mp3");
    createSoundObject(minim, "centerfront_piano.mp3");
    createSoundObject(minim, "centerfront_chorus.mp3");
    createSoundObject(minim, "centerfront_violin.mp3");
    changeMoveMode((int)random(sound.size()),MOVESTATE.MOUSE);
    mouseMove = new MouseMove(10);
  }

  void update() {
    if(muteMode_move){
      mute_move();
    }else{
      if (isMute) {
        unmute();
        isMute=false;
        println("state == unmute"+frameCount);
      }
    }
    // 音を動かす
    soundMove();
  }  
  
  void mute_move(){
    mouseMove.update(mouseX, mouseY);
    boolean moved = mouseMove.moved();
    // マウスが動いている
    if (moved) {
      // mute中だったら解除
      if (isMute) {
        unmute();
        isMute=false;
        println("state == unmute"+frameCount);
      }
    // マウスが静止
    } else {
      // muteにする
      if (!isMute) {
        mute();
        isMute=true;
        println("state == mute"+frameCount);
      }
    }
  }

  void draw() {
    noFill();
    // 静止
    if (isMute) {
      stroke(30);
      // 動く
    } else {
      stroke(125);
    }
    rect(mouseX-25, mouseY-25, 50, 50);
  }

  void createSoundObject(Minim minim, String fileName) {
    Sound s=new Sound(minim, fileName);
    sound.add(s);
  }
  
  void changeMoveMode(int i, MOVESTATE state){
    if(sound.size()>i){
      sound.get(i).changeMoveMode(state);
    }
  }

  void soundMove() {
    for (Sound s : sound) {
      s.soundMove();
    }
  }
  
  boolean ismuteMode_move(){
    return muteMode_move;
  }
  
  void setmuteMode_move(boolean state){
    muteMode_move = state;
    println("muteMode_move = "+state);
  }
  
  

  void mute() {
    for (Sound s : sound) {
      s.mute();
    }
  }

  void unmute() {
    for (Sound s : sound) {
      s.unmute();
    }
  }  

  void stop() {
    for (Sound s : sound) {
      s.stop();
    }
  }
  
}
