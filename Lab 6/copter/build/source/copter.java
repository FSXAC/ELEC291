import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

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

// sound libarry


// game constants
// map size
final int mapWidth = 3000;
final int mapDepth = 10000;

// number of concurrent blocks
final int maxBlocks = 75;

// font object
PFont font;
Title title;

// sound player
SoundFile victorySound;

// create player object
Player player;

// create obsticle objects
Block[] blocks = new Block[maxBlocks];
Megablock mBlock = new Megablock(new PVector(random(-mapWidth, mapWidth), mapDepth));

// lateral movement
float turnOffset_tgt;
float turnOffset = 0;
float trackOffset = 0;

public void setup() {
    
    player = new Player();

    // spawn random blocks
    for (int i = 0; i < blocks.length; i++) {
        blocks[i] = new Block(new PVector(random(-mapWidth, mapWidth), random(500, mapDepth)));
    }

    // load font
    font = createFont("data/big_noodle_titling_oblique.ttf", 100, true);

    // load sound
    victorySound = new SoundFile(this, "victory.mp3");
}

public void draw() {
    // setup background and camera
    background(216, 251, 255);
    ambientLight(50, 50, 50);
    directionalLight(255,255,255,0,1, 0);
    directionalLight(255,255,255,0,0, -1);

    // camera offsets
    pushMatrix();
    turnOffset_tgt = map(mouseX - width/2, -width/2, width/2, 80, -80);
    turnOffset = lerp(turnOffset, turnOffset_tgt, 0.1f);
    trackOffset = lerp(trackOffset, (player.getSpeed() > 60) ? -200 : -100, 0.05f);
    translate(width/2 + turnOffset, height/2+100, trackOffset);
    rotateX(3*PI/2 - radians(5));

    // screenshake
    if (player.getSpeed() > 60) {
        translate(random(-2, 2), random(-2, 2), random(-2, 2));
    }
    if (player.getCollide()) {
        float pSpeed = map(player.getSpeed(), 10, 100, 10, 50);
        translate(random(-pSpeed, pSpeed), 0,  random(-pSpeed, pSpeed));
    }

    // draw ground
    pushMatrix();
    translate(0, 0, 50);
    rectMode(CENTER);
    fill(150, 150, 150);
    rect(0, 0, 4*mapWidth, 4*mapDepth);
    popMatrix();


    // draw block
    stroke(50);
    strokeWeight(10);
    fill(255);
    for (int i = 0; i < blocks.length; i++) {
        if (blocks[i].isEnabled()) {
            blocks[i].draw();
        } else {
            blocks[i] = new Block();
        }
    }
    if (mBlock.isEnabled()) mBlock.draw();
    else mBlock = new Megablock();

    // draw player
    player.draw();

    // end of drawing 3D world
    popMatrix();

    // draw on screen effects
    if (player.getSpeed() > 60) {
        // draw random camera effects
        // screenshake
        translate(random(-5, 5), random(-5, 5));

        // windsheild effects
        stroke(150);
        strokeWeight(5);
        float randomRStart = random(100, 300);
        float randomREnd = random(500, 800);
        float randomAngle = random(0, TWO_PI);
        line(
            width/2 + randomRStart * cos(randomAngle),
            height/2 + randomRStart * sin(randomAngle),
            width/2 + randomREnd * cos(randomAngle),
            height/2 + randomREnd * sin(randomAngle)
            );
    }

    // draw title
    if (title != null) {
        title.draw();
    }

    fill(0);
    // text(mBlock.position.y, 10, 10);
}

// mouse events
public void mouseClicked() {
    title = new Title("Complete!");
}

// debug axis
public void drawAxis() {
    // x axis
    stroke(255, 0, 0);
    line(0, 0, 0, 100, 0, 0);

    // y
    stroke(0, 255, 0);
    line(0, 0, 0, 0, 100, 0);

    // z
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, -100);
}
class Block {
    private PVector position;
    private boolean isEnabled;
    private PVector corner1;
    private PVector corner2;
    private PVector corner3;
    private PVector corner4;

    Block(PVector newVector) {
        position = newVector.copy();
        isEnabled = true;

        // generate random shapes
        corner1 = new PVector(random(25, 50), random(-50, -25), random(-200, -50));
        corner2 = new PVector(random(25, 50), random(25, 50), random(-200, -50));
        corner3 = new PVector(random(-50, -25), random(25, 50), random(-200, -50));
        corner4 = new PVector(random(-50, -25), random(-50, -25), random(-200, -50));
    }

    Block() {
        position = new PVector(random(-mapWidth, mapWidth), random(mapDepth-1000, mapDepth));
        isEnabled = true;

        // generate random shapes
        corner1 = new PVector(random(25, 50), random(-50, -25), random(-200, -50));
        corner2 = new PVector(random(25, 50), random(25, 50), random(-200, -50));
        corner3 = new PVector(random(-50, -25), random(25, 50), random(-200, -50));
        corner4 = new PVector(random(-50, -25), random(-50, -25), random(-200, -50));
    }

    public void draw() {
        stroke(map(dist(position.x, position.y, 0, 0), 1000, 8000, 100, 255));
        pushMatrix();
        translate(position.x, position.y, 0);
        renderBox();
        popMatrix();

        // update block
        update();
    }

    private void renderBox() {
        float k;
        if (position.y > 2000) {
            k = map(position.y, 2000, 8000, 1, 0);
        } else {
            k = 1;
        }
        beginShape(QUADS);
        // front
        vertex(50, -50, 0);
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner4.x, corner4.y, k*corner4.z);
        vertex(-50, -50, 0);
        // left
        vertex(-50, -50, 0);
        vertex(corner4.x, corner4.y, k*corner4.z);
        vertex(corner3.x, corner3.y, k*corner3.z);
        vertex(-50, 50, 0);
        // right
        vertex(50, -50, 0);
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner2.x, corner2.y, k*corner2.z);
        vertex(50, 50, 0);
        // top
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner2.x, corner2.y, k*corner2.z);
        vertex(corner3.x, corner3.y, k*corner3.z);
        vertex(corner4.x, corner4.y, k*corner4.z);
        endShape(CLOSE);
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    // move blocks towards players
    private void update() {

        // move blocks forward
        position.y-=player.getSpeed();

        // move blocks sideways
        position.x-=map(mouseX, 0, width, -15, 15);

        // check if it's out of bound, if so: reset
        if (position.y < -1000 || position.x > mapWidth || position.x < -mapWidth) {
            isEnabled = false;
        }

        // check if collision
        if ((position.y < -200 && position.y > -500) && abs(position.x) < 65) {
            isEnabled = false;
            player.collide();
        }
    }
}
class Megablock {
    PVector position;
    private boolean isEnabled;
    private PVector corner1;
    private PVector corner2;
    private PVector corner3;
    private PVector corner4;

    Megablock(PVector newVector) {
        position = newVector.copy();
        isEnabled = true;

        // generate random shapes
        corner1 = new PVector(random(100, 200), random(-200, -100), random(-1000, -200));
        corner2 = new PVector(random(100, 300), random(100, 200), random(-1000, -200));
        corner3 = new PVector(random(-200, -100), random(100, 200), random(-1000, -200));
        corner4 = new PVector(random(-200, -100), random(-200, -100), random(-1000, -200));
    }

    Megablock() {
        position = new PVector(random(-mapWidth, mapWidth), random(mapDepth-1000, mapDepth));
        isEnabled = true;

        // generate random shapes
        corner1 = new PVector(random(100, 200), random(-200, -100), random(-1000, -200));
        corner2 = new PVector(random(100, 300), random(100, 200), random(-1000, -200));
        corner3 = new PVector(random(-200, -100), random(100, 200), random(-1000, -200));
        corner4 = new PVector(random(-200, -100), random(-200, -100), random(-1000, -200));
    }

    public void draw() {
        stroke(map(dist(position.x, position.y, 0, 0), 1000, 8000, 100, 255));
        pushMatrix();
        translate(position.x, position.y, 0);
        renderBox();
        popMatrix();

        // update block
        update();
    }

    private void renderBox() {
        float k;
        if (position.y > 2000) {
            k = map(position.y, 2000, 8000, 1, 0);
        } else {
            k = 1;
        }
        beginShape(QUADS);
        // front
        vertex(300, -300, 0);
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner4.x, corner4.y, k*corner4.z);
        vertex(-300, -300, 0);
        // left
        vertex(-300, -300, 0);
        vertex(corner4.x, corner4.y, k*corner4.z);
        vertex(corner3.x, corner3.y, k*corner3.z);
        vertex(-300, 300, 0);
        // right
        vertex(300, -300, 0);
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner2.x, corner2.y, k*corner2.z);
        vertex(300, 300, 0);
        // top
        vertex(corner1.x, corner1.y, k*corner1.z);
        vertex(corner2.x, corner2.y, k*corner2.z);
        vertex(corner3.x, corner3.y, k*corner3.z);
        vertex(corner4.x, corner4.y, k*corner4.z);
        endShape(CLOSE);
    }

    public boolean isEnabled() {
        return isEnabled;
    }

    // move blocks towards players
    private void update() {

        // move blocks forward
        position.y-=player.getSpeed();

        // move blocks sideways
        position.x-=map(mouseX, 0, width, -15, 15);

        // check if it's out of bound, if so: reset
        if (position.y < -1000 || position.x > mapWidth || position.x < -mapWidth) {
            isEnabled = false;
        }

        // check if collision
        if ((position.y < 0) && abs(position.x) < 300) {
            isEnabled = false;
            player.collide();
        }
    }
}
class Player {
    private float speed;
    private float fanRotation;

    int collisions = 0;
    int collisionTimer = 0;

    // constructor
    Player() {
        speed = 10;

        // initial fan rotation
        fanRotation = 0;
    }

    // draw the player
    public void draw() {
        stroke(0);
        noFill();
        // pushMatrix();
        translate(0, -height/2, 0);
        rotateY(map(mouseX, 0, width, PI/3, -PI/3));
        rotateZ(map(mouseX, 0, width, PI/12, -PI/12));
        this.render();
        // popMatrix();

        // call the update function to update player status
        update();
    }

    public float getSpeed() {
        return speed;
    }

    // collide with player
    public void collide() {
        collisions++;
        collisionTimer = 30;
        if (speed > 10) speed *= 0.5f;
    }

    public boolean getCollide() {
        return (collisionTimer > 0);
    }

    private void update() {
        if (speed < 100) speed = lerp(speed, 100, 0.001f);
        // speed = map(mouseY, 0, height, 100, 10);
        fanRotation = (fanRotation >= TWO_PI) ? 0 : fanRotation + 0.01f * speed;
        if (collisionTimer > 0) collisionTimer--;
    }

    // render player frame
    private void render() {
        noFill();
        if (speed > 60) {
            stroke(
                constrain(map(speed, 60, 70, 0, 255), 0, 255),
                constrain(map(speed, 60, 100, 0, 255), 0, 255),
                constrain(map(speed, 80, 100, 0, 100), 0, 100)
                );
        }
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

        // render propeellers
        renderFan();
    }

    // rander propellers
    private void renderFan() {
        pushMatrix();
        translate(0, -52, -15);
        stroke(0);
        box(10);
        if (speed < 60) {
            // rotation is a function of time
            rotateY(fanRotation);
            for (int i = 0; i < 4; i++)  {
                rotateY(i * TWO_PI / 4);
                beginShape(TRIANGLE);
                vertex(0, 0, -5);
                vertex(-5, 0, -30);
                vertex(5, 0, -20);
                endShape();
            }
        } else {
            // draw afterburner
            beginShape(TRIANGLE);
            fill(255, 255, 255);
            vertex(-10, 0, 0);
            vertex(10, 0, 0);
            fill(0, 255, 255);
            vertex(0, -random(80, 130) * map(speed, 60, 100, 0.5f, 3), 0);
            endShape();

            // draw circular
            rotateX(PI/2);
            fill(255, 50);
            ellipse(0, 0, 60, 60);
        }
        popMatrix();
    }
}
class Title {
    boolean enabled = true;

    // contains the string of the message
    String message;

    // color of text
    int textColor;

    // keyframes - time
    int time = 0;
    int maxTime = 260;

    // flashing star and circle
    boolean flashC;

    // random flashing text offsets
    float x, y;
    boolean flash;

    // flash intial letter
    boolean flashI;

    Title(String msg) {
        message = msg;
        victorySound.play();
    }

    public void draw() {
        if (enabled) {
            // draw dimming
            noStroke();
            rectMode(CORNER);
            fill(0, constrain(map(time, 0, 20, 0, 175), 0, 175) - constrain(map(time, 178, maxTime, 0, 175), 0, 175));
            rect(0, 155, width, 200);

            // change fill
            textColor = color(
                // rgb
                255,
                constrain(map(time, 40, 120, 255, 213), 0, 255),
                constrain(map(time, 30, 40, 255, 0), 0, 255) + constrain(map(time, 40, 120, 0, 74), 0, 255),

                // alpha
                constrain(map(time, 10, 20, 0, 255), 0, 255) - constrain(map(time, 178, 230, 0, 255), 0, 255));

            textAlign(CENTER, CENTER);
            textFont(font);

            // change text size
            textSize(PApplet.parseInt(map(time, 10, 230, 150, 100)));

            // flash
            flashCircle();

            // flashing text
            flashText();

            // actual text
            fill(textColor);
            text(message, width/2, height/2 - 50);

            // flash initials
            flashInitial();

            // update text status
            update();
        }
    }

    private void flashCircle() {
        if (flashC) {
            noFill();
            stroke(255);
            strokeWeight(constrain(map(time, 10, 40, 30, 0), 0, 30));
            float diam = map(time, 10, 60, 50, 500);
            ellipse(width/2 - 150, height/2 - 60, diam, diam);
        }
    }

    private void flashText() {
        if (flash) {
            x = random(-10, 10);
            y = random(-10, 10);
            fill(textColor);
            pushMatrix();
            translate(width/2 + x, height/2 - 50 + y);
            for (int v = -1; v < 2; v++) {
                text(message, 3*v, 0);
                text(message, 0, 3*v);
            }
            fill(0);
            text(message, 0, 0);
            popMatrix();
        }
    }

    private void flashInitial() {
        if (flashI) {
            fill(255);
            textSize(PApplet.parseInt(map(time, 0, 15, 800, 150)));
            text(message.charAt(0), width/2-20*message.length(), height/2-50);
        }
    }

    private void update() {
        flash = (time > 20 && time < 70) && !flash;
        flashC = (time > 10 && time < 40);
        flashI = (time < 15);
        if (time < maxTime) {
            time++;
        } else {
            enabled = false;
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
