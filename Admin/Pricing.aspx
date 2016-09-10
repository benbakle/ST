<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="Pricing.aspx.vb" Inherits="Admin_Pricing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="AddUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="inline">
                <h1>
                    <asp:Label ID="MainSensorTypeLabel" runat="server" Text="" />
                    <asp:Label ID="MainCostTypeLabel" runat="server" Text="" />
                </h1>
            </div>
            <br />
            <hr />
            <br />
            <table class="table-pad">
                <tr>
                    <td>
                        <h5>
                            <asp:Label runat="server" ID="SelectSensorType_Label">Select Sensor Type:</asp:Label>
                        </h5>
                    </td>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div class="update_progress_background"></div>
                                <div class="update_progress_container">
                                    Retrieving Data...
                            <img src="../images/loading.gif" />
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:DropDownList ID="SensorTypeDropDown" runat="server" AutoPostBack="True" DataSourceID="SensorTypeDataSource"
                            DataTextField="TypeDesc" DataValueField="TypeID" Width="150px">
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="SensorTypeDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                            EntityTypeName="" OrderBy="TypeID" TableName="SensorTypes">
                        </asp:LinqDataSource>
                    </td>
                </tr>
            </table>
            <br />
            <!------------------------------------------------------------------------------------------------------------->
            <!------------------------------------------- COSTUP GRIDVIEW ------------------------------------------------->
            <!------------------------------------------------------------------------------------------------------------->
            <asp:Panel ID="CostUpPanel" runat="server">
                <center>
                    <asp:Label ID="NullLabel" runat="server" Text="" CssClass="error-message"></asp:Label></center>
                <asp:GridView ID="CostUpGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CostUpID"
                    DataSourceID="CostUpDataSource" AllowPaging="True" CssClass="base-grid" PagerStyle-CssClass="pgr"
                    RowStyle-CssClass="noSelect" GridLines="None" OnRowDataBound="CostUpGridView_RowDataBound"
                    OnSelectedIndexChanged="CostUpGridView_SelectedIndexChanged" PageSize="20">
                    <Columns>
                        <asp:TemplateField HeaderText="Code" SortExpression="CostUpCode">
                            <ItemTemplate>
                                <asp:Label ID="CodeLabel" runat="server" Text='<%# Bind("CostUpCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="CostUpDesc">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("CostUpDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost">
                            <ItemTemplate>
                                <asp:Label ID="CostLabel" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:CommandField>
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                    <RowStyle CssClass="noSelect" />
                    <SelectedRowStyle CssClass="selected" />
                </asp:GridView>
                <asp:LinqDataSource ID="CostUpDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                    EntityTypeName="" TableName="CostUps" EnableDelete="True" EnableInsert="True"
                    EnableUpdate="True" OrderBy="CostUpCode" Where="CostType_ID == @CostType_ID &amp;&amp; SensorType_ID == @SensorType_ID">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="CostType_ID" QueryStringField="ctype"
                            Type="Int64" />
                        <asp:ControlParameter ControlID="SensorTypeDropDown" DefaultValue="1" Name="SensorType_ID"
                            PropertyName="SelectedValue" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <br />
                <hr />
                <br />
                <div class="align-right">
                    <asp:LinkButton ID="AddCostUpButton" runat="server" Text="Add Cost Up" CssClass="button"
                        OnClick="ShowAddModal" CausesValidation="false" />
                </div>
            </asp:Panel>
            <asp:Button ID="UpdateCompButton" runat="server" Text="Button" CssClass="hidden"
                CausesValidation="false" />
            <!------------------------------------------------------------------------------------------------------------->
            <!-----------------------------------------ADD COST UP PANEL -------------------------------------------------->
            <!------------------------------------------------------------------------------------------------------------->
            <asp:ModalPopupExtender ID="AddModalPopup" runat="server" BackgroundCssClass="modalBackground"
                DropShadow="false" OkControlID="" PopupControlID="AddPanel" TargetControlID="AddHiddenField">
            </asp:ModalPopupExtender>
            <asp:HiddenField ID="AddHiddenField" runat="server" />
            <asp:Panel ID="AddPanel" runat="server" DefaultButton="AddProduct_LinkButton" CssClass="modalPanel"
                Style="display: block;">
                <div class="close">
                    <asp:ImageButton ID="CloseAddImageButton" runat="server" ImageUrl="~/images/close2.gif"
                        CausesValidation="false" />
                </div>
                <div class="add-base-container">
                    <h1>Add
                        <asp:Label ID="CostTypeLabel" runat="server" Text="" />
                        Cost Up</h1>
                    <br />
                    <br />
                    <hr />
                    <br />
                    <div id="costUpExistsError" class="error-box error-message" style="display: none;"
                        runat="server">
                        Cost up
                        <h4>"<asp:Label ID="CostUpExistsCode_Label" runat="server" />"</h4>
                        already exists. Would you like to manage it's components?"
                        <br />
                        <br />
                        <div class="inline-list align-right">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="ConfirmCostUpExist_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li>
                                <li>
                                    <asp:HyperLink ID="CancelCostUpExist_HyperLink" runat="server" CssClass="button">No</asp:HyperLink></li>
                            </ul>
                        </div>
                    </div>
                    <table>
                        <asp:Panel ID="CatagoryPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Catagory:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="TypeDropDown" runat="server" DataSourceID="SensorDataSource"
                                        DataTextField="TypeDesc" DataValueField="TypeID" AutoPostBack="true" CausesValidation="false" />
                                    <asp:SqlDataSource ID="SensorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [SensorType]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="CIPPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>CIP Type:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="CIPDropDown" runat="server" DataSourceID="CIPDataSource" DataTextField="CIPDesc"
                                        DataValueField="CIPID" CausesValidation="false" />
                                    <asp:SqlDataSource ID="CIPDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [CIPCatagory]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>CIP Cap Type:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="CIPCapDropDown" runat="server" CausesValidation="false" DataSourceID="CIPCap_DataSource"
                                        DataTextField="Description" DataValueField="Value" />
                                    <asp:XmlDataSource ID="CIPCap_DataSource" DataFile="~/App_Data/PartBuildCode.xml"
                                        XPath="PartBuildCodes/CIPCaps/CIPCap" runat="server" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="IPPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Insertion Probe:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="IPCatDropDown" runat="server" DataSourceID="IPCatagoryDataSource"
                                        DataTextField="IPDesc" DataValueField="IPID" CausesValidation="false" />
                                    <asp:SqlDataSource ID="IPCatagoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [IPCatagory]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Insertion Probe Type:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="IPTypeDropDown" runat="server" DataSourceID="IPTypeDataSource"
                                        DataTextField="IPTypeDesc" DataValueField="IPTypeID" Width="200px" CausesValidation="false" />
                                    <asp:SqlDataSource ID="IPTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [IPType]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="TWAssemblyPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Configuration:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="TWConfigDropDown" runat="server" DataSourceID="TWConfigDataSource"
                                        DataTextField="TWConfigDesc" DataValueField="TWConfigID" CausesValidation="false" />
                                    <asp:SqlDataSource ID="TWConfigDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [TWConfiguration]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Extension Length:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="TWExtLenghtDropDown" runat="server" CausesValidation="false"
                                        DataSourceID="TWExtLengthDataSource" DataTextField="TWExtLengthDesc" DataValueField="TWExtLengthID" />
                                    <asp:SqlDataSource ID="TWExtLengthDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [TWExtLength]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>Extension Material:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="TWMaterialDropDown" runat="server" DataSourceID="TWMatDataSource"
                                        DataTextField="MaterialDesc" DataValueField="MaterialID" CausesValidation="false" />
                                    <asp:SqlDataSource ID="TWMatDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [Material]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="QuickConnect_Panel" runat="server">
                            <tr>
                                <td>
                                    <h4>QC Option:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="QuickConnect_DropDownList" runat="server" DataSourceID="QCOptionDataSource"
                                        DataTextField="QCOptionDesc" DataValueField="QCOptionID" CausesValidation="false" />
                                    <asp:SqlDataSource ID="QCOptionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [QCOption]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="DescPanel" runat="server">
                            <tr>
                                <td valign="top">
                                    <h4>Description:</h4>
                                    <br />
                                    <asp:RequiredFieldValidator ID="DescRequiredFieldValidator" runat="server" ControlToValidate="DescTextBox"
                                        CssClass="error-message" ToolTip="Description is required" Display="Dynamic"
                                        ValidationGroup="AddValidCost"> required </asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="DescTextBox" runat="server" Wrap="true" TextMode="MultiLine" CssClass="textarea"></asp:TextBox>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="SheathTermPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Sheath Termination:</h4>
                                    <br />
                                    <asp:CustomValidator ID="SheathCustomValidator" runat="server" ControlToValidate="SheathTermTextBox"
                                        OnServerValidate="SheathCustomValidator_ServerValidate" Display="Dynamic" CssClass="error-message"
                                        ValidationGroup="AddValidCost"> Must be only one character long.<br /> (i.e. "B" = Tube & Wire)</asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="SheathRequiredFieldValidator" runat="server" ControlToValidate="SheathTermTextBox"
                                        Display="Dynamic" CssClass="error-message" ToolTip="Termination code is required"
                                        ValidationGroup="AddValidCost"> required</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="SheathTermTextBox" runat="server" class="textbox" MaxLength="2" /></li>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="LeadwireTermPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Leadwire Termination:</h4>
                                    <br />
                                    <asp:CustomValidator ID="LeadwireTermCustomValidator" runat="server" ControlToValidate="LeadwireTermTextBox"
                                        OnServerValidate="LeadwireTermCustomValidator_ServerValidate" Display="Dynamic"
                                        CssClass="error-message" ValidationGroup="AddValidCost">Must be only one character long <br /> (i.e. "B" 2-1/2" split leads)</asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="LeadwireTermRequiredFieldValidator" runat="server"
                                        ControlToValidate="LeadwireTermTextBox" Display="Dynamic" CssClass="error-message"
                                        ToolTip="Termination code is required" ValidationGroup="AddValidCost"> required</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="LeadwireTermTextBox" runat="server" class="textbox" MaxLength="4" /></li>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="ElementPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Element:</h4>
                                    <br />
                                    <asp:CustomValidator ID="ElementCustomValidator" runat="server" ControlToValidate="ElementTextBox"
                                        OnServerValidate="ElementCustomValidator_ServerValidate" Display="Dynamic" CssClass="error-message"
                                        ValidationGroup="AddValidCost">Must be two characters long <br /> (i.e."AG" Single 2-Wire, 100 Ohm Class B Din .00385) </asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="ElementRequiredFieldValidator" runat="server" ControlToValidate="ElementTextBox"
                                        Display="Dynamic" CssClass="error-message" ToolTip="Element is required when creating base product of type 'RTD'"
                                        ValidationGroup="AddValidCost"> required</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="ElementTextBox" runat="server" class="textbox" MaxLength="2" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="WireCountPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Wire Count:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="WireCountDropDown" runat="server" DataSourceID="WireCountDataSource"
                                        DataTextField="WireDesc" DataValueField="WireCountID" />
                                    <asp:LinqDataSource ID="WireCountDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                        EntityTypeName="" TableName="WireCounts">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="CalibrationPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Calibration:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="CalibrationDropDown" runat="server" DataSourceID="CalDataSource"
                                        DataTextField="CalDesc" DataValueField="CalID" />
                                    <asp:LinqDataSource ID="CalDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                        EntityTypeName="" TableName="Calibrations">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="TempPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Temperature:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="TempDropDown" runat="server" DataSourceID="TempDataSource"
                                        DataTextField="TempDesc" DataValueField="TempID" AutoPostBack="true" />
                                    <asp:LinqDataSource ID="TempDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                        EntityTypeName="" TableName="Temperatures">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="SheathODPanel" runat="server">
                            <tr>
                                <td>
                                    <h4>Sheath OD:</h4>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ODDropDown" runat="server" DataSourceID="ODDataSource" DataTextField="ODDecimal"
                                        DataValueField="ODID" />
                                    <asp:LinqDataSource ID="ODDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                        OrderBy="ODDecimal" TableName="ODs">
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                    <br />
                    <hr />
                    <br />
                    <div class="align-right">
                        <asp:LinkButton ID="AddProduct_LinkButton" runat="server" Text="Add" CssClass="button"
                            ValidationGroup="AddValidCost" />
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
