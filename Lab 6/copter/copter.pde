// helicopter game made using processing
// controlled using the f38x microcontroller

// sound libarry
import processing.sound.*;

// serial
import processing.serial.*;

// serial
Serial ser;
String serInput;
String[] serInputComponents = new String[3];

// game constants
final String PLAYER_NAME = "MUCHEN HE";
final String PLAYER_ROLE = "PROGRAMMER";

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
SoundFile boostSound;

// create player object
Player player;
float playerSpeed_tgt = 30;

// create obsticle objects
Block[] blocks = new Block[maxBlocks];
Megablock mBlock = new Megablock(new PVector(random(-mapWidth, mapWidth), mapDepth));

// lateral movement
float turnValue_tgt = 400;
float turnValue;
float turnOffset_tgt;
float turnOffset = 0;
float trackOffset = 0;

// boosting
boolean boostButton = false;
final int boostDistance = 30000;

// game conditions
boolean collideBeep = false;
boolean gameOver;
boolean playOfTheGame;
PImage playerImage;
POTGTitle pTitle;

void setup() {
    size(800, 600, P3D);
    player = new Player();

    // serial initialize
    if (ser == null) {
      ser = new Serial(this, Serial.list()[0], 115200);
      ser.readStringUntil('$');
    }

    // spawn random blocks
    for (int i = 0; i < blocks.length; i++) {
        blocks[i] = new Block(new PVector(random(-mapWidth, mapWidth), random(500, mapDepth)));
    }

    // load font
    font = createFont("data/big_noodle_titling_oblique.ttf", 100, true);

    // load sound
    victorySound = new SoundFile(this, "victory.mp3");
    boostSound = new SoundFile(this, "boost.mp3");
    
    // load ending image
    String filename = "group" + ((random(1) < 0.5) ? "0" : "1") + ".jpg";
    println(filename);
    playerImage = loadImage(filename);
    
    // initialize game
    gameOver = false;
    playOfTheGame = false;
    pTitle = new POTGTitle();
}

void draw() {
    // play of the game separate loop
    if (playOfTheGame && !title.enabled && pTitle.enabled) {
        POTG();
    } else {
        // setup background and camera
        // background(216, 251, 255);
        background(#6589A7);
        ambientLight(50, 50, 50);
        directionalLight(255,255,255,0,1, 0);
        directionalLight(255,255,255,0,0, -1);
    
        // camera offsets
        pushMatrix();
    
        // get control input from SPI
        if (ser.available() > 0 && !gameOver) {
            ser.readStringUntil('$');
            serInput = ser.readStringUntil(';');
            if (serInput != null) {
                serInput = serInput.substring(0, serInput.length() - 1);
    
                // get numerical values
                serInputComponents = serInput.split(",");
                if (!player.boosting) {
                    playerSpeed_tgt = map(Integer.parseInt(serInputComponents[0]), 0, 1023, 10, 60);
                } else {
                    playerSpeed_tgt = 120;
                }
                turnValue_tgt = map(Integer.parseInt(serInputComponents[1]), 0, 1023, 0, width);
                boostButton = (Integer.parseInt(serInputComponents[2]) == 1) ? false : true;
            }
        }
            
        // smooth out potentiometer turn
        turnValue = lerp(turnValue, turnValue_tgt, 0.5);
    
        // translating control into graphics
        turnOffset_tgt = map(turnValue - width/2, -width/2, width/2, 80, -80);
        turnOffset = lerp(turnOffset, turnOffset_tgt, 0.1);
        trackOffset = lerp(trackOffset, (player.getSpeed() > 60) ? -200 : -100, 0.05);
        translate(width/2 + turnOffset, height/2+100, trackOffset);
        rotateX(3*PI/2 - radians(5));
    
        // screenshake
        if (player.getSpeed() > 60) {
            translate(random(-2, 2), random(-2, 2), random(-2, 2));
        }
        if (player.getCollide()) {
            ser.write('1');
            float pSpeed = map(player.getSpeed(), 10, 100, 10, 50);
            translate(random(-pSpeed, pSpeed), 0,  random(-pSpeed, pSpeed));
        } else ser.write('0');
    
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
            stroke(50);
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
    
        // boosting and score gui
        if (!gameOver) {
            if (player.boostAvailable) fill(#30BAFC);
            else noFill();
            strokeWeight(5);
            stroke(255);
            arc(60, 60, 50, 50, 0, TWO_PI * player.distance / boostDistance);
    
            // distance and life
            textFont(font);
            textSize(30);
            fill(255);
            text("SCORE: "+String.format("%.0f", player.score), width/2, 50);
            if (player.fuel < 100) fill(255, 0, 0);
            text("FUEL: "+String.format("%.1f", player.fuel/10)+"%", width - 200, 50);
        }
    
        // draw title
        if (title != null) {
            title.draw();
        }
    
        // winning condition
        if (player.fuel <= 0 && !gameOver && !player.boosting) {
            gameOver = true;
            turnValue_tgt = width/2;
            playerSpeed_tgt = 0;
            title = new Title("Complete!", true);
        }
    
        // display score
        if (gameOver && !title.enabled && !playOfTheGame) {
            title = new Title(String.format("%.0f", player.score), false);
            if (!playOfTheGame) playOfTheGame = true;
        }
        
        // fake play of the game
        if (playOfTheGame && !pTitle.enabled) {
             turnValue_tgt = width * noise(millis()*0.001);
             playerSpeed_tgt = map(noise(millis()*0.001), 0, 1, 10, 120);
        }
    }
}

void mousePressed() {
    setup();
}

// debug axis
void drawAxis() {
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