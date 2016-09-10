<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="QPDefault.aspx.vb" Inherits="QuickPrice_QPDefault" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/quickprice-default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">
                <div class="qp-introduction">
                    <img src="../images/logos/quickprice.png" alt="" />
                    <br />
                    <br />
                    <hr />
                    <div class="column-container">
                        <div class="column text">
                            <h1>What is QuickPrice?</h1>
                            <br />
                            <br />
                            <p>
                                <b>QuickPrice</b> is a proprietary web application created by SensorTec Inc. to allow customers
                to quickly create a part number as well as acquire pricing discounts on many of SensorTec's
                catalog parts.
                            </p>
                        </div>
                        <div class="column graphic">
                            <img src="../images/quickprice.png" alt="" />
                        </div>
                    </div>

                    <div class="column-container">
                        <div class="column text">
                            <h1>Easy as 1... 2... 3...</h1>
                            <br />
                            <br />
                            <p>
                                Easily render a quote using <b>QuickPrice</b>'s three step process.
                            </p>
                            <br />

                            <div class="column-container steps">
                                <div class="column">
                                    <h5>STEP 1</h5>
                                </div>
                                <div class="column">
                                    Choose a category of the product you wish to have quoted.
                                </div>
                            </div>

                            <div class="column-container steps">
                                <div class="column">
                                    <h5>STEP 2</h5>
                                </div>
                                <div class="column">
                                    Configure your part number following <b>QuickPrice</b>'s easy to use step by step assistance.
                                </div>
                            </div>

                            <div class="column-container steps">
                                <div class="column">
                                    <h5>STEP 3</h5>
                                </div>
                                <div class="column">
                                    Click "Get Price" to show you the list price, quantity discounts, and expedited pricing.
                                </div>
                            </div>
                            <br />
                            <p>
                                As always, feel free to contact an inside sales representative for friendly assistance.
                            </p>
                        </div>
                        <div class="column graphic">
                            <br />
                            <br />
                            <br />
                            <img src="../images/icons/123.png" alt="" />
                        </div>
                    </div>

                    <div class="column-container">
                        <div class="column text">
                            <h1>Where Do I Sign Up?</h1>
                            <br />
                            <br />
                            <p>
                                <b>QuickPrice</b> is an application designed for SensorTec customers and distributors to
                easily acquire pricing and delivery options. If you are interested in an account,
                talk to your sales representative to see if <b>QuickPrice</b> will work for you.
                            </p>

                        </div>
                        <asp:LinkButton ID="GetStarted_LinkButton" runat="server" CssClass="big-button" Text="Get Started" />
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="paper-shadow">
                </div>
    </div>
</asp:Content>
