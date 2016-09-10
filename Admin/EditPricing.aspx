<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="EditPricing.aspx.vb" Inherits="Admin_EditPricing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/costup.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="ManageUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="costup-container">
                <asp:Panel ID="EditPanel" runat="server" DefaultButton="TriggerUpdate">
                    <div class="costup-header">
                        <h1>
                            <asp:Label ID="Code_Label" runat="server" Text="" /></h1>
                        <br />
                        <br />
                        <h2>
                            <asp:Label ID="DescLabel" runat="server" Text="" /></h2>
                    </div>
                    <br />
                    <br />
                    <hr />
                    <br />
                    <div class="column-container">
                        <div class="column" id="costupCalculate">

                            <div class="column-container">
                                <div class="column">
                                    <h4>Material Cost:</h4>
                                </div>
                                <div class="column">
                                    <h2>
                                        <asp:Label ID="CostLabel" runat="server" Text="" /></h2>
                                </div>
                            </div>

                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="OverHeadLabel" runat="server" Text="" />
                                    </h4>
                                    <asp:TextBox ID="OverheadTextBox" runat="server" Text="" Visible="false" CssClass="textbox" />

                                    <asp:LinkButton ID="OverheadLinkButton" runat="server" Text="" CausesValidation="false" />
                                    <h4>:</h4>
                                </div>
                                <div class="column">
                                    <h2>
                                        <asp:Label ID="OverHeadCostLabel" runat="server" Text="" /></h2>
                                    </h2>      
                                </div>
                            </div>

                            <div class="column-container">
                                <div class="column">
                                    <asp:TextBox ID="LaborTextBox" runat="server" Text="" Visible="false" CssClass="textbox" />
                                    <asp:LinkButton ID="LaborLinkButton" runat="server" Text="" CausesValidation="false" />
                                    <h4>
                                        <asp:Label ID="LaborLabel" runat="server" Text="" />
                                    </h4>
                                </div>
                                <div class="column">
                                    <h2>
                                        <asp:Label ID="PPHLabel" runat="server" Text="" />
                                    </h2>
                                    <span class="pph">
                                        <asp:Label ID="LaborCostLabel" runat="server" Text="" />
                                    </span>
                                </div>
                            </div>

                            <div class="column-container">
                                <div class="column">
                                    <h4>Base Mark-up:</h4>
                                </div>
                                <div class="column">
                                    <h2>
                                        <asp:Label ID="MarkUpLabel" runat="server" Text="" /></h2>
                                        <asp:TextBox ID="MarkUpTextBox" runat="server" Text="" Visible="false" CssClass="textbox" />
                                    <asp:LinkButton ID="MarkUpLinkButton" runat="server" Text="" CausesValidation="false" />
                                </div>
                            </div>

                            <div class="column-container" id="costupTotal">
                                <div class="column">
                                    <h1>Total:</h1>
                                </div>
                                <div class="column">
                                    <h1>
                                        <asp:Label ID="TotalCostLabel" runat="server" Text="" /></h1>
                                </div>
                            </div>
                        </div>

                        <div class="column" id="baseDesign">
                            <h4>Description:</h4>
                            <br />
                            <asp:TextBox ID="EditDescTextBox" runat="server" Wrap="true" CssClass="textbox" TextMode="MultiLine" />


                            <asp:Panel ID="EditSensorTypePanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Sensor Type:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditSensorTypeDropDown" runat="server" DataSourceID="EditSensorTypeDataSource"
                                            DataTextField="TypeDesc" DataValueField="TypeID" />
                                        <asp:LinqDataSource ID="EditSensorTypeDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                            EntityTypeName="" OrderBy="TypeID" TableName="SensorTypes" />
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditCIPPanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>CIP Type:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditCIPTypeDropDown" runat="server" DataSourceID="EditCIPDataSource"
                                            DataTextField="CIPDesc" DataValueField="CIPID" CausesValidation="false" />
                                        <asp:SqlDataSource ID="EditCIPDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [CIPCatagory]"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="column-container">
                                    <div class="column">
                                        <h4>CIP Cap Type:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditCIPCapDropDown" runat="server" CausesValidation="false" DataSourceID="CIPCap_DataSource"
                                            DataTextField="Description" DataValueField="Value" />
                                        <asp:XmlDataSource ID="CIPCap_DataSource" DataFile="~/App_Data/PartBuildCode.xml"
                                            XPath="PartBuildCodes/CIPCaps/CIPCap" runat="server" />
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditIPPanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Insertion Probe:</h4>

                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditIPCatDropDown" runat="server" DataSourceID="IPCatagoryDataSource"
                                            DataTextField="IPDesc" DataValueField="IPID" CausesValidation="false" />
                                        <asp:SqlDataSource ID="IPCatagoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [IPCatagory]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Insertion Probe Type:</h4>

                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditIPTypeDropDown" runat="server" DataSourceID="IPTypeDataSource"
                                            DataTextField="IPTypeDesc" DataValueField="IPTypeID" CausesValidation="false" />
                                        <asp:SqlDataSource ID="IPTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [IPType]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </asp:Panel>


                            <asp:Panel ID="EditSheathTermPanel" runat="server" Style="display: none">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Sheath Termination:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:TextBox ID="EditSheathTermTextBox" runat="server" CssClass="textbox" MaxLength="2" />
                                        <br />
                                        <asp:CustomValidator ID="SheathCustomValidator" runat="server" ControlToValidate="EditSheathTermTextBox"
                                            OnServerValidate="SheathCustomValidator_ServerValidate" Display="Dynamic" CssClass="error-message"
                                            ValidationGroup="ManageGroup"> Must be only one character long.<br /> (i.e. "B" = Tube & Wire)</asp:CustomValidator>
                                        <asp:RequiredFieldValidator ID="EditSheathTermRequiredFieldValidator" runat="server"
                                            ControlToValidate="EditSheathTermTextBox" Display="Dynamic" CssClass="error-message"
                                            ToolTip="Termination code is required" ValidationGroup="ManageGroup"> required</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </asp:Panel>


                            <asp:Panel ID="EditTWAssemblyPanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Configuration:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditTWConfigDropDown" runat="server" DataSourceID="TWConfigDataSource"
                                            DataTextField="TWConfigDesc" DataValueField="TWConfigID" CausesValidation="false" />
                                        <asp:SqlDataSource ID="TWConfigDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [TWConfiguration]"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="column-container">
                                    <div class="column">
                                        <h4>Extension Length:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditTWExtLengthDropDown" runat="server" CausesValidation="false"
                                            DataSourceID="TWExtLengthDataSource" DataTextField="TWExtLengthDesc" DataValueField="TWExtLengthID" />
                                        <asp:SqlDataSource ID="TWExtLengthDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [TWExtLength]"></asp:SqlDataSource>
                                    </div>

                                </div>

                                <div class="column-container">
                                    <div class="column">
                                        <h4>Extension Material:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditTWExtMaterialDropDown" runat="server" DataSourceID="TWMatDataSource"
                                            DataTextField="MaterialDesc" DataValueField="MaterialID" CausesValidation="false" />
                                        <asp:SqlDataSource ID="TWMatDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [Material]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditQuickConnect_Panel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Quick Connect Option:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditQuickConnect_DropDownList" runat="server" DataSourceID="QCOptionDataSource"
                                            DataTextField="QCOptionDesc" DataValueField="QCOptionID" CausesValidation="false" />
                                        <asp:SqlDataSource ID="QCOptionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                            SelectCommand="SELECT * FROM [QCOption]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditLWTermPanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Leadwire Termination:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:TextBox ID="EditLWTermTextBox" runat="server" CssClass="textbox" />
                                        <br />
                                        <asp:CustomValidator ID="LeadwireTermCustomValidator" runat="server" ControlToValidate="EditLWTermTextBox"
                                            OnServerValidate="LeadwireTermCustomValidator_ServerValidate" Display="Dynamic"
                                            CssClass="error-message" ValidationGroup="ManageGroup"> Must be only one character long <br /> (i.e. "B" = 2-1/2" split leads)</asp:CustomValidator>
                                        <asp:RequiredFieldValidator ID="EditLWRequiredFieldValidator" runat="server" ControlToValidate="EditLWTermTextBox"
                                            Display="Dynamic" CssClass="error-message" ToolTip="Termination code is required"
                                            ValidationGroup="ManageGroup"> required</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditElementPanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Element:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:TextBox ID="EditElementTextBox" runat="server" CssClass="textbox" />
                                        <br />
                                        <asp:CustomValidator ID="ElementCustomValidator" runat="server" ControlToValidate="EditElementTextBox"
                                            OnServerValidate="ElementCustomValidator_ServerValidate" Display="Dynamic" CssClass="error-message"
                                            ValidationGroup="ManageGroup"> Must be two character long.<br /> (i.e. "AG"= 2-Wire, 100 Ohm Class A)</asp:CustomValidator>
                                        <asp:RequiredFieldValidator ID="EditElementRequiredFieldValidator" runat="server"
                                            ControlToValidate="EditElementTextBox" Display="Dynamic" CssClass="error-message"
                                            ToolTip="Termination code is required" ValidationGroup="ManageGroup"> required</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </asp:Panel>


                            <asp:Panel ID="EditWireCountPanel" runat="server">
                                <div class="column-container">
                                    <div class="column">
                                        <h4>Wire Count:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditWireCountDropDown" runat="server" DataSourceID="EditWireCountDataSource"
                                            DataTextField="WireDesc" DataValueField="WireCountID" />
                                        <asp:LinqDataSource ID="EditWireCountDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                            EntityTypeName="" TableName="WireCounts" />
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditCalPanel" runat="server">
                                <div class=" column-container">
                                    <div class="column">
                                        <h4>Calibration:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditCalDropDown" runat="server" DataSourceID="EditCalDataSource"
                                            DataTextField="CalDesc" DataValueField="CalID" />
                                        <asp:LinqDataSource ID="EditCalDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                            EntityTypeName="" TableName="Calibrations" />
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="EditTempPanel" runat="server">
                                <div class=" column-container">
                                    <div class="column">
                                        <h4>Temperature:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditTempDropDown" runat="server" DataSourceID="EditTempDataSource"
                                            DataTextField="TempDesc" DataValueField="TempID" AutoPostBack="true" />
                                        <asp:LinqDataSource ID="EditTempDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                            EntityTypeName="" TableName="Temperatures" />
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="EditODPanel" runat="server">
                                <div class=" column-container">
                                    <div class="column">
                                        <h4>OD:</h4>
                                    </div>
                                    <div class="column">
                                        <asp:DropDownList ID="EditODDropDown" runat="server" DataSourceID="EditODDataSource"
                                            DataTextField="ODDecimal" DataValueField="ODID" />
                                        <asp:LinqDataSource ID="EditODDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                            OrderBy="ODDecimal" TableName="ODs" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>

                    </div>




                    <div class="costup-components">
                        <asp:GridView ID="ComponentGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CCID"
                            OnRowDataBound="ComponentGridView_RowDataBound" OnSelectedIndexChanged="ComponentGridView_SelectedIndexChanged"
                            GridLines="None" CssClass="costup-grid" RowStyle-CssClass="noSelect" SelectedRowStyle-CssClass="selected"
                            DataSourceID="ComponentDataSource">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="ComponentQty_Label" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# "<div class=""costup-comp-num""><h4>" & Eval("Component.CompNum") & "</h4> :::: </div><div class=""costup-comp-desc"">" & Eval("Component.CompDesc") & "</div>"%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" CssClass="smaller-font" Text='<%# "(" + String.Format("{0:c}", Eval("Component.CompCost")) + "/" + Eval("Component.UM.UMDesc") + ")"%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <b>
                                            <asp:Label ID="AmountLabel" runat="server" Text='<%#String.Format("{0:c}", Eval("Quantity") * Eval("Component.CompCost"))%>' /></b>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="highlight" />
                                </asp:TemplateField>
                                <asp:CommandField ShowSelectButton="true" ButtonType="Link" Visible="true" SelectText="Select"
                                    HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                </asp:CommandField>
                            </Columns>
                            <RowStyle CssClass="noSelect" />
                            <SelectedRowStyle CssClass="selected" />
                        </asp:GridView>

                        <asp:LinqDataSource ID="ComponentDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                            TableName="CostComponentKeys" Where="CostUp_ID == @CostUp_ID" OrderBy="Component.CompNum">
                            <WhereParameters>
                                <asp:QueryStringParameter DefaultValue="1" Name="CostUp_ID" QueryStringField="ID"
                                    Type="Int64" />
                            </WhereParameters>
                        </asp:LinqDataSource>


                        <div class="costup-grid-footer">
                            <asp:LinkButton ID="AddComponentTrigger" runat="server">Add</asp:LinkButton>
                            |
                            <asp:LinkButton ID="RemoveComponent" runat="server" CausesValidation="false">Remove</asp:LinkButton>
                            <div id="materialTotal">
                                Total:
                                <asp:Label ID="MaterialTotal_Label" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                        <div id="deleteComponentFromCostupConfirm" class="message-box" runat="server" style="display: none;">
                            Are you sure you want to delete <b>"<asp:Label runat="server" ID="ComponentDesc_Label" />"</b>
                            from cost up
                            <h5>
                                <asp:Label runat="server" ID="CostupCode_Label" /></h5>
                            "?
                            <br />
                            <br />
                            <div class="inline-list align-right">
                                <ul>
                                    <li>
                                        <asp:LinkButton ID="DeleteComponentFromCostup_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li>
                                    <li>
                                        <asp:HyperLink ID="CancelDeleteComponentFromCostup_HyperLink" runat="server" CssClass="button">Cancel</asp:HyperLink></li>
                                </ul>
                            </div>
                        </div>

                        <div id="noComponentSelectedError" class="error-box error-message" style="display: none;"
                            runat="server">
                            No component was selected.
                            <br />
                            <br />
                            Please select component you would like to remove from costup.
                        </div>

                    </div>


                    <asp:ModalPopupExtender ID="AddComponentModalPopup" runat="server" BackgroundCssClass="modal-background"
                        DropShadow="false" CancelControlID="CloseAddImageButton" PopupControlID="AddComponent_Panel"
                        TargetControlID="AddComponentTrigger">
                    </asp:ModalPopupExtender>
                    <asp:Panel ID="AddComponent_Panel" runat="server" Visible="true" CssClass="costup-add-components" Style="display: none;">
                        <div class="close">
                            <asp:ImageButton ID="CloseAddImageButton" runat="server" ImageUrl="~/images/close2.gif"
                                CausesValidation="false" />
                        </div>
                        <div class="costup-add-catagory">
                            <h1>Add Component To Cost Up</h1>
                            <br />
                            <br />
                            <hr />
                            <br />
                            <br />
                            <h4>Select Catagory</h4>
                            <br />
                            <asp:DropDownList ID="CatagoryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CatagoryDataSource"
                                DataTextField="CatagoryDesc" DataValueField="CatagoryID" />
                            <asp:LinqDataSource ID="CatagoryDataSource" runat="server" ContextTypeName="QPriceDataClassesDataContext"
                                EntityTypeName="" OrderBy="CatagoryDesc" TableName="ComponentCatagories">
                            </asp:LinqDataSource>
                        </div>

                        <div class="costup-add-list">
                            <h4>Select Component</h4>
                            <asp:ListBox ID="ComponentListBox" runat="server" DataSourceID="SelectedComponentSqlDataSource"
                                DataTextField="Component" DataValueField="CompID" Rows="15"></asp:ListBox>
                            <asp:SqlDataSource ID="SelectedComponentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                SelectCommand="SELECT CompNum + ' :::: ' + CompDesc AS Component, CompID FROM Component WHERE (Catagory_ID = @Catagory_ID) ORDER BY CompNum">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="CatagoryDropDownList" Name="Catagory_ID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="noAddComponentSelectedError" class="error-box error-message" style="display: none;" runat="server">
                            No component was selected!<br />
                            <br />
                            Please select desired catagory from the drop down list and then select the component
                            you would like to add to cost up.
                        </div>

                        <div class="costup-add-footer">
                            <asp:TextBox ID="QtyTextBox" runat="server" CssClass="textbox" />
                            <asp:TextBoxWatermarkExtender ID="QtyTextBoxWatermarkExtender" runat="server" TargetControlID="QtyTextBox"
                                WatermarkText="1" WatermarkCssClass="watermark" />
                            <asp:LinkButton ID="AddComponent" runat="server" CausesValidation="false" CssClass="button">Add Component</asp:LinkButton>
                        </div>
                    </asp:Panel>



                    <div id="deleteCostUp" class="message-box" style="display: none;">
                        Are you sure you want to delete
                        <h5>
                            <asp:Label ID="CostUpDelete_Label" runat="server" />
                        </h5>
                        and all related components?

                                <asp:LinkButton ID="ConfirmDeleteCostUp_LinkButton" runat="server" CssClass="button">Yes</asp:LinkButton></li>
                           
                                <asp:HyperLink ID="CancelDeleteCostup_HyperLink" runat="server" CssClass="button">Cancel</asp:HyperLink></li>
                    </div>


                    <asp:HiddenField ID="Code_HiddenField" runat="server" />
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

                    <hr />
                    <div class="costup-footer">
                        <asp:LinkButton ID="DuplicateLinkButton" runat="server" Text="Duplicate" CssClass="button" CausesValidation="false" />
                        <asp:HyperLink ID="DeleteCostUp_HyperLink" runat="server" Text="Delete" CssClass="button"
                            CausesValidation="false" />
                        <asp:LinkButton ID="CompDoneButton" runat="server" Text="Done" CssClass="button"
                            CausesValidation="true" ValidationGroup="ManageGroup" />
                    </div>
                </asp:Panel>
            </div>
            <asp:Button ID="TriggerUpdate" runat="server" Text="" CssClass="hidden" CausesValidation="false" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
