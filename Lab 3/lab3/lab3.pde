import processing.serial.*;

Serial  SPI_at89;
int     ADC_value;
int     BAUD_RATE = 115200;

void setup() {
    size(500, 300);

    // list number of ports
    printArray(Serial.list());

    // initialze serial
    SPI_at89 = new Serial(this, Serial.list()[0], BAUD_RATE);
    background(0);
}


int     ADC_number;
String  SPI_read;
float   V_out;
float   temperature;

int x = 0;
float y, y_prev, y_tgt;

void draw() {
    if (SPI_at89.available() > 0) {
        SPI_read = SPI_at89.readString();
        println(SPI_read);

        if (SPI_read.length() > 3 && SPI_read != "\r\n") {
            SPI_read = SPI_read.substring(0, SPI_read.length()-2);
            SPI_read = SPI_read.replaceFirst("^0+(?!$)", "");

            try {
                ADC_number = Integer.parseInt(SPI_read);
            } catch (NumberFormatException e) {
                println(e);
            }

            V_out       = ADC_number / 1023.0 * 5;
            temperature = (V_out - 2.73) * 100;

            // graphic
            if (temperature < -40) {
                temperature = -40;
            }
            y_prev = y;
            y_tgt  = map(temperature, -50, 120, height, 0);


            fill(0, 5);
            rect(0, 50, width, height-50);
            fill(0);
            rect(0, 0, width, 50);
            fill(20);
            rect(width - 80, 0, 80, height);

            y = lerp(y, y_tgt, 0.8);
            stroke(
                map(y, 0.3 * height, 0.7 * height, 255, 0),
                (1 - sq(map(y, 0, height, -1, 1))) * 255,
                map(y, 0.3 * height, 0.7 * height, 0, 255)
                );
            strokeWeight(3);
            line(x, y, x-5, y_prev);
            if (x >= width - 80) {
                x = 0;
            } else {
                x+= 5;
            }
            noStroke();

            fill(255);
            text(String.format("%.2f", temperature) + " C", width - 75, y);
            text(String.format("%.4f", V_out) + " V", width - 75, y + 12);
        }
    }
}
