void POTG() {
    image(playerImage, 0, 0, width, height);
    pTitle.draw();
}

class POTGTitle {
    boolean enabled = true;

    // keyframes - time
    int time = 0;
    int maxTime = 350;
    
    // position vectors for each text
    PVector text1 = new PVector(80, 200);
    PVector text2 = new PVector(text1.x + 20, text1.y + 80);
    PVector text3 = new PVector(text2.x + 10, text2.y + 30);
    float text1x = text1.x + 50;
    float text2x = text2.x + 70;
    float text3x = text3.x + 80;
    POTGTitle() {
    }

    public void draw() {
        textAlign(CORNER, CORNER);
        textFont(font);
        
        fill(255);
        textSize(50);
        text("PLAY OF THE GAME", text1.x, text1.y);
        textSize(30);
        text("AS "+PLAYER_ROLE, text3.x, text3.y);
        fill(255, 200, 0);
        textSize(100);
        text(PLAYER_NAME, text2.x, text2.y);
         
        // update text status
        update();
    }

    private void update() {
        if (time < maxTime) {
            time++;
            text1.x = lerp(text1.x, text1x, 0.007);
            text2.x = lerp(text2.x, text2x, 0.007);
            text3.x = lerp(text3.x, text3x, 0.007);
            if (time == maxTime - 20) {
                text1x += 100;
                text2x += 300;
                text3x += 500;
            }
        } else {
            // fake play of the game
            player.speed = random(40, 80);
            enabled = false;
        }
    }
}