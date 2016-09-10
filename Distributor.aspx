<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Distributor.aspx.vb" Inherits="Distributor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/distributor.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="Dist_UpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="container">
                <div class="paper">
                    <div class="paper-container">
                        <div class="distributor-container">

                            <div class="dist-info">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                        <div class="update_progress_background"></div>
                                        <div class="update_progress_container">
                                            Populating Distributors...
                                            <img src="images/loading.gif" />
                                        </div>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:Panel runat="server" ID="DistributionInst_Panel">

                                    <div class="dist-select">
                                        <h2><span>Please select your state from the map</span></h2>
                                    </div>

                                    <br />
                                    <br />
                                    <hr />
                                    <br />
                                    <div class="dist-become">
                                        Interested in becoming a
                                    <h5>SensorTec, Inc.</h5>
                                        distributor?
                                    <br />
                                        <br />
                                        Email <a href="mailto:sales@sensortecinc.com">sales@sensortecinc.com</a>
                                    </div>
                                </asp:Panel>
                                <br />
                                <br />
                                <asp:DropDownList ID="States_DropDownList" runat="server" AutoPostBack="True" DataSourceID="States_DataSource" DataTextField="StateName" DataValueField="StateID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="-1" Text="[choose state]"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="States_DataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext" EntityTypeName="" OrderBy="StateName" TableName="States">
                                </asp:LinqDataSource>
                                <br />
                                <br />
                                <asp:Repeater ID="Distributor_Repeater" runat="server">
                                    <HeaderTemplate>
                                        <h2>
                                            <asp:Label runat="server" ID="State_Label" /></h2>
                                        <hr />
                                        <br />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <p>
                                            <b>
                                                <%# Eval("DistName")%></b>
                                            <br />
                                            <%# Eval("DistAddress")%>
                                            <br />
                                            <asp:Panel runat="server" ID="Address2_Panel">
                                                <asp:Label runat="server" ID="Address2_Label" Text='<%# DataBinder.Eval(Container.DataItem,"DistAddress2") %>' />
                                                <br />
                                            </asp:Panel>
                                            <%# Eval("DistCity")%>,
                                            <%# Eval("State.StateName")%>
                                            <%# Eval("DistZIP")%>
                                        </p>
                                        <div class="contacts">
                                            <div class="primary-contact">
                                                <h5>Primary Contact:</h5>
                                                <br />
                                                <%# Eval("DistContact")%>
                                                <br />
                                                    Tel: <a href="tel:<%# Eval("DistPhone")%>"><%# Eval("DistPhone")%></a>
                                                <br />
                                                Fax:
                                                <%# Eval("DistFax")%>
                                                <br />
                                                Email: <a href="mailto:<%# Eval("DistEmail")%>">
                                                    <%# Eval("DistEmail")%></a>
                                            </div>
                                            <asp:Panel runat="server" ID="Contact2_Panel">
                                                <div class="secondary-contact">
                                                    <h5>Secondary Contact:</h5>
                                                    <br />
                                                    <asp:Label runat="server" ID="Contact2_Label" Text='<%# DataBinder.Eval(Container.DataItem,"DistContact2") %>' />
                                                    <br />
                                                    Tel:
                                                    <%# Eval("DistPhone2")%>
                                                    <br />
                                                    Fax:
                                                    <%# Eval("DistFax2")%>
                                                    <br />
                                                    Email: <a href="mailto:<%# Eval("DistEmail2")%>">
                                                        <%# Eval("DistEmail2")%></a>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <br />
                                        <hr style="background-color: #dedede;" />
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <div class="dist-map">
                                <asp:ImageMap ID="Distributor_ImageMap" runat="server" ImageUrl="~/images/dist_map.gif"
                                    OnClick="Distributor_ImageMap_Click" HotSpotMode="PostBack">
                                    <asp:PolygonHotSpot PostBackValue="Alabama" Coordinates="308,152,
                                     324,150,
                                     338,189,
                                     315,193,
                                     321,198,
                                     312,199" />
                                    <asp:PolygonHotSpot PostBackValue="Alaska" Coordinates="11,305,
                                     40,212,
                                     67,200,
                                     100,216,
                                     103,276,
                                     121,278,
                                     141,300,
                                     142,309,
                                     129,311,
                                     103,280,
                                     59,284,
                                     43,298" />
                                    <asp:PolygonHotSpot PostBackValue="Arizona" Coordinates="105,137,
                                    144,140,
                                    139,196,
                                    122,196,
                                    92,182,
                                    97,146,
                                    103,146" />
                                    <asp:PolygonHotSpot PostBackValue="Arkansas" Coordinates="258,146,
                                     289,143,
                                     292,148,
                                     294,147,
                                     286,177,
                                     264,179,
                                     263,174,
                                     260,174" />
                                    <asp:PolygonHotSpot PostBackValue="California" Coordinates="37,70,
                                     69,77,
                                     62,108,
                                     97,155,
                                     95,181,
                                     70,181,
                                     69,169,
                                     46,154,
                                     32,86" />
                                    <asp:PolygonHotSpot PostBackValue="Colorado" Coordinates="147,101,
                                     198,104,
                                     199,143,
                                     144,139" />
                                    <asp:PolygonHotSpot PostBackValue="Connecticut" Coordinates="415,129,
                                     427,129,
                                     427,137,
                                     415,137" />
                                    <asp:PolygonHotSpot PostBackValue="Delaware" Coordinates="415,164,
                                     427,165,
                                     427,172,
                                     415,172" />
                                    <asp:PolygonHotSpot PostBackValue="Florida" Coordinates="317,192,
                                     367,188,
                                     387,219,
                                     387,234,
                                     382,237,
                                     360,212,
                                     360,205,
                                     354,200" />
                                    <asp:PolygonHotSpot PostBackValue="Georgia" Coordinates="326,151,
                                     345,146,
                                     368,170,
                                     366,187,
                                     339,191,
                                     334,173" />
                                    <asp:PolygonHotSpot PostBackValue="Hawaii" Coordinates="210,275,
                                     199,281,
                                     189,260,
                                     171,252,
                                     152,241,
                                     144,241,
                                     144,237,
                                     158,235,
                                     187,252,
                                     195,257" />
                                    <asp:PolygonHotSpot PostBackValue="Idaho" Coordinates="106,13,
                                     111,16,
                                     109,28,
                                     117,41,
                                     115,53,
                                     118,52,
                                     123,64,
                                     136,64,
                                     137,68,
                                     134,89,
                                     93,81,
                                     95,61,
                                     103,47,
                                     100,41" />
                                    <asp:PolygonHotSpot PostBackValue="Illinois" Coordinates="279,85,
                                     298,81,
                                     304,90,
                                     309,117,
                                     298,133,
                                     274,109,
                                     275,95,
                                     281,90" />
                                    <asp:PolygonHotSpot PostBackValue="Indiana" Coordinates="305,90,
                                     307,90,
                                     308,86,
                                     323,84,
                                     327,113,
                                     324,115,
                                     319,123,
                                     307,125,
                                     310,117,
                                     306,113" />
                                    <asp:PolygonHotSpot PostBackValue="Iowa" Coordinates="239,79,
                                     273,78,
                                     280,87,
                                     281,92,
                                     276,94,
                                     275,105,
                                     246,107" />
                                    <asp:PolygonHotSpot PostBackValue="Kansas" Coordinates="199,112,
                                     248,112,
                                     252,119,
                                     255,143,
                                     200,144" />
                                    <asp:PolygonHotSpot PostBackValue="Kentucky" Coordinates="297,134,
                                     302,133,
                                     306,125,
                                     319,122,
                                     323,115,
                                     328,112,
                                     328,110,
                                     333,115,
                                     342,114,
                                     348,124,
                                     352,124,
                                     347,130,
                                     298,138" />
                                    <asp:PolygonHotSpot PostBackValue="Louisiana" Coordinates="264,181,
                                     286,177,
                                     289,183,
                                     285,196,
                                     300,195,
                                     308,215,
                                     268,209,
                                     269,193,
                                     264,187" />
                                    <asp:PolygonHotSpot PostBackValue="Maine" Coordinates="409,0,
                                     418,0,
                                     428,13,
                                     434,19,
                                     417,42,
                                     405,24,
                                     407,16" />
                                    <asp:PolygonHotSpot PostBackValue="Maryland" Coordinates="415,154,
                                     427,154,
                                     427,160,
                                     415,160" />
                                    <asp:PolygonHotSpot PostBackValue="Massachusetts" Coordinates="415,105,
                                     427,105,
                                     427,112,
                                     415,112" />
                                    <asp:PolygonHotSpot PostBackValue="Michigan" Coordinates="262,45,
                                     284,28,
                                     314,38,
                                     318,47,
                                     327,47,
                                     338,68,
                                     334,84,
                                     308,86,
                                     305,91,
                                     303,90,
                                     299,78,
                                     296,64,
                                     294,53,
                                     272,46" />
                                    <asp:PolygonHotSpot PostBackValue="Minnesota" Coordinates="231,26,
                                     243,22,
                                     275,33,
                                     261,45,
                                     260,52,
                                     259,63,
                                     272,72,
                                     273,77,
                                     239,79" />
                                    <asp:PolygonHotSpot PostBackValue="Mississippi" Coordinates="293,153,
                                     306,152,
                                     309,154,
                                     312,198,
                                     304,201,
                                     301,195,
                                     284,197,
                                     289,183,
                                     286,177" />
                                    <asp:PolygonHotSpot PostBackValue="Missouri" Coordinates="247,108,
                                     274,105,
                                     274,113,
                                     296,135,
                                     294,147,
                                     290,147,
                                     290,142,
                                     257,145,
                                     254,118" />
                                    <asp:PolygonHotSpot PostBackValue="Montana" Coordinates="110,15,
                                     187,25,
                                     185,60,
                                     139,56,
                                     137,67,
                                     124,65,
                                     109,28" />
                                    <asp:PolygonHotSpot PostBackValue="Nebraska" Coordinates="185,85,
                                     223,85,
                                     226,88,
                                     239,91,
                                     248,111,
                                     200,112,
                                     198,103,
                                     186,103" />
                                    <asp:PolygonHotSpot PostBackValue="Nevada" Coordinates="69,76,
                                     111,86,
                                     103,146,
                                     96,146,
                                     96,155,
                                     61,106" />
                                    <asp:PolygonHotSpot PostBackValue="New Hampshire" Coordinates="415,93,
                                     427,93,
                                     427,100,
                                     415,100" />
                                    <asp:PolygonHotSpot PostBackValue="New Jersey" Coordinates="415,141,
                                     427,141,
                                     427,148,
                                     415,148" />
                                    <asp:PolygonHotSpot PostBackValue="New Mexico" Coordinates="144,140,
                                     190,144,
                                     190,192,
                                     162,191,
                                     162,195,
                                     147,193,
                                     147,198,
                                     140,198" />
                                    <asp:PolygonHotSpot PostBackValue="New York" Coordinates="357,67,
                                     390,32,
                                     397,52,
                                     399,73,
                                     390,71,
                                     388,66,
                                     359,73" />
                                    <asp:PolygonHotSpot PostBackValue="North Carolina" Coordinates="340,146,
                                     350,138,
                                     356,129,
                                     397,120,
                                     402,136,
                                     386,148,
                                     380,149,
                                     372,142,
                                     366,145,
                                     364,141,
                                     350,142,
                                     346,147" />
                                    <asp:PolygonHotSpot PostBackValue="North Dakota" Coordinates="187,25,
                                     230,26,
                                     235,53,
                                     187,53" />
                                    <asp:PolygonHotSpot PostBackValue="Ohio" Coordinates="323,85,
                                     337,85,
                                     351,74,
                                     355,88,
                                     352,88,
                                     352,97,
                                     342,114,
                                     328,111" />
                                    <asp:PolygonHotSpot PostBackValue="Oklahoma" Coordinates="191,144,
                                     256,144,
                                     259,174,
                                     244,170,
                                     239,174,
                                     212,166,
                                     211,148,
                                     191,148" />
                                    <asp:PolygonHotSpot PostBackValue="Oregon" Coordinates="53,30,
                                     58,33,
                                     58,39,
                                     98,43,
                                     103,48,
                                     95,61,
                                     93,80,
                                     38,68" />
                                    <asp:PolygonHotSpot PostBackValue="Pennsylvania" Coordinates="351,74,
                                     357,68,
                                     359,74,
                                     387,67,
                                     391,74,
                                     394,88,
                                     358,97" />
                                    <asp:PolygonHotSpot PostBackValue="Rhode Island" Coordinates="415,116,
                                     427,116,
                                     427,123,
                                     415,123" />
                                    <asp:PolygonHotSpot PostBackValue="South Carolina" Coordinates="351,141,
                                     364,142,
                                     365,145,
                                     373,142,
                                     382,150,
                                     370,171,
                                     345,147" />
                                    <asp:PolygonHotSpot PostBackValue="South Dakota" Coordinates="188,55,
                                     236,55,
                                     239,89,
                                     225,87,
                                     224,84,
                                     186,83" />
                                    <asp:PolygonHotSpot PostBackValue="Tennessee" Coordinates="299,140,
                                     355,130,
                                     337,147,
                                     294,152" />
                                    <asp:PolygonHotSpot PostBackValue="Texas" Coordinates="163,193,
                                     191,192,
                                     191,148,
                                     211,148,
                                     211,165,
                                     238,176,
                                     244,171,
                                     263,176,
                                     269,208,
                                     242,254,
                                     196,216,
                                     187,226" />
                                    <asp:PolygonHotSpot PostBackValue="Utah" Coordinates="113,86,
                                     133,90,
                                     132,100,
                                     147,101,
                                     142,140,
                                     105,135" />
                                    <asp:PolygonHotSpot PostBackValue="Vermont" Coordinates="415,81,
                                     427,81,
                                     427,88,
                                     415,88" />
                                    <asp:PolygonHotSpot PostBackValue="Virginia" Coordinates="347,130,
                                     352,124,
                                     356,126,
                                     373,98,
                                     377,99,
                                     385,107,
                                     388,106,
                                     396,120" />
                                    <asp:PolygonHotSpot PostBackValue="Washington" Coordinates="54,12,
                                     69,4,
                                     105,14,
                                     99,42,
                                     59,40,
                                     51,13" />
                                    <asp:PolygonHotSpot PostBackValue="West Virginia" Coordinates="343,114,
                                     352,99,
                                     353,90,
                                     354,89,
                                     357,98,
                                     375,96,
                                     356,126" />
                                    <asp:PolygonHotSpot PostBackValue="Wisconsin" Coordinates="263,46,
                                     271,44,
                                     299,57,
                                     298,79,
                                     278,84,
                                     274,77,
                                     273,72,
                                     260,63,
                                     260,53,
                                     263,52" />
                                    <asp:PolygonHotSpot PostBackValue="Wyoming" Coordinates="139,57,
                                     185,61,
                                     185,103,
                                     134,99" />
                                    <asp:PolygonHotSpot PostBackValue="Washington D.C." Coordinates="415,177,
                                     427,177,
                                     427,184,
                                     415,184" />
                                    <asp:PolygonHotSpot PostBackValue="Puerto Rico" Coordinates="260,272,
                                     289,271,
                                     285,282,
                                     260,280" />
                                    <asp:PolygonHotSpot PostBackValue="Virgin Islands" Coordinates="322,270,
                                     346,270,
                                     346,287,
                                     322,287" />
                                </asp:ImageMap>
                                <br />
                                <br />

                            </div>

                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                <div class="paper-shadow">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
