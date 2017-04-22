Battery
-------
 
Anyone running a battery-powered project knows how frustrating it can be when a battery dies or runs too low to prevent brown-out conditions. The [Uh-Oh Battery Level Indicator Kit](https://www.sparkfun.com/products/11087) can help prevent these frustrations.

[![Uh-Oh Battery
Indicator](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/11087-03.jpg)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/11087-03.jpg)

*Assembled Uh-Oh Battery Indicator Kit*

This guide will show you how to use your indicator after you have
soldered it all together.

### Suggested Reading

This is a pretty basic kit, but if you need a refresher on using a
multimeter, soldering, or electrical characteristics, please check out
the tutorials below.

-   [Voltage, Current , Resistance, and Ohm’s Law](https://learn.sparkfun.com/tutorials/voltage-current-resistance-and-ohms-law)
-   [Electric Power](https://learn.sparkfun.com/tutorials/electric-power)
-   [Battery Technology](https://learn.sparkfun.com/tutorials/battery-technologies)
-   [How to Solder](https://learn.sparkfun.com/tutorials/how-to-solder---through-hole-soldering)
-   [How to Use a Multimeter](https://learn.sparkfun.com/tutorials/how-to-use-a-multimeter)
-   [Resistors](https://learn.sparkfun.com/tutorials/resistors)
-   [Voltage Dividers](https://learn.sparkfun.com/tutorials/voltage-dividers)
-   [Diodes](https://learn.sparkfun.com/tutorials/diodes) and 
    [LEDS](https://learn.sparkfun.com/tutorials/light-emitting-diodes-leds)



Hookup Example
--------------

Once you have soldered your kit together, it’s time to start monitoring your battery levels. For this example, we will be hooking up the indicator to a [3.7V lipo battery](https://www.sparkfun.com/products/341) that is powering an [Arduino Uno](https://www.sparkfun.com/products/11021). We will also be including a [Power Cell- LiPo Charger/Booster](https://www.sparkfun.com/products/11231) in the circuit, to ensure that we can recharge the battery when it reaches the low voltage limit.

### Connections:

Uno → PowerCell Charger

-   5V → VCC
-   GND → GND

PowerCell Charger → Uh-Oh Indicator

-   PowerCell + → Sys +
-   PowerCell - → Sys -

Uh-Oh Indicator → Battery

-   The JST connector on the battery is notched and corresponds to the
    notch on the Uh-Oh Indicator.

Here is a Fritzing diagram showing the actual connections between the Uno, the PowerCell, the Uh-Oh indicator, and the battery.

[![Uh-Oh Battery Indicator Hooked up to an Arduino Fritzing Diagram](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/Uh-Oh_batteryHookUp_bb.jpg)](https://cdn.sparkfun.com/assets/d/5/4/6/0/Uh-Oh_batteryHookUp_bb.jpg)

[![Uh-Oh Battery Indicator Hooked up to an Arduino](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/Uh_Oh_Battery_Indicator_Hookup_Guide-01.jpg)](https://cdn.sparkfun.com/assets/learn_tutorials/2/0/4/Uh_Oh_Battery_Indicator_Hookup_Guide-01.jpg)

Once you have everything hooked up, you will need to adjust the trimpot
on the Uh-Oh indicator board to the voltage at which you would like to
be notified.


Setting the Threshold {#setting-the-threshold-}
---------------------

With everything hooked up correctly, it’s time to fine-tune the battery
indicator to your project’s needs. To do this, you’ll need a multimeter
to read the [resistance](https://learn.sparkfun.com/tutorials/how-to-use-a-multimeter/measuring-resistance) on the potentiometer, and thus set the voltage threshold at which the LED turns on.

First, if it’s plugged in, **unplug the battery from the indicator**. We
can only measure the resistance of the trimpot if there is no battery
present.

There are two test points located on the board. They are label on the
backside: **TP1** and **GND**.

[![test points](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/Uh_Oh_Battery_Indicator_Hookup_Guide-02.jpg)](https://cdn.sparkfun.com/assets/learn_tutorials/2/0/4/Uh_Oh_Battery_Indicator_Hookup_Guide-02.jpg)

Grab your handy-dandy multimeter, and set it to read resistance. Place
the positive probe on the TP1 point and the negative probe on GND.

[![probing test points](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/Uh_Oh_Battery_Indicator_Hookup_Guide-06.jpg)](https://cdn.sparkfun.com/assets/learn_tutorials/2/0/4/Uh_Oh_Battery_Indicator_Hookup_Guide-06.jpg)

Holding both probes in one hand, use your other hand to turn the potentiometer labeled ‘Adj.’ Turn it until the multimeter is reading the
desired resistance. Use the table below to help you find which voltage
threshold you need, and thus which resistance. To calculate these values
yourself or to find a value not listed on this table, visit the next
section.

  ----------------------- -------------------
  **Voltage Threshold**   **TP Resistance**
  3.0V                    8.3kΩ
  3.1V                    8.0kΩ
  3.2V                    7.8kΩ
  3.3V                    7.5kΩ
  3.4V                    7.3kΩ
  3.5V                    7.1kΩ
  3.6V                    6.9kΩ
  3.7V                    6.7kΩ
  ----------------------- -------------------

For example, if you want the LED to turn on when your LiPo battery
reaches a voltage of 3.2V, then you need the resistance of the trimpot
to be about 7.8kΩ.

[![Setting V threshold to
3.2V](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/Uh_Oh_Battery_Indicator_Hookup_Guide-04.jpg)](https://cdn.sparkfun.com/assets/learn_tutorials/2/0/4/Uh_Oh_Battery_Indicator_Hookup_Guide-04.jpg)


Calculating the Threshold
-------------------------

If you need a value not provided on the table int he previous section or
if you want to better understand how the Uh-Oh Battery Indicator works,
this section will go over how the indicator works.

In order to calculate the voltage threshold, we must consult the [schematic](http://cdn.sparkfun.com/datasheets/Kits/UhOh-v11_corrected.pdf) for the Uh-Oh Battery Indicator and the [datasheet](http://cdn.sparkfun.com/datasheets/Kits/TL431-D.pdf) for the TL431. These diagrams from the datasheet are particularly helpful. They show what is happening inside the TL431.

**Note that the R~1~ and R~2~ from this diagram are used in the voltage
divider equation below and *NOT* the R~1~ listed on the schematic.**

[![alt
text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/datasheet.jpg)](https://cdn.sparkfun.com/assets/learn_tutorials/2/0/4/datasheet.jpg)

The battery indicator works as a simple [voltage divider](https://learn.sparkfun.com/tutorials/voltage-dividers). The first bit of information needed is the forward voltage drop across the LED. In order to turn on, the LED needs *at least* 2.5V. This will serve as our V~out~ in the following voltage divider equation:

[![Vout = Vin \* (R2 / (R1 + R2))](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/CodeCogsEqn.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/CodeCogsEqn.gif)

The potentiometer used on this board is 10kΩ, so we can say

[![alt text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/CodeCogsEqn_2_.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/CodeCogsEqn_2_.gif)

Thus,

[![alt
text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/res.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/res.gif)

After we plug those values in, we are left with this equation:

[![alt
text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/2.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/2.gif)

Next, we need to figure out the V~in~. This is the value of the
battery’s voltage at which you want to be notified. For example, if you
wanted the LED to turn on when the battery reaches a voltage of 3.25V,
you would plug that value in for V~in~, and then solve for R~2~.

[![alt
text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/3.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/3.gif)

[![alt
text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/4.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/4.gif)

[![alt
text](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/5.gif)](./Uh-Oh%20Battery%20Level%20Indicator%20Hookup%20Guide%20-%20learn.sparkfun.com_files/5.gif)

Using the previous section as a guide, measure and turn the trimpot
until your multimeter reads about 7,692Ω.

You can use this equation to calculate any battery voltage threshold!

Resources and Going Further
---------------------------

Now that you know how to work with the Uh-Oh battery level indicator,
you can try to hack the board to work with different ratings of
batteries. Check out the ratings for the shunt regulator or consider
finding a different one.

### Resources

-   [TL431
    Datasheet](https://cdn.sparkfun.com/datasheets/Kits/TL431-D.pdf)
-   [GitHub
    Repository](https://github.com/sparkfun/Uh-Oh_Battery_Indicator)


