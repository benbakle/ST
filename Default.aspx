<%@ Page Title="SensorTec, Inc. | Innovative Sensors" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>Home Page</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <!----- SCROLLABLE ----->
    <div class="scroll-container">
        
        <div class="scrollable">
            <a class="prev browse left"></a>
            <div class="items">
                <div>
                    <a href="Topic.aspx?ID=1">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/standard_rtd_title.png" alt="rtd" />
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/rtd.png" alt="rtd" /></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=2">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/mgo_title.png" alt="mgo"/>
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/mgo.png" alt="mgo" /></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=3">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/plastics_title.png" alt="plastics" />
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/plastics.png" alt="plastics"/></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=4">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/industrial_title.png" alt="industrial thermocouples"  />
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/industrial.png" alt="industrial thermocouples"/></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=5">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/thermowell_assemblies_title.png" alt="thermowell assemblies" />
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/thermowell_assemblies.png" alt="thermowell assemblies"/></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=6">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/food_dairy_title.png" alt="food and dairy" />
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/food_dairy.png" alt="food and dairy"/></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=7">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/instruments_title.png" alt="instruments"/>
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/transmitters.png" alt="instruments"/></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Topic.aspx?ID=8">
                        <div class="paper">
                            <div class="item-container">
                                <div class="item-container-title">
                                    <img src="images/product/accessories_title.png" alt="accessories"/>
                                </div>
                                <div class="item-container-img">
                                    <img src="images/product/wire_accessories.png" alt="accessories"/></div>
                            </div>
                        </div>
                        <div class="paper-shadow">
                        </div>
                    </a>
                </div>
            </div>
               <a class="next browse right"></a>
        </div>
     
    </div>
    <div class="navi">
        <a href="0" class="navbtn active" title="Standard RTD's"></a>
        <a href="1" class="navbtn" title="Mineral Insulated Thermocouples (MgO)"></a>
        <a href="2" class="navbtn" title="Plastics/Packaging Industry T/C's & RTD's"></a>
        <a href="3" class="navbtn" title="Industrial Thermocouples"></a>
        <a href="4" class="navbtn" title="Thermowell Assemblies & Thermowells"></a>
        <a href="5" class="navbtn" title="Food, Dairy & Pharmaceutical Probes"></a>
        <a href="6" class="navbtn" title="Temperature Transmitters & Instruments"></a>
        <a href="7" class="navbtn" title="Wire & Accessories"></a>
    </div>
</asp:Content>
