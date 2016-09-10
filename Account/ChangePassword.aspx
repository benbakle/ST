<%@ Page Title="Change Password" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.Master" AutoEventWireup="false"
    CodeFile="ChangePassword.aspx.vb" Inherits="Account_ChangePassword" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Styles/password-change.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="change-password">
        <div class="column-container">
            <h2>Change your QuickPrice password</h2>
            <br />
            <br />
            <hr />
            <br />
            <div class="column" id="main-left">

                <h1>Use the form below to change your password.</h1>
                <br />
                <br />
                <p>
                    New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
                </p>
                <br />
                <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/" EnableViewState="false" RenderOuterTable="false"
                    SuccessPageUrl="ChangePasswordSuccess.aspx">
                    <ChangePasswordTemplate>
                        <span class="error-message">
                            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                        </span>
                        <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="error-box" Style="list-style: none;"
                            ValidationGroup="ChangeUserPasswordValidationGroup" />
                        <div class="change-input">
                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Current Password:</asp:Label></h4>
                                </div>
                                <div class="column">
                                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                        CssClass="error-message" ErrorMessage="Password is required." ToolTip="Old Password is required."
                                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>



                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label></h4>
                                </div>
                                <div class="column">
                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                        CssClass="error-message" ErrorMessage="New Password is required." ToolTip="New Password is required."
                                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label></h4>
                                </div>
                                <div class="column">
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="error-message" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                                        ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                        CssClass="error-message" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                                </div>
                            </div>

                        </div>
                        <div class="change-password-footer">
                            <ul class="inline-list">
                                <li>
                                    <asp:LinkButton ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="button" PostBackUrl="~/QPDefault.aspx" /></li>
                                <li>
                                    <asp:LinkButton ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password"
                                        ValidationGroup="ChangeUserPasswordValidationGroup" CssClass="button" /></li>
                            </ul>
                        </div>

                    </ChangePasswordTemplate>
                </asp:ChangePassword>


            </div>
            <div class="column" id="main-right">
                <img src="../images/icons/key-change.png"  alt=""/>
            </div>


        </div>
        <br />
        <br />
        <hr />
        <br />

    </div>
</asp:Content>
