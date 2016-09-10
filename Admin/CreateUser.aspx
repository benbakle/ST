<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="CreateUser.aspx.vb" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false" RequireEmail="false"
        OnCreatedUser="RegisterUser_CreatedUser" OnCreatingUser="RegisterUser_CreatingUser"
        LoginCreatedUser="false">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    <h1>
                        New User
                    </h1>
                    <br />
                    <br />
                    <hr />
                    <div class="indent">
                        <div class="error-message">
                            <br />
                            <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                        </div>
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="error-message error-box"
                            ValidationGroup="RegisterUserValidationGroup" />
                        <table class="table-pad">
                            <tr>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>
                                        <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstNameTextBox">First Name:</asp:Label></h4>
                                    <br />
                                    <asp:TextBox ID="FirstNameTextBox" runat="server" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstNameTextBox"
                                        CssClass="error-message" ErrorMessage="First Name is required." ToolTip="First Name is required."
                                        ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <h4>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username / E-mail:</asp:Label></h4>
                                    <br />
                                    <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" TabIndex="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        CssClass="error-message" ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                                        ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>
                                        <asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="LastNameTextBox">Last Name:</asp:Label></h4>
                                    <br />
                                    <asp:TextBox ID="LastNameTextBox" runat="server" TabIndex="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastNameTextBox"
                                        CssClass="error-message" ErrorMessage="Last Name is required." ToolTip="Last Name is required."
                                        ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <h4>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></h4>
                                    <br />
                                    <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"
                                        TabIndex="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        CssClass="error-message" ErrorMessage="Password is required." ToolTip="Password is required."
                                        ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h4>
                                        <asp:Label ID="CompanyLabel" runat="server" AssociatedControlID="CompanyName_DropDownList">Company:</asp:Label></h4>
                                    <br />
                                    <asp:DropDownList ID="CompanyName_DropDownList" runat="server" DataSourceID="CompanyName_SqlDataSource"
                                        DataTextField="CompanyName" DataValueField="CompanyID" Width="156px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CompanyName_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:QPdatabaseConnectionString %>"
                                        SelectCommand="SELECT * FROM [Company]"></asp:SqlDataSource>
                                </td>
                                <td>
                                    <h4>
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label></h4>
                                    <br />
                                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                        TabIndex="6"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="error-message"
                                        Display="Dynamic" ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired"
                                        runat="server" ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" CssClass="error-message" Display="Dynamic"
                                        ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <h4>
                            <asp:Label ID="RolesLabel" runat="server" Text="User Permisions:" /></h4>
                        <h4>
                            <asp:RadioButtonList ID="Roles_RadioButtonList" runat="server" RepeatDirection="Horizontal"
                                CssClass="radio-list" TabIndex="8">
                                <asp:ListItem Selected="True" Value="2" Text="Customer" />
                                <asp:ListItem Value="3" Text="Sales" />
                                <asp:ListItem Value="1" Text="Administrator" />
                            </asp:RadioButtonList>
                        </h4>
                        <br />
                        <div class="align-right">
                            <asp:LinkButton ID="CreateUserButton" runat="server" Text="Create" CommandName="MoveNext"
                                ValidationGroup="RegisterUserValidationGroup" CssClass="button" />
                        </div>
                        <asp:TextBox ID="Email" runat="server" Visible="false"></asp:TextBox>
                    </div>
                    <br />
                    <hr />
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
