<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Calculator.aspx.vb" Inherits="Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/calculator.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">
                <asp:UpdatePanel ID="Calculate_UpdatePanel" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="Calculate_Panel" runat="server">
                            <div class="calculator-container">
                                <div class="calculator-select">
                                    The
                                    <h5>
                                        Unit Conversion Calculator</h5>
                                    allows you to easily convert between English and Metric units. Simply select the
                                    calculator you would like to view from the drop down menu. Enter the value in the
                                    textbox and click "Calculate" to get remaining values.
                                    <br />
                                    <br />
                                    The calculator will select the first non-blank value it encounters, and convert
                                    that value to each of the other units on the calculator's display.
                                    <br />
                                    <br />
                                    <hr />
                                    <br />
                                    <asp:DropDownList ID="Conversion_DropDownList" runat="server" AutoPostBack="true"
                                        Width="200px">
                                        <asp:ListItem Value="Temperature">Temperature</asp:ListItem>
                                        <asp:ListItem Value="Ohms">Temperature to Ohms</asp:ListItem>
                                        <asp:ListItem Value="Length">Distance/Length</asp:ListItem>
                                        <asp:ListItem Value="Area">Area</asp:ListItem>
                                        <asp:ListItem Value="Volume">Volume</asp:ListItem>
                                        <asp:ListItem Value="Weight">Weight</asp:ListItem>
                                        <asp:ListItem Value="Pressure">Pressure</asp:ListItem>
                                        <asp:ListItem Value="Force">Force</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="calculator-conversion">
                                    <h2>
                                        <asp:Label runat="server" ID="Calculator_Label" />
                                        Calculator</h2>
                                    <br />
                                    <br />
                                    <hr />
                                    <br />
                                    <asp:Panel ID="Ohms_Panel" runat="server">

                                        <h4>Ohms at 0°C</h4>
                                        <asp:RadioButtonList ID="Ro_RadioButtonList" runat="server" CssClass="radio-list" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="100" Selected="True">100 Ohm</asp:ListItem>
                                            <asp:ListItem Value="500">500 Ohm</asp:ListItem>
                                            <asp:ListItem Value="1000">1000 Ohm</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <br />
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Celsius:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="OhmsCelsius_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>
                                                    <h4>
                                                        0.00385:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Curve385_TextBox" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>
                                                    <h4>
                                                        0.00392:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Curve392_TextBox" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="Length_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Meters:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Meters_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Millimeters:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Millimeters_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Inches:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Inches_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Feet:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Feet_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Yards:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Yards_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Miles:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Miles_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Kilometers:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Kilometers_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </asp:Panel>



                                    <asp:Panel ID="Area_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Meters:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareMeters_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Millimeters:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareMil_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Inches:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareInches_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Feet:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareFeet_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Yards:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareYards_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Miles:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareMiles_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Square Kilometers:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="SquareKilo_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </asp:Panel>




                                     <asp:Panel ID="Volume_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Liters:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Liters_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Fluid Ounces:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="FluidOunces_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Quarts:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Quarts_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Gallons:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Gallons_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Cubic Feet:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="CubicFeet_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Cubic Yards:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="CubicYards_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Cubic Meters:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="CubicMeters_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </asp:Panel>



                                    <asp:Panel ID="Weight_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Kilograms:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Kilograms_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Ounces:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Ounces_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Pounds:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Pounds_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Short Tons:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ShortTons_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Metric Tons:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="MetricTons_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                        <br />
                                    </asp:Panel>





                                    <asp:Panel ID="Temperature_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Celsius:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Celsius_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Fahrenheit:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Fahrenheit_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Kelvin:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Kelvin_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                        <br />
                                    </asp:Panel>



                                    <asp:Panel ID="Pressure_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        kPa:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="kPa_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        psi:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="psi_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                        <br />
                                    </asp:Panel>



                                    <asp:Panel ID="Force_Panel" runat="server">
                                        <table class="table-pad">
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Newtons:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Newtons_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h4>
                                                        Pounds:</h4>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ForcePounds_TextBox" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                        <br />
                                    </asp:Panel>










                                    <br />
                                    <hr />
                                    <br />
                                    <div class="inline-list align-right">
                                        <ul>
                                            <li>
                                                <asp:LinkButton runat="server" ID="Calculate_LinkButton" Text="Calculate" CssClass="button" />
                                            </li>
                                            <li>
                                                <asp:LinkButton runat="server" ID="Clear_LinkButton" Text="Clear" CssClass="button" />
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="clear">
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="paper-shadow">
        </div>
    </div>
</asp:Content>
