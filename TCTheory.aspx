<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="TCTheory.aspx.vb" Inherits="ThermistorTheory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/theory.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">
                <div class="theory">
                    <h1>
                        Thermocouple Theory</h1>
                    <br />
                    <br />
                    <hr />
                    <br />
                    <h4>
                        What is a Thermocouple?</h4>
                    <br />
                    <p>
                        A thermocouple circuit is formed when two dissimilar metals are joined at both ends
                        and there is a difference in temperature between the two ends. This difference in
                        temperature creates a small current and is called the Seebeck effect after Thomas
                        Seebeck who discovered this phenomenon in 1821.
                    </p>
                    <br />
                    <center>
                        <img src="images/diagrams/TC_diagram1.png" /></center>
                    <br />
                    <p>
                        When there is a difference in temperature between the two ends of this circuit,
                        a small voltage is formed within the circuit. This voltage or EMF (electro motive
                        force) is usually measured in the 1/1000th of a volt (millivolt). Most people’s
                        body produces more voltage than that! The higher the difference in temperature,
                        the higher the voltage. If the right pairs of materials are used, these thermocouple
                        circuits can be used to measure temperature.
                    </p>
                    <br />
                    <center>
                        <img src="images/diagrams/TC_diagram2.png" />
                    </center>
                    <br />
                    <p>
                        The junction that is put into the process in which temperature is being measured
                        is called the HOT JUNCTION. The other junction which is at the last point of thermocouple
                        material and which is almost always at some kind of measuring instrument, is called
                        the COLD JUNCTION.
                    </p>
                    <br />
                    <h4>
                        Cold Junction Compensation</h4>
                    <br />
                    <br />
                    <center>
                        <img src="images/diagrams/TC_diagram3.png" />
                    </center>
                    <br />
                    <p>
                        In the above example, one end of the thermocouple is @ 1000° and the other end is
                        @ 100° so the difference is 900°. If we wanted to measure the temperature in a furnace,
                        we could use a thermocouple to do so. If the above example were used, the temperature
                        inside the furnace is 1000° and the temperature outside is 100°, the thermocouple
                        would indicate a difference in temperature between the inside and outside of 900°.
                        The only problem with the example above is that we want to know the temperature
                        inside the furnace, not the difference between the outside and the inside. To do
                        this with a thermocouple, we need to apply “Cold Junction Compensation”. To apply
                        this cold junction compensation, all we need to know is the temperature of the cold
                        junction.
                    </p>
                    <br />
                    <center>
                        <img src="images/diagrams/TC_diagram4.png" />
                    </center>
                    <br />
                    <p>
                        The measuring instrument normally does this cold junction compensation. The instrument
                        measures the temperature at the point where the thermocouple attaches and adds that
                        temperature back in to the equation as per the above example. The instrument then
                        displays the result of this equation. It is important to maintain thermocouple material
                        throughout the circuit as in the case of a sensor that is located some distance
                        from the measuring instrument. Specially coded extension wire is normally used.
                    </p>
                    <br />
                    <center>
                        <img src="images/diagrams/TC_diagram5.png" />
                    </center>
                    <br />
                    <p>
                        In the above example, thermocouple extension wire was not used in the circuit and
                        so an error has occurred due to incorrect cold junction compensation.
                    </p>
                    <br />
                    <h4>
                        Thermocouple Reference Tables</h4>
                    <br />
                    <p>
                        Tables have been established worldwide that show temperature vs. millivolt output
                        figures for the various accepted thermocouple combinations or “types”. These reference
                        tables are all based on a reference or cold junction temperature of 32°F (0°C),
                        which is the freezing point of pure water. All manufacturers follow these reference
                        tables, which are published in ASTM document E-230.
                    </p>
                    <br />
                    <hr />
                    <br />
                    <u>
                        <h2>
                            Thermocouple Types</h2>
                    </u>
                    <br />
                    There are several different recognized thermocouple types available. Each type has
                    different useful temperature ranges as well as different recommended applications.
                    ASTM, which is recognized in the United States as the authority for temperature
                    measurement, has established guidelines for the different thermocouple types. These
                    guidelines cover composition, color codes, and manufacturing specifications.
                    <br />
                    <br />
                    <h4>
                        Base Metal Thermocouples</h4>
                    <p>
                        Base metal thermocouple types are composed of common, inexpensive metals such as
                        nickel, iron and copper. The thermocouple types E, J, K, N and T are among this
                        group and are the most commonly used type of thermocouple. Each leg of these different
                        thermocouples is composed of a special alloy, which is usually referred to by their
                        common names.
                    </p>
                    <br />
                    <h5>
                        Type E</h5>
                    <p class="indent">
                        The type E thermocouple is composed of a positive leg of chromel (nickel/10% chromium)
                        and a negative leg of constantan (nickel/45% copper). The temperature range for
                        this thermocouple is –330 to 1600°F (-200 to 900°C). The type E thermocouple has
                        the highest millivolt (EMF) output of all established thermocouple types. Type E
                        sensors can be used in sub-zero, oxidizing or inert applications but should not
                        be used in sulfurous, vacuum or low oxygen atmospheres. The color code for type
                        E is purple for positive and red for negative.
                    </p>
                    <br />
                    <h5>
                        Type J</h5>
                    <p class="indent">
                        Type J thermocouples have an iron positive leg and a constantan negative leg. Type
                        J thermocouples have a useful temperature range of 32 to 1400°F (0 to 750°C) and
                        can be used in vacuum, oxidizing, reducing and inert atmospheres. Due to the oxidation
                        (rusting) problems associated with the iron leg, care must be used when choosing
                        this type for use in oxidizing environments above 1000°F. The color code for type
                        J is white for positive and red for negative.
                    </p>
                    <br />
                    <h5>
                        Type K</h5>
                    <p class="indent">
                        The type K thermocouple has a Chromel positive leg and an Alumel (nickel/ 5% aluminum
                        and silicon) negative leg. The temperature range for type K alloys is –328 to 2282°F
                        (-200 to 1250°C). Type K sensors are recommended for use in oxidizing or completely
                        inert environments. Type K and type E should not be used in sulfurous environments.
                        Because type K has better oxidation resistance then types E, J and T, its main area
                        of usage is at temperatures above 1000°F but vacuum and low oxygen conditions should
                        be avoided.
                    </p>
                    <br />
                    <h5>
                        Type N</h5>
                    <p class="indent">
                        Type N thermocouples are made with a Nicrosil (nickel – 14% chromium – 1.5 % silicon)
                        positive leg and a Nisil (nickel – 4.5% silicon - .1% magnesium) negative leg. The
                        temperature range for Type N is –450 to 2372°F (-270 to 1300°C) and the color code
                        is orange for positive and red for negative. Type N is very similar to Type K except
                        that it is less susceptible to selective oxidation. Type N should not be used in
                        vacuum and or reducing environments in an unsheathed design.
                    </p>
                    <br />
                    <h5>
                        Type T</h5>
                    <p class="indent">
                        Type T thermocouples are made with a copper positive leg and a constantan negative
                        leg. The temperature range for type T is –328 – 662°F (-200 to 350°C) and the color
                        code is blue for positive and red for negative. Type T sensors can be used in oxidizing
                        (below 700°F), reducing or inert applications.
                    </p>
                    <br />
                    <br />
                    <h4>
                        Noble Metal Thermocouples</h4>
                    <p>
                        Noble metal thermocouples are manufactured with wire that is made with precious
                        or “noble” metals like Platinum and Rhodium. Noble metal thermocouples are for use
                        in oxidizing or inert applications and must be used with a ceramic protection tube
                        surrounding the thermocouple element. These sensors are usually fragile and must
                        not be used in applications that are reducing or in applications that contain metallic
                        vapors.</p>
                    <br />
                    <h5>
                        Type R</h5>
                    <p class="indent">
                        Type R thermocouples are made with a platinum/13% rhodium positive leg and a pure
                        platinum negative leg. The temperature range for type R is 32 – 2642°F (0 to 1450°C)
                        and the color code is black for positive and red for negative.
                    </p>
                    <br />
                    <h5>
                        Type S</h5>
                    <p class="indent">
                        Type S thermocouples are made with a platinum/10% rhodium positive leg and a pure
                        platinum negative leg. The temperature range for type S is 32 – 2642°F (0 to 1450°C)
                        and the color code is black for positive and red for negative.
                    </p>
                    <br />
                    <h5>
                        Type B</h5>
                    <p class="indent">
                        Type B thermocouples are made with a platinum/30% rhodium positive leg and a platinum/6%
                        Rhodium negative leg. The temperature range for type r is 32 – 3092°F (0 to 1700°C)
                        and the color code is gray for positive and red for negative
                    </p>
                    <br />
                    <h4>
                        Refractory Metal Thermocouples</h4>
                    <p>
                        Refractory metal thermocouples are manufactured with wire that is made from the
                        exotic metals tungsten and Rhenium. These metals are expensive, difficult to manufacture
                        and wire made with these metals are very brittle. These thermocouples are intended
                        to be used in vacuum furnaces at extremely high temperatures and must never be used
                        in the presence of oxygen at temperatures above 500°F. There are several different
                        combinations of alloys that have been used in the past but only one generally used
                        at this time.
                    </p>
                    <br />
                    <h5>
                        Type C</h5>
                    <p class="indent">
                        The type C thermocouple is made with a tungsten/5% rhenium positive leg and tungsten
                        26% rhenium negative leg and has a temperature range of 32 – 4208°F (0 – 2320°C).
                        The color code for this type is white with red tracer for positive leg and red for
                        the negative leg.
                    </p>
                    <br />
                    <h4>
                        Limits of Error</h4>
                    <p>
                        Accuracy of temperature sensors is referred to as limits of error and apply only
                        to brand new, un-used temperature sensors. Once a sensor is exposed to elevated
                        temperatures, there is no guaranteed accuracy. All manufacturers adhere to these
                        limits, which are establish by ASTM and are covered under their publication ASTM
                        E –230. The Limits of Error tables appear in the SensorTec catalog as well as many
                        competing manufactures catalogs.
                    </p>
                    <br />
                    <h4>
                        Thermocouple Extras</h4>
                    <p>
                        According to ASTM color code guidelines, which apply to most North American sensor
                        manufacturers, the Red leg is always negative.
                    </p>
                    <p>
                        2 types of thermocouples (types J and K) have one leg, which is magnetic. With these
                        2 types, you can use a magnet to determine polarity.
                    </p>
                    <p>
                        The hot junction of a thermocouple can be made by any means possible as long as
                        there is good, constant contact between the two wires.
                    </p>
                    <p>
                        Special limits of error thermocouple sensors do not have to have special limits
                        of error extension wire.
                    </p>
                    <p>
                        Non-thermocouple materials can be used in thermocouple circuits under the right
                        conditions. Non-thermocouple connectors, terminals and slices can be used as long
                        as there is no temperature gradient present at the areas where these items are used.
                    </p>
                    <p>
                        Extension wire does not have to be a large gauge to work in an application where
                        the sensor is placed a long way from the measuring instrument. Most modern temperature
                        monitoring instruments are current based so lead wire resistance is not critical.
                    </p>
                    <p>
                        It is possible to get an average temperature reading using multiple thermocouples
                        as long as the sensors are wired in parallel and the resistance of these different
                        sensors is the same.
                    </p>
                </div>
            </div>
        </div>
        <div class="paper-shadow">
        </div>
    </div>
</asp:Content>
