<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="QPConfigure.aspx.vb" Inherits="QuickPrice_QPCatagory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="qp-step-map-container">
        <ul class="tabs">
            <li>
                <asp:LinkButton runat="server" ID="Step1_LinkButton" CssClass="step1_tab">
                    <h1>STEP 1:</h1>
                    <h5>Choose Catagory</h5>
                </asp:LinkButton>
            </li>
            <div class="vDivider-light"></div>
            <li>
                <asp:LinkButton runat="server" ID="Step2_LinkButton" CssClass="step2_tab inactive" Enabled="false">
                   
                    <h1>STEP 2:</h1>
                    <h5>Configure Part Number</h5>
                      <%--  <a href="#" class="step2_tab" runat="server" id="Step2_LinkButton"> </a>--%>
                </asp:LinkButton>
            </li>
            <div class="vDivider-light"></div>
            <li>
                <asp:LinkButton runat="server" ID="Step3_LinkButton" CssClass="step3_tab inactive" Enabled="false">
                    <h1>STEP 3:</h1>
                    <h5>View Pricing</h5>
                </asp:LinkButton>
            </li>
        </ul>
    </div>
    <div class="clear"></div>


    <!--STEP 1-->
    <div class="step_1" runat="server" id="Step1_Panel">
        <div class="load-active-button">
            <img src="../images/buttons/rtd_button_active.png" />
            <img src="../images/buttons/rtd_well_button_active.png" />
            <img src="../images/buttons/mgo_button_active.png" />
            <img src="../images/buttons/mgo_well_button_active.png" />
            <img src="../images/buttons/plastics_button_active.png" />
            <img src="../images/buttons/plastics_rtd_button_active.png" />
            <img src="../images/buttons/cip_button_active.png" />
            <img src="../images/buttons/sip_button_active.png" />
            <img src="../images/buttons/qc_button_active.png" />
            <img src="../images/buttons/extension_button_active.png" />
            <img src="../images/buttons/wire_button_active.png" />
            <img src="../images/buttons/accessories_button_active.png" />
        </div>

        <div class="qp-button-container">
            <a href="#" class="qp_button rtd_button"></a>
            <a href="#" class="qp_button rtd_well_button" rel="#rtd_well"></a>
            <a href="#" class="qp_button mgo_button"></a>
            <a href="#" class="qp_button mgo_well_button" rel="#mgo_well"></a>
            <a href="#" class="qp_button plastics_button"></a>
            <a href="#" class="qp_button plastics_rtd_button"></a>
            <a href="#" class="qp_button cip_button"></a>
            <a href="#" class="qp_button sip_button"></a>
            <a href="#" class="qp_button qc_button"></a>
            <a href="#" class="qp_button extension_button"></a>
            <a href="PriceSheet.aspx?type=Wire" class="qp_button wire_button"></a>
            <a href="PriceSheet.aspx?type=Accessory" class="qp_button accessories_button"></a>
        </div>
        <div class="clear"></div>
    </div>
    <div class="modal-popup" id="rtd_well">
        <div class="modal-container">
            Select the type of RTD thermowell assembly you would like:
		    <br />
            <br />
            <hr />
            <br />
            <a href="#" class="rtd_well_assembly">Complete Thermowell Assembly</a>
            <h5>
                <li>Thermowell assembly, element and thermowell</li>
            </h5>
            <br />
            <a href="#" class="rtd_well_replacement">Thermowell Replacement Assembly</a>
            <h5>
                <li>Thermowell assembly and element (no thermowell)</li>
            </h5>

        </div>
    </div>
    <div class="modal-popup" id="mgo_well">
        <div class="modal-container">
            Select the type of MgO thermowell assembly you would like:
		    <br />
            <br />
            <hr />
            <br />
            <a href="#" class="mgo_well_assembly">Complete Thermowell Assembly</a>
            <h5>
                <li>Thermowell assembly, element and thermowell</li>
            </h5>
            <br />
            <a href="#" class="mgo_well_replacement">Thermowell Replacement Assembly</a>
            <h5>
                <li>Thermowell assembly and element (no thermowell)</li>
            </h5>
        </div>
    </div>


    <!--STEP 2-->
    <div class="step_2" runat="server" id="Step2_Panel">
        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
            <ProgressTemplate>
                <div class="update_progress_background"></div>
                <div class="update_progress_container">
                    Calculating Pricing...
                            <img src="../images/loading.gif" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <!--PENETRATION (SIP) PROBE STYLE -->
        <div class="penetration_panel code single_select">
            <div class="code_name">Penetration Style Build</div>
            <asp:TextBox ID="Penetration_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Penetration Style
                    <span class="arrow"></span>
                </h4>
                <div class="penetration_Styles radio_group show_default "></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--TEMPERATURE SENSOR BUILD-->
        <div class="sensor_build_panel code">
            <div class="code_name">Temperature Sensor Build</div>
            <asp:TextBox ID="SensorBuild_TextBox" runat="server" CssClass="value_textbox" Enabled="false"></asp:TextBox>
            <div class="desc_label"></div>

        </div>

        <!--SHEATH TERMINATION -->
        <div class="sheath_termination_panel code single_select">
            <div class="code_name">Sheath Termination</div>
            <asp:TextBox ID="SheathTerm_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>

            <div class="radio_list down">
                <h4>Bulk Material
                    <div class="arrow"></div>
                </h4>
                <div class="sheathTerm_Bulk radio_group"></div>
                <h4>Leadwire Style
                    <div class="arrow"></div>
                </h4>
                <div class="sheathTerm_Leadwire radio_group"></div>
                <h4>Plug Style
                    <div class="arrow"></div>
                </h4>
                <div class="sheathTerm_Plug radio_group"></div>
                <h4>Head Style 
                    <div class="arrow"></div>
                </h4>
                <div class="sheathTerm_Heads radio_group"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerOne code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerOne_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--PLASTICS SHEATH TERMINATION -->
        <div class="plastics_termination_panel code single_select">
            <div class="code_name">Plastics Termination Construction</div>
            <asp:TextBox ID="PlasticsTerm_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Plastics Termination
                    <div class="arrow"></div>
                </h4>
                <div class="plastics_Termination radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>


        <!--ELEMENT TYPE -->
        <div class="element_type_panel code">
            <div class="code_name">Element Type</div>
            <asp:TextBox ID="ElementType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Element Configuration</h4>
                <div class="element_Config radio_group show_default"></div>
                <h4>Single or Dual Element</h4>
                <div class="element_SingleDual radio_group show_default"></div>
                <h4>Base Resistance</h4>
                <div class="element_Resistance radio_group show_default"></div>
                <div class="submit_element_type">
                    <div class="align-right"><a href="#" class="button">Write</a></div>
                </div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--ACCURACY & TEMPERATURE COEFFICIENT-->
        <div class="element_coefficient_panel code">
            <div class="code_name">Accuracy & Temperature Coefficent</div>
            <asp:TextBox ID="ElementCoefficient_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>RTD Curve</h4>
                <div class="element_Curve radio_group show_default"></div>
                <h4>RTD Accuracy</h4>
                <div class="element_Accuracy radio_group show_default"></div>
                <div class="submit_element_coefficient">
                    <div class="align-right"><a href="#" class="button">Write</a></div>
                </div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--TEMPERATURE-->
        <div class="temperature_panel code single_select">
            <div class="code_name">Temperature</div>
            <asp:TextBox ID="Temperature_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Temperature
                    <div class="arrow"></div>
                </h4>
                <div class="temperature radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--CALIBRATION-->
        <div class="calibration_panel code single_select">
            <div class="code_name">Calibration</div>
            <asp:TextBox ID="Calibration_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Calibration</h4>
                <div class="calibration radio_group show_default "></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOCOUPLE TYPE-->
        <div class="thermocouple_type_panel code single_select">
            <div class="code_name">Thermocouple Type</div>
            <asp:TextBox ID="ThermocoupleType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermocouple Type Construction<div class="arrow"></div>
                </h4>
                <div class="thermocouple_Type radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--JUNCTION TYPE-->
        <div class="junction_type_panel code single_select">
            <div class="code_name">Junction Type</div>
            <asp:TextBox ID="JunctionType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Junction Type<div class="arrow"></div>
                </h4>
                <div class="junction_Type radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--EXTENSION TYPE-->
        <div class="extension_type_panel code single_select">
            <div class="code_name">Extension Type</div>
            <asp:TextBox ID="ExtensionType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>RTD Extension<div class="arrow"></div>
                </h4>
                <div class="extension_RTD_Type radio_group show_default"></div>
                <h4>Thermocouple Extension<div class="arrow"></div>
                </h4>
                <div class="extension_TC_Type radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--EXTENSION CONFIGURATION-->
        <div class="extension_config_rtd_panel code single_select">
            <div class="code_name">Configuration</div>
            <asp:TextBox ID="ExtensionConfigRTD_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Wire Configuration<div class="arrow"></div>
                </h4>
                <div class="extension_Config_RTD radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>
        <div class="extension_config_tc_panel code single_select">
            <div class="code_name">Configuration</div>
            <asp:TextBox ID="ExtensionConfigTC_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Wire Configuration<div class="arrow"></div>
                </h4>
                <div class="extension_Config_TC radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--EXTENSION PLACE HOLDER "EXT"-->
        <div class="extension_placeholder_panel code" runat="server">
            <div class="code_name">Extension</div>
            <asp:TextBox ID="ExtensionPlaceHolder_TextBox" runat="server" CssClass="value_textbox" Text="EXT" Enabled="false"></asp:TextBox>
        </div>

        <!--SPACER-->
        <div class="spacerTwo code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerTwo_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--EXTENSION LEADWIRE TERMINATION-->
        <div class="extension_termination_panel code single_select">
            <div class="code_name">Leadwire Termination ("A")</div>
            <asp:TextBox ID="ExtensionTerm_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Leadwire Termination<div class="arrow"></div>
                </h4>
                <div class="extension_Termination radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>
        <div class="extension_qc_termination_panel code single_select">
            <div class="code_name">Leadwire Termination ("A")</div>
            <asp:TextBox ID="ExtensionQCTerm_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Leadwire Termination<div class="arrow"></div>
                </h4>
                <div class="extension_QC_Termination radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--PENETRATION PROBE STYLE-->
        <div class="penetration_probe_style_panel code single_select">
            <div class="code_name">Probe Style</div>
            <asp:TextBox ID="PenetrationProbeStyle_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Probe Styles<div class="arrow"></div>
                </h4>
                <div class="penetration_Probe_Style radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--PENETRATION SHEATH DIAMETER-->
        <div class="penetration_sheath_diameter_panel code single_select">
            <div class="code_name">Sheath Diameter</div>
            <asp:TextBox ID="PenetrationSheathDia_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Sheath Diameter<div class="arrow"></div>
                </h4>
                <div class="penetration_Diameter radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL ASSEMBLY TYPE -->
        <div class="tw_assembly_type_panel code">
            <div class="code_name">Thermowell Assembly Type</div>
            <asp:TextBox ID="TWAssemblyType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermowell Configuration Type</h4>
                <div class="thermowell_Config radio_group show_default"></div>
                <h4>Thermowell Configuration Length</h4>
                <div class="thermowell_Extension radio_group show_default"></div>
                <div class="submit_tw_assembly_type">
                    <div class="align-right"><a href="#" class="button">Write</a></div>
                </div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL ASSEMBLY MATERIAL-->
        <div class="tw_assembly_material_panel code single_select">
            <div class="code_name">Thermowell Assembly Material</div>
            <asp:TextBox ID="TWAssemblyMat_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermowell Assembly Material<div class="arrow"></div>
                </h4>
                <div class="tw_Assembly_Material radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerThree code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerThree_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--SHEATH DIAMETER-->
        <div class="sheath_diameter_panel code single_select">
            <div class="code_name">Sheath Diameter</div>
            <asp:TextBox ID="SheathDia_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Sheath Diameter<div class="arrow"></div>
                </h4>
                <div class="sheath_Diameter radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--DAIRY REDUCED TIP SHEATH DIAMETER-->
        <div class="reduced_tip_diameter_panel code single_select">
            <div class="code_name">
                Reduced Tip Sheath Diameter
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="ReducedTipDia_TextBox" runat="server" CssClass="value_textbox optional_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Reduced Tip Sheath Diameter<div class="arrow"></div>
                </h4>
                <div class="reduced_Sheath_Diameter radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>
        <!--SHEATH MATERIAL-->
        <div class="sheath_material_panel code single_select">
            <div class="code_name">Sheath Material</div>
            <asp:TextBox ID="SheathMat_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Sheath Material<div class="arrow"></div>
                </h4>
                <div class="sheath_Material radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerFour code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerFour_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--THERMOWELL TYPE-->
        <div class="tw_type_panel code single_select">
            <div class="code_name">Thermowell Type</div>
            <asp:TextBox ID="TWType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermowell Type<div class="arrow"></div>
                </h4>
                <div class="thermowell_Type radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL LAG-->
        <div class="tw_lag_panel code single_select">
            <div class="code_name">Thermowell Lag</div>
            <asp:TextBox ID="TWLag_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermowell Lag<div class="arrow"></div>
                </h4>
                <div class="thermowell_Lag radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL BORE-->
        <div class="tw_bore_panel code single_select">
            <div class="code_name">Thermowell Internal Bore</div>
            <asp:TextBox ID="TWBore_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermowell Bore<div class="arrow"></div>
                </h4>
                <div class="thermowell_Bore radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerFive code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerFiveTextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--THERMOWELL PROCESS THREAD-->
        <div class="tw_thread_panel code single_select">
            <div class="code_name">Thermowell Process Thread</div>
            <asp:TextBox ID="TWThread_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Thermowell Process Thread<div class="arrow"></div>
                </h4>
                <div class="thermowell_Thread radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SHEATH LENGTH-->
        <div class="sheath_length_panel code">
            <div class="code_name">Sheath Length</div>
            <asp:TextBox ID="SheathLength_TextBox" runat="server" CssClass="value_textbox" MaxLength="2"></asp:TextBox>
            <div class="radio_list down">
                Enter sheath length in inches
            </div>
            <div class="desc_label"></div>
        </div>

        <!--FRACTIONAL SHEATH LENGTH-->
        <div class="fractional_length_panel code single_select">
            <div class="code_name">Fractional Sheath Length</div>
            <asp:TextBox ID="FracLength_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Fractional Sheath Length<div class="arrow"></div>
                </h4>
                <div class="sheath_Fractional_Length radio_group show_default"></div>
            </div>
        </div>

        <!--PLASTICS SPADE MATERIAL-->
        <div class="spade_material_panel code single_select">
            <div class="code_name">Spade Material</div>
            <asp:TextBox ID="SpaderMat_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Spade Material<div class="arrow"></div>
                </h4>
                <div class="spade_Material radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>
        <!--PLASTICS RING TYPE-->
        <div class="ring_type_panel code single_select">
            <div class="code_name">Ring Type</div>
            <asp:TextBox ID="RingType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Ring Type<div class="arrow"></div>
                </h4>
                <div class="ring_Type radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--PLASTICS BOLT/STUD SIZE-->
        <div class="stud_size_panel code single_select">
            <div class="code_name">Bolt/Stud Size</div>
            <asp:TextBox ID="StudSize_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Bolt/Stud Size<div class="arrow"></div>
                </h4>
                <div class="stud_Size radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--PLASTICS SPARK PLUG GASKET SIZE-->
        <div class="gasket_size_panel code single_select">
            <div class="code_name">Spark Plug Gasket Size</div>
            <asp:TextBox ID="GasketSize_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Spark Plg Gasket Size<div class="arrow"></div>
                </h4>
                <div class="gasket_Size radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--PLASTICS SPARK PLUG GASKET FORK STYLE-->
        <div class="fork_style_panel code single_select">
            <div class="code_name">Spark Plug Gasket Fork Style</div>
            <asp:TextBox ID="GasketStyle_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Spark Plug Gasket Fork Style<div class="arrow"></div>
                </h4>
                <div class="fork_Style radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--PLASTICS PIPE CLAMP-->
        <div class="pipe_clamp_panel code single_select">
            <div class="code_name">Pipe Clamp</div>
            <asp:TextBox ID="PipeClamp_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>Pipe Clamps<div class="arrow"></div>
                </h4>
                <div class="pipe_Clamp radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>


        <!--PLACEHOLDER-->
        <div class="placeholder1 code placeholder">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="Placeholder1_TextBox" runat="server" CssClass="value_textbox" Text="X" Enabled="false"></asp:TextBox>
        </div>

        <div class="placeholder2 code placeholder">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="Placeholder2_TextBox" runat="server" CssClass="value_textbox" Text="X" Enabled="false"></asp:TextBox>
        </div>

        <div class="placeholder3 code placeholder">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="Placeholder3_TextBox" runat="server" CssClass="value_textbox" Text="X" Enabled="false"></asp:TextBox>
        </div>

        <!--SPACER-->
        <div class="spacerSix code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerSix_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--THERMOWELL STANDARD INSERTION LENGTH-->
        <div class="tw_standard_insertion_panel code single_select">
            <div class="code_name">Thermowell Insertion Length</div>
            <asp:TextBox ID="TWStandardInsertion_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Thermowell Insertion Length<div class="arrow"></div>
                </h4>
                <div class="tw_Standard_Insertion radio_group show_default"></div>
                <div class="note">*Call for quote on thermowell insertion lengths not listed.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL FLANGED INSERTION LENGTH-->
        <div class="tw_flanged_insertion_panel code single_select">
            <div class="code_name">Thermowell Insertion Length</div>
            <asp:TextBox ID="TWFlangedInsertion_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Thermowell Insertion Length<div class="arrow"></div>
                </h4>
                <div class="tw_Flanged_Insertion radio_group show_default"></div>
                <div class="note">*Call for quote on thermowell insertion lengths not listed.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerSeven code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerSeven_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--THERMOWELL FLANGE SIZE-->
        <div class="tw_flange_size_panel code single_select">
            <div class="code_name">Thermowell Flange Size</div>
            <asp:TextBox ID="TWFlangeSize_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Thermowell Flange Sizes<div class="arrow"></div>
                </h4>
                <div class="thermowell_Flange_Size radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL RATING-->
        <div class="tw_rating_panel code single_select">
            <div class="code_name">Thermowell Rating</div>
            <asp:TextBox ID="TWRating_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Thermowell Ratings<div class="arrow"></div>
                </h4>
                <div class="thermowell_Rating radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--THERMOWELL FLANGE TYPE-->
        <div class="tw_flange_type_panel code single_select">
            <div class="code_name">Thermowell Flange Type</div>
            <asp:TextBox ID="TWFlangeType_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Thermowell Flange Types<div class="arrow"></div>
                </h4>
                <div class="thermowell_Flange_Type radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerEight code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerEight_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--THERMOWELL MATERIAL-->
        <div class="tw_material_panel code single_select">
            <div class="code_name">Thermowell Material</div>
            <asp:TextBox ID="TWMat_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Thermowell Material<div class="arrow"></div>
                </h4>
                <div class="tw_Material radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>


        <!--BULK STRIP LENGTH-->
        <div class="bulk_strip_length_panel code single_select">
            <div class="code_name">Strip Length</div>
            <asp:TextBox ID="BulkStripLength_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Strip Lengths<div class="arrow"></div>
                </h4>
                <div class="bulk_Strip_Length radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>








        <!--SHEATH FITTING-->
        <div class="sheath_fitting_panel code single_select">
            <div class="code_name">
                Sheath Mounting Fitting &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="AddFitting_HyperLink" runat="server">
                <h5>(+) additional fitting</h5></asp:HyperLink>
            </div>
            <asp:TextBox ID="SheathFitting_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>No Fitting
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Fitting_None radio_group show_default"></div>
                <h4>Fixed Hex Nipples
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Fixed_Hex_Nipples radio_group"></div>
                <h4>Spring Loaded Hex Nipples
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Spring_Loaded_Hex_Nipples radio_group"></div>
                <h4>304 SST Hex Bushings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_304_Hex_Bushings radio_group"></div>
                <h4>316 SST Hex Bushings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_316_Hex_Bushings radio_group"></div>
                <h4>Adjustable Compression Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Adj_Comp_Fittings radio_group"></div>
                <h4>Re-Adjustable Compression Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_ReAdj_Comp_Fittings radio_group"></div>
                <h4>Flange & Bayonet Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Flange_Bayonet radio_group"></div>
                <h4>Sheath Bend Options
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Bend radio_group"></div>
                <h4>Flat Weld Pads
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Flat_Pads radio_group"></div>
                <h4>Radius Weld Pads
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Radius_Pads radio_group"></div>
            </div>
            <div class="desc_label"></div>
        </div>
        <!--SPACER-->
        <div class="spacerFitting code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="spacerFitting_TextBox" runat="server" CssClass="value_textbox" Text="/" Enabled="false"></asp:TextBox>
        </div>

        <!--SHEATH FITTING 2-->
        <div class="sheath_fitting2_panel code single_select">
            <div class="code_name">Additional Fitting</div>
            <asp:TextBox ID="SheathFitting2_TextBox" runat="server" CssClass="value_textbox "></asp:TextBox>
            <div class="radio_list up">
                <h4>Fixed Hex Nipples
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Fixed_Hex_Nipples radio_group"></div>
                <h4>Spring Loaded Hex Nipples
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Spring_Loaded_Hex_Nipples radio_group"></div>
                <h4>304 SST Hex Bushings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_304_Hex_Bushings radio_group"></div>
                <h4>316 SST Hex Bushings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_316_Hex_Bushings radio_group"></div>
                <h4>Adjustable Compression Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Adj_Comp_Fittings radio_group"></div>
                <h4>Re-Adjustable Compression Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_ReAdj_Comp_Fittings radio_group"></div>
                <h4>Flange & Bayonet Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Flange_Bayonet radio_group"></div>
                <h4>Sheath Bend Options
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Bend radio_group"></div>
                <h4>Flat Weld Pads
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Flat_Pads radio_group"></div>
                <h4>Radius Weld Pads
                    <div class="arrow"></div>
                </h4>
                <div class="sheath_Radius_Pads radio_group"></div>
            </div>
            <div class="desc_label"></div>
        </div>





        <!--DIARY(CIP) CAPS-->
        <div class="cip_cap_panel code single_select">
            <div class="code_name">CIP Cap / Thermometer Replacement</div>
            <asp:TextBox ID="CIPCap_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list down">
                <h4>CIP Caps<div class="arrow"></div>
                </h4>
                <div class="cip_Caps radio_group show_default"></div>
                <h4>Thermometer Replacement<div class="arrow"></div>
                </h4>
                <div class="thermo_Replacement radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerNine code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerNine_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--SANITARY WELL OPTION -->
        <div class="sanitary_well_panel code single_select">
            <div class="code_name">Sanitary Well
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="SanitaryWell_TextBox" runat="server" CssClass="value_textbox optional_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Sanitary Well Option<div class="arrow"></div>
                </h4>
                <div class="sanitary_Well radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--LEADWIRE-->
        <div class="leadwire_panel code single_select">
            <div class="code_name">Leadwire Type</div>
            <asp:TextBox ID="Leadwire_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Teflon Leadwire Types<div class="arrow"></div>
                </h4>
                <div class="leadwire_Teflon radio_group"></div>
                <h4>Fiberglass Leadwire Types<div class="arrow"></div>
                </h4>
                <div class="leadwire_Fiberglass radio_group"></div>
                <h4>PVC Leadwire Types<div class="arrow"></div>
                </h4>
                <div class="leadwire_PVC radio_group"></div>
                <h4>Coil Cords<div class="arrow"></div>
                </h4>
                <div class="leadwire_CoilCord radio_group"></div>
                <div class="note">*Call for a quote on unselectable wire.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--LEADWIRE LENGTH-->
        <div class="leadwire_length_panel code">
            <div class="code_name">Leadwire Length</div>
            <asp:TextBox ID="LeadwireLength_TextBox" runat="server" CssClass="value_textbox" MaxLength="3"></asp:TextBox>
            <div class="radio_list down">
                Enter wire length in inches
            </div>
            <div class="desc_label"></div>
        </div>
        <!--LEADWIRE BEYOND FLEX-->
        <div class="flex_panel code">
            <div class="code_name">
                Leadwire Beyond Flex
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="Flex_TextBox" runat="server" CssClass="value_textbox optional_textbox" MaxLength="3"></asp:TextBox>
            <div class="radio_list up">
                Enter the desired leadwire beyond the flex in inches. This is in addition to the
			specified leadwire length. Leave box blank for standard length of leadwire beyond the flex.
			<div class="note">*Standard leadwire beyond the flex is 4 inches.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--LEADWIRE TERMINATION-->
        <div class="leadwire_termination_panel code single_select">
            <div class="code_name">Leadwire Termination</div>
            <asp:TextBox ID="LeadwireTerm_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Leadwire Terminations<div class="arrow"></div>
                </h4>
                <div class="leadwire_Termination radio_group show_default"></div>
                <h4>Connection Head Terminations<div class="arrow"></div>
                </h4>
                <div class="head_Termination radio_group"></div>

            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerTen code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerTen_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--PLASTICS SHEATH FITTING-->
        <div class="plastics_sheath_fitting_panel code single_select">
            <div class="code_name">
                Sheath Mounting Fitting
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="PlasticsSheathFitting_TextBox" runat="server" CssClass="value_textbox optional_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Fixed Hex Nipples
                    <div class="arrow"></div>
                </h4>
                <div class="plastics_sheath_Fixed_Hex_Nipples radio_group"></div>
                <h4>316 SST Hex Bushings
                    <div class="arrow"></div>
                </h4>
                <div class="plastics_sheath_316_Hex_Bushings radio_group"></div>
                <h4>Adjustable Compression Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="plastics_sheath_Adj_Comp_Fittings radio_group"></div>
                <h4>Re-Adjustable Compression Fittings
                    <div class="arrow"></div>
                </h4>
                <div class="plastics_sheath_ReAdj_Comp_Fittings radio_group"></div>
                <div class="note">*Leave box blank if no fitting is required.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--NOZZLE BOLT SIZE -->
        <div class="nozzle_bolt_panel code single_select">
            <div class="code_name">Nozzle Bolt Size</div>
            <asp:TextBox ID="NozzleBolt_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Nozzle Bolt Size<div class="arrow"></div>
                </h4>
                <div class="nozzle_Bolt radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="spacerEleven code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="SpacerEleven_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--QUICK CONNECT OPTION -->
        <div class="qc_option_panel code single_select">
            <div class="code_name">Quick Connect Option</div>
            <asp:TextBox ID="QCOption_TextBox" runat="server" CssClass="value_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>QC Options<div class="arrow"></div>
                </h4>
                <div class="qc_Options radio_group show_default"></div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPECIAL OPTION 1-->
        <div class="option1_panel code single_select">
            <div class="code_name">
                Special Option 1
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="Option1_TextBox" runat="server" CssClass="value_textbox optional_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>4-20 mA Transmitters<div class="arrow"></div>
                </h4>
                <div class="option1_Transmitter radio_group"></div>
                <h4>Head Options<div class="arrow"></div>
                </h4>
                <div class="option1_Head radio_group"></div>
                <h4>Sheath Options<div class="arrow"></div>
                </h4>
                <div class="option1_Sheath radio_group"></div>
                <h4>Plug Options<div class="arrow"></div>
                </h4>
                <div class="option1_Plug radio_group"></div>
                <h4>Sheath Fitting Options<div class="arrow"></div>
                </h4>
                <div class="option1_Fitting radio_group"></div>
                <h4>Leadwire Options<div class="arrow"></div>
                </h4>
                <div class="option1_Leadwire radio_group"></div>
                <div class="note">*Leave box blank if no option is required.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--SPACER-->
        <div class="optionSpacer code spacer">
            <div class="code_name">&nbsp;</div>
            <asp:TextBox ID="OptionSpacer_TextBox" runat="server" CssClass="value_textbox" Text="-" Enabled="false"></asp:TextBox>
        </div>

        <!--SPECIAL OPTION 2-->
        <div class="option2_panel code single_select">
            <div class="code_name">
                Special Option 2
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="Option2_TextBox" runat="server" CssClass="value_textbox optional_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>4-20 mA Transmitters<div class="arrow"></div>
                </h4>
                <div class="option2_Transmitter radio_group"></div>
                <h4>Head Options<div class="arrow"></div>
                </h4>
                <div class="option2_Head radio_group"></div>
                <h4>Sheath Options<div class="arrow"></div>
                </h4>
                <div class="option2_Sheath radio_group"></div>
                <h4>Plug Options<div class="arrow"></div>
                </h4>
                <div class="option2_Plug radio_group"></div>
                <h4>Sheath Fitting Options<div class="arrow"></div>
                </h4>
                <div class="option2_Fitting radio_group"></div>
                <h4>Leadwire Options<div class="arrow"></div>
                </h4>
                <div class="option2_Leadwire radio_group"></div>
                <div class="note">*Leave box blank if no option is required.</div>
            </div>
            <div class="desc_label"></div>
        </div>

        <!--3 DIGIT CODES-->
        <div class="special_codes_panel code single_select">
            <div class="code_name">
                3 Digit Code
                <h5>(optional)</h5>
            </div>
            <asp:TextBox ID="SpecialCodes_TextBox" runat="server" CssClass="value_textbox optional_textbox"></asp:TextBox>
            <div class="radio_list up">
                <h4>Special Codes<div class="arrow"></div>
                </h4>
                <div class="special_Codes radio_group show_default"></div>
                <div class="note">*Leave box blank if no option is required.</div>
            </div>
            <div class="desc_label"></div>
        </div>
        <div class="clear"></div>

        <br />
        <br />

        <div class="complete_form error-box" style="text-align: center; display: none;">All boxes that are not "optional" must be completed before getting a price. Correct boxes outlined in red before proceeding.</div>

        <br />
        <div class="align-right">
            <asp:LinkButton ID="Clear_LinkButton" runat="server" CssClass="textbox_clear"><i>clear</i></asp:LinkButton>
            <asp:LinkButton ID="GetPrice_LinkButton" CssClass="get_price big-button" Text="Get Price" runat="server" />
        </div>
    </div>

    <input type="hidden" class="partnumber_hidden" id="PartNumber_HiddenField" runat="server" />
    <input type="hidden" class="desc_hidden" id="Desc_HiddenField" runat="server" />
    <input type="hidden" class="formiscomplete_hidden" id="FormIsComplete_HiddenField" runat="server" />
    <input type="hidden" class="valuesnapshot_hidden" id="ValueSnapShot_Hidden" runat="server" />
    <input type="hidden" class="radiobuttonsnapshot_hidden" id="RadioButtonSnapShot_Hidden" runat="server" />
    <input type="hidden" class="radiogroupsnapshot_hidden" id="RadioGroupSnapShot_Hidden" runat="server" />


    <div class="step_3" runat="server" id="Step3_Panel">
        <div class="qp-container">
            <div class="qp-quote-header">
                <div class="qp-quote-logo">
                    <asp:ImageButton ID="Logo_ImageButton" runat="server" PostBackUrl="~/QuickPriceUser/QPConfigure.aspx" ImageUrl="../images/logos/quickprice.png" />
                </div>
                <div class="qp-quote-print">
                    <img src="../images/icons/print.png" alt="print" />
                    <asp:LinkButton ID="Print_LinkButton" runat="server" OnClientClick="javascript:window.print();"
                        Text="print quote" />
                </div>
            </div>
            <div class="clear">
            </div>

            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="update_progress_background"></div>
                    <div class="update_progress_container">
                        Updating Customer...
                            <img src="../images/loading.gif" />

                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <div class="qp-quote-conditions-container">
                <div class="qp-quote-contact">
                    <table>
                        <tr>
                            <td>Prepared For:
                            </td>
                            <td>
                                <asp:Label ID="CustomerName_Label" runat="server" />
                                <asp:TextBox ID="Customer_TextBox" runat="server" Height="19px" Width="250px" />
                                <asp:TextBoxWatermarkExtender ID="Customer_TextBoxWatermarkExtender" TargetControlID="Customer_TextBox"
                                    WatermarkText="Enter Contact Name" WatermarkCssClass="watermark" runat="server">
                                </asp:TextBoxWatermarkExtender>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="CustomerCompany_Label" runat="server" />
                                <asp:DropDownList ID="Company_DropDownList" runat="server" DataSourceID="Company_SqlDataSource"
                                    DataTextField="CompanyName" DataValueField="CompanyID" AutoPostBack="true" Width="254px" />
                                <asp:SqlDataSource ID="Company_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                    SelectCommand="SELECT * FROM [Company] ORDER BY [CompanyName]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                <div class="qp-quote-terms">
                    <table>
                        <tr>
                            <td>Quoted Date:
                                <td>
                                    <asp:Label ID="QuotedDate_Label" runat="server" />
                                </td>
                            </td>
                        </tr>
                        <tr>
                            <td>Quote Expires:
                            </td>
                            <td>
                                <asp:Label ID="QuoteExpires_Label" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="clear">
                </div>
            </div>

            <div class="qp-quote-container">
                <div class="part-number-display">
                    <h1>
                        <asp:Label ID="PartNumber_Label" runat="server" /></h1>
                    <div class="error-box" id="Div1" runat="server" visible="false">
                        <asp:Label ID="Label1" runat="server" />
                    </div>
                </div>
                <br />
                <div class="part-description-display">
                    <h5>
                        <asp:Label ID="PartDescription_Label" runat="server" /></h5>
                </div>
                <br />
                <asp:HyperLink runat="server" Text="(show breakdown)" ID="ToggleBreakDown_HyperLink"
                    CssClass="toggle_breakdown small-link" />
                <asp:Panel ID="BreakDown_Panel" runat="server">
                    <div class="qp-line-item-container">
                        <div id="BaseCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Base Sensor Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="BaseCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="SheathTermCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Sheath Termination Adder:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="SheathTermCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="FittingCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Sheath Fitting Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="FittingCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="LeadwireCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Leadwire Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="LeadwireCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="FlexCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Flex Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="FlexCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="LeadwireTermCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Leadwire Termination Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="LeadwireTermCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="MICostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Mineral Insulated Cable Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="MICost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="TubeCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Tubing Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="TubeCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="SanitaryCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Sanitary Adder:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="SanitaryCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="InsertionProbeCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Insertion Probe Adder:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="InsertionProbeCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="ThermowellAssemblyCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Thermowell Assembly Adder:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="ThermowellAssemblyCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="ThermowellCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Thermowell Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="ThermowellCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="QuickConnectCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Quick Connect Adder:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="QuickConnectCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="ExtensionCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Extension Adder:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="ExtensionCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="Option1CostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Option 1 Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="Option1Cost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="Option2CostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Option 2 Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="Option2Cost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="SpecialCodeCostLineItem" class="qp-line-item" runat="server">
                            <div class="qp-line-item-desc">
                                Code Cost:
                            </div>
                            <div class="qp-line-item-cost">
                                <asp:Label ID="SpecialCodeCost_Label" runat="server" />
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </asp:Panel>
                <div id="ListPriceLineItem" class="list-price" runat="server">
                    List Price ....................
                    <asp:Label ID="SensorCost_Label" runat="server" />
                </div>
                <div class="clear">
                </div>
                <br />

                <div id="ConsultFactoryError" class="message-box" runat="server">
                    <div id="QuoteErrorDiv" runat="server" visible="false" style="font: bold 10px Verdana, Geneva, sans-serif;">
                        Current Error(s):
                        <br />
                        <asp:Label ID="QuoteError_Label" runat="server" />
                        <br />
                        <hr />
                        <br />
                    </div>

                    Pricing for this part number is either unavailable through our web site or is incorrect. Please correct any errors or 
                    contact your inside sales representative for pricing. You may go back to <b>STEP 2</b> and check 
                    that all necessary boxes are completed. For an evaluation
                    of your part number, please email us using the following link
                    <asp:HyperLink ID="ConsultFactoryError_HyperLink" Target="_blank" runat="server">sales@sensortecinc.com</asp:HyperLink>.
                    As always, feel free to call
                    <h5>1-800-213-3820</h5>
                    for friendly assistance.
                </div>
                <div class="clear">
                </div>
                <br />
                <div class="qp-discount-contaner">
                    <div class="qp-discount-tab-container">
                        <ul class="qp-discount-tabs">
                            <li id="your-price-tab">Your Discounts</li>
                            <div class="vDivider-light">
                            </div>
                            <li id="standard-delivery-tab">Standard </li>
                            <li id="expedite-delivery-tab">Expedite Options* </li>
                        </ul>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="price-breakdown-container">
                        <ul class="breakdown-line-item">
                            <li class="quantity-discount-desc"></li>
                            <div class="vDivider-light">
                            </div>
                            <li class="two-weeks-discount">2 Weeks</li>
                            <li class="exp-discount">1-Day</li>
                            <li class="exp-discount">3-Day</li>
                            <li class="exp-discount">5-Day</li>
                        </ul>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:Label ID="PriceDiscount_Label" runat="server" />
                    <div class="qp-discount-container-footer">
                        *All expedites MUST have factory approval before ordering.
                        <br />
                        *Expedite prices are subject to change based on availability of parts.
                        <br />
                        -- All part numbers must be confirmed by a sales representative before ordering --
                    </div>
                </div>
            </div>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <%#XPath("Quantity")%>
                    <%#XPath("Percent")%>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clear">
            </div>
            <div class="qp-thankyou">
                Thank you for the opportunity to quote your requirements!
            </div>
            <div class="qp-ship-message">
                Shipping & Handling Charges Are <b>Not</b> Included In The Above Pricing
                <br />
                Minimum Order of <b>$50</b> NET Required, Excluding Freight
            </div>
            <div class="qp-confidential">
                <b>Confidential Document</b>
                <br />
                This quotation contains confidential, privileged, and/or proprietary information
                intended only for the addressee. Unauthorized usage of this document is strictly
                prohibited. Any design principles contained herewith are the sole property of SensorTec,
                Inc and are not to be disclosed, reproduced and/or distributed without prior written
                consent.
            </div>
        </div>
    </div>



</asp:Content>
