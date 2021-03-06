/* IPCapture sample sketch for Java and Android   *
 *                                                *
 * === IMPORTANT ===                              *
 * In Android mode, Remember to enable            *
 * INTERNET permissions in the                    *
 * Android -> Sketch permissions menu             */

import ipcapture.*;

IPCapture cam;

void setup() {
  size(320,240);
  cam = new IPCapture(this, "http://195.235.198.107:3346/axis-cgi/mjpg/video.cgi?resolution=320x240", "", "");
  cam.start();
  
  // this works as well:
  
  // cam = new IPCapture(this);
  // cam.start("url", "username", "password");
  
  // It is possible to change the MJPEG stream by calling stop()
  // on a running camera, and then start() it with the new
  // url, username and password.
}

void draw() {
  if (cam.isAvailable()) {
    cam.read();
    image(cam,0,0);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (cam.isAlive()) cam.stop();
    else cam.start();
  }
}
