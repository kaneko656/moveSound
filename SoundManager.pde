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
    RandomOut rand = new RandomOut(4);
    minim = _minim;
    createSoundObject(minim, "centerfront_flute.mp3");
    createSoundObject(minim, "centermid_oboe.mp3");
    //createSoundObject(minim, "centerfront_piano.mp3");
    createSoundObject(minim, "centerfront_chorus.mp3");
    createSoundObject(minim, "centerfront_violin.mp3");
    changeMoveMode(rand.getRandom(), MOVESTATE.MOUSE);
    changeMoveMode(rand.getRandom(), MOVESTATE.TEMPLATE);
    changeMoveMode(rand.getRandom(), MOVESTATE.TEMPLATE);
    changeMoveMode(rand.getRandom(), MOVESTATE.TEMPLATE);
    //changeMoveMode(rand.getRandom(),MOVESTATE.TEMPLATE);
    mouseMove = new MouseMove(10);
  }

  void update() {
    if (muteMode_move) {
      mute_move();
    } else {
      if (isMute) {
        unmute();
        isMute=false;
        println("state == unmute"+frameCount);
      }
    }
    // 音を動かす
    soundMove();
  }  

  void mute_move() {
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
    for (Sound s : sound) {
      s.draw(width, height);
    }
  }

  void createSoundObject(Minim minim, String fileName) {
    Sound s=new Sound(minim, fileName);
    sound.add(s);
  }
  void createSoundObject(Minim minim, String fileName, String fileName2) {
    Sound s=new Sound(minim, fileName, fileName2);
    sound.add(s);
  }

  void changeMoveMode(int i, MOVESTATE state) {
    if (sound.size()>i) {
      sound.get(i).changeMoveMode(state);
    }
  }

  void soundMove() {
    for (Sound s : sound) {
      s.soundMove();
    }
  }

  boolean ismuteMode_move() {
    return muteMode_move;
  }

  void setmuteMode_move(boolean state) {
    muteMode_move = state;
    println("muteMode_move = "+state);
  }

  String toString() {
    String str="";
    for (int i=0; i<sound.size (); i++) {
      Sound s = sound.get(i);
      str += "["+i+"]  ";
      str += s.toString();
      str += "   moveState:"; 
      str += s.isState();
      str += "   sound:"; 
      str += s.stateMute();
      str += "\n";
    }
    return str;
  }

  void mute() {
    for (Sound s : sound) {
      s.mute();
    }
  }

  void mute(int n) {
    if (n>=0 && n<sound.size())
      sound.get(n).mute();
  }

  void unmute() {
    for (Sound s : sound) {
      s.unmute();
    }
  }  

  void unmute(int n) {
    if (n>=0 && n<sound.size())
      sound.get(n).unmute();
  }

  void changeMute(int n) {
    if (n>=0 && n<sound.size()) {
      if (sound.get(n).isMuted()) {
        sound.get(n).unmute();
      } else {
        sound.get(n).mute();
      }
    }
  }


  void stop() {
    for (Sound s : sound) {
      s.stop();
    }
  }
}
