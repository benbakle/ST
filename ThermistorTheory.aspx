<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="ThermistorTheory.aspx.vb" Inherits="ThermistorTheory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/theory.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">
                <div class="theory">
                    <h1>
                        Thermistor Theory</h1>
                    <br />
                    <br />
                    <hr />
                    <br />
                    <p>
                        Thermistors are temperature sensing devices that are similar to RTD’s in that their
                        resistance changes as temperature changes. The major difference is that for most
                        thermistors that SensorTec Inc. manufactures, the resistance decreases as temperature
                        increases which is just opposite for RTD’s. Thermistors are an inexpensive alternative
                        to RTD’s when temperature ranges are below 150°C (302°F).
                    </p>
                    <br />
                    <p>
                        Unlike RTD’s, which have relatively few different resistances and have established
                        standards, thermistors are somewhat unregulated and offer 100’s of different resistances
                        and curves. Each thermistor element manufacturer offers many different curves and
                        resistances. This makes duplication of existing probes difficult.
                    </p>
                    <br />
                    <p>
                        Most thermistors have base resistances, which are much higher than RTD’s. They also
                        use 25°C as the base temperature (RTD’s use 0°C). One of the greatest advantages
                        of using a thermistor sensor is the large change in resistance to a relatively small
                        change in temperature. This makes them very sensitive to small changes in temperature.
                        Tolerances are not as tight as RTD tolerances but the high degree of resolution
                        helps offset this difference. Thermistors and RTD’s are not linear so the control
                        algorithms are not simple but with today’s technology this is not much of a factor.
                    </p>
                    <br />
                    <p>
                        Thermistors can be used from temperatures of –80°C to 300°C. Thermistors are made
                        by sintering various metal oxides together, attaching leads and packaging them in
                        a small epoxy coated body. This style thermistors is normally limited to a maximum
                        temperature of 150°C. Some of the higher temperature thermistors, which are glass
                        coated, can be used up to 300°C.
                    </p>
                    <br />
                    <p>
                        Thermistors can normally be packaged in the same manner as RTD’s. Most standard
                        sheath sizes and terminations apply to thermistors as well as RTD’s. Thermistors
                        are almost always a 2-wire circuit because leadwire resistance is a small factor
                        of overall resistance. A 10,000 ohm thermistor might change several ohms with 1
                        degree change in temperature so 1 or 2 ohms of leadwire resistance means very little.
                    </p>
                    <br />
                    <p>
                        To duplicate most existing applications, a working sample must be tested at several
                        different temperatures to determine a resistance curve. Consult SensorTec when trying
                        to retrofit existing thermistor applications.
                    </p>
                </div>
            </div>
        </div>
        <div class="paper-shadow">
        </div>
    </div>
</asp:Content>
