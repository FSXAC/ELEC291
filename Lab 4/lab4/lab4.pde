import processing.serial.*;

final int BAUD_RATE = 115200;
Serial ser;
String serin;
String[] serinp = {"0", "0"};

// graph
int vres = 5;
int hres = 8;

int frequency     = 0;
float capacitance = 0;

void setup() {
    size(1000, 700);
    stroke(5);

    // list number of ports
    printArray(Serial.list());

    // initialze serial
    ser = new Serial(this, Serial.list()[0], BAUD_RATE);
    background(0);

    // read garbage
    ser.readStringUntil('$');
}

void draw() {
    if (ser.available() > 0) {
        serin = ser.readStringUntil('\n');
        if (serin != null) {
            serin       = serin.substring(1, serin.length()-4);
            serinp      = serin.split(",");
            frequency   = Integer.parseInt(serinp[0]);
            capacitance = Float.parseFloat(serinp[1]);
        }
    }
    background(250);
    drawGrid(5, 200);
}

void drawGrid(float amplitude, int frequency) {
    // title
    textSize(24);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Voltage in Capacitor-Under-Testing", width / 2, 40);

    // vertical axis (at x = 100)
    textSize(16);
    stroke(50);
    strokeWeight(1);
    line(100, 100, 100, height - 100);
    text("v(t) [V]", 100, 80);

    // horizontal axis
    line(100, height-100, width-100, height-100);
    text("t", width-80, height-100);

    // vertical minor axis
    stroke(200);
    for (int i = 1; i <= vres; i++) {
        int y = height-100-i*(height-200)/(vres+1);
        line(101, y, width-100, y);
        text(String.format("%.2f", amplitude / (vres + 1) * i), 65, y);
    }

    // horizontal minor axis
    for (int i = 1; i <= hres; i++) {
        int x = 100+i*(width-200)/(hres+1);
        float delta_t = 1 / frequency 
        line(x, height-101, x, 100);
        text(String.format())
    }

}
