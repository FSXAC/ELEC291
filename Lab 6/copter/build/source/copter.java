import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class copter extends PApplet {

// helicopter game made using processing
// controlled using the f38x microcontroller

Player player;

public void setup() {
    
    player = new Player();
}

public void draw() {
    background(255);
    translate(width/2, height/2+100, -100);
    // scale(100);
    // noFill();
    // rotateX(map(mouseX, 0, width, 0, TWO_PI));
    // rotateY(map(mouseY, 0, height, 0, TWO_PI));
    rotateX(3*PI/2 - radians(5));
    stroke(50);
    noFill();

    pushMatrix();
    translate(0, 0, -50);
    box(100);
    popMatrix();

    strokeWeight(2);

    // x axis
    stroke(255, 0, 0);
    line(0, 0, 0, 100, 0, 0);

    // y
    stroke(0, 255, 0);
    line(0, 0, 0, 0, 100, 0);

    // z
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, -100);

    player.draw();
}

class Player {
    Player() {
    }

    public void draw() {
        stroke(0);
        strokeWeight(1);
        pushMatrix();
        translate(0, -height/2, 0);
        rotateY(map(mouseX, 0, width, PI/3, -PI/3));
        this.render();
        popMatrix();
    }

    private void render() {
        beginShape(QUADS);
        // front face
        vertex(-15, 50, -30);
        vertex(15, 50, -30);
        vertex(25, 40, 0);
        vertex(-25, 40, 0);

        // bottom face
        vertex(-25, 40, 0);
        vertex(25, 40, 0);
        vertex(50, -50, 0);
        vertex(-50, -50, 0);
        endShape();

        beginShape(TRIANGLES);
        // top
        vertex(-15, 50, -30);
        vertex(15, 50, -30);
        vertex(0, -50, -40);
        // left
        vertex(0, -50, -40);
        vertex(-50, -50, 0);
        vertex(-15, 50, -30);
        // right
        vertex(0, -50, -40);
        vertex(50, -50, 0);
        vertex(15, 50, -30);
        // back
        vertex(0, -50, -40);
        vertex(-50, -50, 0);
        vertex(50, -50, 0);
        endShape();

        pushMatrix();
        translate(0, -50, -15);
        rotateY(radians(map(mouseY, 0, height, 0, 1) *millis()));
        renderFan();
        popMatrix();
    }

    private void renderFan() {
        box(10);
        strokeWeight(2);
        for (int i = 0; i < 4; i++)  {
            rotateY(i * TWO_PI / 4);
            beginShape(TRIANGLE);
            vertex(0, 0, -5);
            vertex(-5, 0, -30);
            vertex(5, 0, -20);
            endShape();
        }
    }
}
  public void settings() {  size(800, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#272727", "--stop-color=#cccccc", "copter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
