import processing.serial.*;

final int BAUD_RATE = 115200;
Serial ser;
String serin;
String[] serinp = {"0", "0"};

// graph
int vres = 5;
int hres = 8;
String[] units = {"s", "ms", "us", "ns", "ps"};
int unitsIndex = 0;

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
    drawGrid(5, ceil(frequency/500.0)*500);
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

    // zero
    text("0", 65, height-80);

    // vertical minor axis
    stroke(200);
    for (int i = 1; i <= vres; i++) {
        int y = height-100-i*(height-200)/(vres+1);
        line(101, y, width-100, y);
        text(String.format("%.2f", (amplitude) / vres * i), 65, y);
    }

    // horizontal minor axis
    float delta_t = 0.25 / frequency; // quarter period
    // change units
    unitsIndex = 0;
    while (delta_t < 0.1 && unitsIndex < 4) {
        delta_t *= 1000;
        unitsIndex++;
    }
    for (int i = 1; i <= hres; i++) {
        int x = 100+i*(width-200)/(hres+1);
        line(x, height-101, x, 100);
        text(String.format("%.2f%s", i * delta_t, units[unitsIndex]), x, height-80);
    }

}
