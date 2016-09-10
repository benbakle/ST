<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Resource.aspx.vb" Inherits="Resource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/technical_resources.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">
                <div class="resource-page">
                    <h2>Browse Our Library of Technical Resources</h2>
                    <br />
                    <br />
                    <hr />
                    <br />
                    <div class="column-container">
                        <div class="column text">
                            <h1>Unit Conversion Calculator </h1>
                            <br />
                            <br />
                            <p>
                                SensorTec's 
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Calculator.aspx">Unit Conversion Calculator</asp:LinkButton>
                                allows you to easily convert between English and Metric units with this handy calculator.
                            </p>
                            <br />
                            <br />
                            <h5>Available Calculators</h5>
                            <div class="indent">
                                <div class="column-container list">
                                    <div class="column">
                                        <p>Temperature</p>
                                        <p>Temperature to Ohms</p>
                                        <p>Distance / Length </p>
                                        <p>Area</p>
                                    </div>

                                    <div class="column list">
                                        <p>Volume</p>
                                        <p>Weight</p>
                                        <p>Presure</p>
                                        <p>Force</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="column graphic">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/icons/conversion-calculator-icon.png" PostBackUrl="~/Calculator.aspx" />
                        </div>
                    </div>
                    <div class="column-container">
                        <div class="column graphic">

                            <img src="images/icons/light-bulb.png" alt="" />
                        </div>

                        <div class="column text">
                            <h1>Sensor Theory</h1>
                            <br />
                            <br />
                            <p>
                                <asp:LinkButton ID="RTDTheory_LinkButton" runat="server" PostBackUrl="~/RTDTheory.aspx">RTD Theory</asp:LinkButton>
                                <br />
                                Learn the theory of Resistance Temperature Detectors (RTD's) and how they are manufactured.
                            </p>
                            <br />
                            <p>
                                <asp:LinkButton ID="ThermistorTheory_LinkButton" runat="server" PostBackUrl="~/ThermistorTheory.aspx">Thermistor Theory</asp:LinkButton>
                                <br />
                                Understand the defferences between RTD and Thermistor technology.
                            </p>
                            <br />
                            <p>
                                <asp:LinkButton ID="Thermocouple_LinkButton" runat="server" PostBackUrl="~/TCTheory.aspx">Thermocouple Theory</asp:LinkButton>
                                <br />
                                Discover the phenomenon of thermocouple temperature sensors.
                            </p>

                        </div>
                    </div>

                    <div class="column-container">
                        <div class="column text">
                            <h1>Tables & Charts</h1>
                            <br />
                            <br />
                            <div class="column-container list">
                                <div class="column">
                                    <p><a href="pdf/Temperature-Resistance.pdf">RTD Resistance Tables</a> </p>
                                    <p><a href="pdf/Thermocouple_Types.pdf">Thermocouple mV Tables</a> </p>
                                    <p><a href="pdf/ChemicalResistanceChart.pdf">Chemical Resistance Charts</a></p>
                                    <p><a href="pdf/CorrosiveServiceGuide.pdf">Corrosive Service Guide</a> </p>
                                </div>
                                <div class="column">
                                    <p><a href="pdf/Dairy%20End%20Cap%20Size%20Table.pdf">Dairy End Cap Size Table</a></p>
                                    <p><a href="pdf/Flange%20Size%20Table.pdf">Flange Size Table</a> </p>
                                    <p><a href="pdf/SheathMaterialGuide.pdf">Sheath Material Guide</a> </p>
                                    <p><a href="pdf/TemperatureConversionChart.pdf">Temperature Conversion Chart</a> </p>

                                </div>
                            </div>
                        </div>
                        <div class="column graphic">
                            <img src="images/icons/chart-icon.png" alt="" />

                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="paper-shadow">
        </div>
    </div>
</asp:Content>
