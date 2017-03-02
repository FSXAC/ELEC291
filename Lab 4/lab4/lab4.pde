import processing.serial.*;

Serial ser;
String serin;
final int BAUD_RATE = 115200;

void setup() {
    size(1000, 500);
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
            println(serin.substring(1, serin.length()-3));
        }
        delay(100);
    }
}
