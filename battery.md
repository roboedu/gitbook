### Battery Life

This tutorial gives an overview on how to determine the duration of a recharegeable battery connected to an 

[Arduino/Genuino MKR1000](https://www.arduino.cc/en/Main/ArduinoMKR1000)

Using a simple formula, it is possible to calculate how long a charge can last. The duration is related to the current drawn by the board under different conditions that depend on the sketch and the hardware functionalities used. In this example we use a [LiPo] battery
rated at 1400mAh.

### Hardware Required

-   Arduino/Genuino MKR1000 Board
-   1400mAh LiPo battery

### The Circuit

Battery connected to the board through the on-board JST connector


[![](./Arduino%20-%20MKR1000BatteryLife_files/ArduinoMKR1000Battery_bb.png){width="400px"}](./Arduino%20-%20MKR1000BatteryLife_files/ArduinoMKR1000Battery_bb.png){.urllink}


#### Note

The charging circuit on the MKR1000 board has a charge
current fixed at 350mA and a standby charge time of 4 hours.
LiPo battieries should not be charged with a current higher
than a half of the total capacity. MKR1000 is therefore
designed to use batteries with **'at least 700mAh**' of capacity. The
maximum capacity is not critical, but bigger batteries require more time
to fully charge, therefore we suggest a **maximum** of 1400-1500mAh.

### Computing Battery Life

Computing how long a battery can last is generally speaking quite
simple. Each rechargeable battery has its capacity printed on its
package, expressed in mAh. This value means that the battery is able to
provide the current stated for one hour and after that it will be
depleted. If we draw less current, the battery will take more time to
discharge. If we know the average current consumption of our circuit we
can compute the battery life, expressed in hour using the following
formula:

Battery Life = (Battery Capacity) / (Average Current Consumption) * 0.7

If we want the **worst case** for battery life duration, we can use the
maximum current absorbed by our circuit instead of the average one:

Battery Life = (Battery Capability) / (Maximum Current Consumption) *0.7

#### Note

Please note that the factor of 0.7 makes allowances for external factors
which can affect battery life for *out of specs* usage (deep discharge
under suggested voltage, mechanical stress etc).

### MKR1000 current consumption

The main feature of the MKR1000 board that affects battery
life is the WiFi connectivity: it absorbs roughly 100mA
when connected to an Access Point and data transfers are on-going. If
the WiFi module is not initialized, it is automatically set
into low power mode. The consumption of the micro-controller is about
20mA. A sketch using WiFi connection has therefore an
average current absorption of 120mA. If we run this information in our
formula we get:

Application Run Time = Battery Life = (1400mAh) / (120mA) \* 0.7 = 8.16h

This estimate has been made running the sketch listed below.

http://arduino.cc/en/Tutorial/WiFiWebClientRepeating

```
/*
  Repeating Wifi Web Client

 This sketch connects to a a web server and makes a request
 using an Arduino Wifi shield.

 Circuit:
 * WiFi shield attached to pins SPI pins and pin 7

 created 23 April 2012
 modified 31 May 2012
 by Tom Igoe
 modified 13 Jan 2014
 by Federico Vanzati

 http://www.arduino.cc/en/Tutorial/WifiWebClientRepeating
 This code is in the public domain.
 */

#include <SPI.h>
#include <WiFi.h>

char ssid[] = "yourNetwork";      //  your network SSID (name)
char pass[] = "secretPassword";   // your network password
int keyIndex = 0;            // your network key Index number (needed only for WEP)

int status = WL_IDLE_STATUS;

// Initialize the Wifi client library
WiFiClient client;

// server address:
char server[] = "www.arduino.cc";
//IPAddress server(64,131,82,241);

unsigned long lastConnectionTime = 0;            // last time you connected to the server, in milliseconds
const unsigned long postingInterval = 10L * 1000L; // delay between updates, in milliseconds

void setup() {
  //Initialize serial and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  // check for the presence of the shield:
  if (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present");
    // don't continue:
    while (true);
  }

  String fv = WiFi.firmwareVersion();
  if (fv != "1.1.0") {
    Serial.println("Please upgrade the firmware");
  }

  // attempt to connect to Wifi network:
  while (status != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(ssid);
    // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
    status = WiFi.begin(ssid, pass);

    // wait 10 seconds for connection:
    delay(10000);
  }
  // you're connected now, so print out the status:
  printWifiStatus();
}

void loop() {
  // if there's incoming data from the net connection.
  // send it out the serial port.  This is for debugging
  // purposes only:
  while (client.available()) {
    char c = client.read();
    Serial.write(c);
  }

  // if ten seconds have passed since your last connection,
  // then connect again and send data:
  if (millis() - lastConnectionTime > postingInterval) {
    httpRequest();
  }

}

// this method makes a HTTP connection to the server:
void httpRequest() {
  // close any connection before send a new request.
  // This will free the socket on the WiFi shield
  client.stop();

  // if there's a successful connection:
  if (client.connect(server, 80)) {
    Serial.println("connecting...");
    // send the HTTP PUT request:
    client.println("GET /latest.txt HTTP/1.1");
    client.println("Host: www.arduino.cc");
    client.println("User-Agent: ArduinoWiFi/1.1");
    client.println("Connection: close");
    client.println();

    // note the time that the connection was made:
    lastConnectionTime = millis();
  } else {
    // if you couldn't make a connection:
    Serial.println("connection failed");
  }
}


void printWifiStatus() {
  // print the SSID of the network you're attached to:
  Serial.print("SSID: ");
  Serial.println(WiFi.SSID());

  // print your WiFi shield's IP address:
  IPAddress ip = WiFi.localIP();
  Serial.print("IP Address: ");
  Serial.println(ip);

  // print the received signal strength:
  long rssi = WiFi.RSSI();
  Serial.print("signal strength (RSSI):");
  Serial.print(rssi);
  Serial.println(" dBm");
}
```

[Get Code](https://www.arduino.cc/en/Tutorial/MKR1000BatteryLife?action=sourceblock&num=1)


### Computing your application average current consumption

The fastest way to compute your application current consumption is by
means of an ammeter. To do this you can use the following circuit.


![image](./Arduino%20-%20MKR1000BatteryLife_files/ArduinoMKR1000Ammeter_bb.png)


Once you have the ammeter reading you can easily use the formula we used
before.


