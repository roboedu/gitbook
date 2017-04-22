
Use NodeMCU to control Step motor through MQTT IOT protocol
===========================================================


### Use NodeMCU to control Step motor through MQTT IOT protocol


* http://kookye.com/2016/12/13/use-nodemcu-to-control-step-motor-through-mqtt-iot-protocol/


About NodeMCU

NodeMCU is a very popular Micro controller with wifi access. It is based
on ESP8266 – a cheap but powerful chip and fully support Arduino IDE. If
you familiar with Arduino IDE, you can program NodeMCU in no time.

**Objective:**

In this project, we will connect a step motor to a NodeMCU chip, then
use a MQTT client(mobile app, browser, linux terminal program etc) to
send signal to NodeMCU to control the motor rolling. When MQTT client
send message “1” , Step motor will make clockwise rolling. When MQTT
client send “0”, motor will make counter-clockwise rolling.

A ULN2003 motor drive module will connected between NodeMCU and step
motor. You can read more information about ULN2003 in
：<http://osoyoo.com/wp-content/uploads/2016/12/ULN2003datasheet.pdf>

**Connection Graph of Step Motor and ULN2003 chip:**

![](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/FRWXF7GHMMF4YR8.MEDIUM.jpg)
![](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/UNL2003-board.jpg)

**Parts and Devices**

NodeMCU board x 1 pc

stepper motor+bridge x 1 pc

jumper wires

**Circuit Connection Graph between ULN2003 and NodeMCU**

![](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/staermoter.png)

Note: It is highly recommend to provide separate 5V power to ULN2003
chip and the power supply should have same Ground as NODEMCU.

If you don’t have 5V power input , you can use VLN pin as substitution.

**Programming Prerequisite:**

Before running the project, we need set up the Arduino IDE as per
following procedures:

-   If you don’t have Arduino IDE, please go to
    <https://www.arduino.cc/en/Main/Software> download the IDE.
-   Add ESP8266 support in Arduino IDE, read this
    [how-to-use-arduino-ide-to-program-esp8266-wifi-module](http://kookye.com/2016/10/24/wemos-d1-wifi-arduino-esp8266/)
-   In Arduino IDE-&gt;Tools-&gt;Board Manager menu, select NodeMCU (0.9
    or higher) and corresponding COM port (showed in your device
    manager)

**Library Installation:**

In Arduino IDE, we need install MQTT client library to communicate with
MQTT broker, please download the library from following link:
<http://osoyoo.com/wp-content/uploads/samplecode/pubsubclient.zip>

If you don’t have Arduino Step motor library, please download from
<http://osoyoo.com/wp-content/uploads/2016/12/Stepper.rar>

Unzip above files, move the unzipped folder to Arduino IDE library
folder (you can also import these two zip files to Arduino library from
IDE).

**Download sample code from following link**

<http://osoyoo.com/wp-content/uploads/2016/12/nodemcu_stepper_motor.txt>
, copy the code into Arduino IDE. Before running the code, please do
following changes to fit your wifi and MQTT setting:

1)Line 19 and 20:

*const char\* ssid = “your\_hotspot\_ssid”;*

*const char\* password = “your\_hotspot\_password”;*

You need change these 2 lines to match your wifi SSID and password

2)Line 21

*const char\* mqtt\_server = “broker.mqtt-dashboard.com”;*

You can use your own MQTT broker URL or IP address to set above
mqtt\_server value. You can also use some famous free MQTT server to
test the project such as *“broker.mqtt-dashboard.com”, “iot.eclipse.org”
etc*

If you want to install your own MQTT broker in Ubuntu Linux, please read
this article
<http://osoyoo.com/2016/09/07/how-to-install-mosquitto-mqtt-server-on-linux>

3)if your MQTT server require username and password authentication, you
need change line 86

**Running the code**

After you running the code, please open the serial terminal window in
upright corner of Arduino IDE.

If wifi hotspot name and password setting is ok and MQTT broker is
connected, you will see following result:

[![led-nodemcu](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/led-nodemcu.png)](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/led-nodemcu.png)

After the NodeMCU connected to wifi and MQTT broker, it will subscribe
to a MQTT broker with topic “OsoyooCommand” and waiting for motor
control message. Let us publish a message from a MQTT client and test if
NodeMCU can get this message.

You can select any MQTT client tool to send control message to MQTT
broker(in this project, message must be under topic of “OsyooCommand”).
simply use google to search *MQTT client* in internet, or search *MQTT*
in Apple store or Google Play, you can find many free MQTT client
software. In my case, I uses MQTTBox for Windows, you can learn MQTTBox
configuration in following article:
<http://osoyoo.com/2016/12/02/nodemcu-potentiometer-mqtt/>

[![peizhighh](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/peizhighh.png)](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/peizhighh.png)

After click **Save** button, enter into Topic to publish screen，do
configuration as following picture:

![](./Use%20NodeMCU%20to%20control%20Step%20motor%20through%20MQTT%20IOT%20protocol%20–%20kookye.com_files/stringesp8266.png)

Make sure the topic your NodeMCU code *client.subscribe(“OsoyooCommand”)
fuction* mush match MQTTBOX *Topic to publish* value

After you publish a “0” or “1” message from payload text field, you step
motor will roll as per your instruction.


