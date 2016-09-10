<%@ Page Title="Log In" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.Master"
    AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Account_Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Styles/login.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Login to QuickPrice</h2>
    <br />
    <br />
    <hr />
    <br />
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false"
        DisplayRememberMe="true" RememberMeText="Remember me on this computer" DestinationPageUrl="../QPDefault.aspx"
        FailureText="Either your email or password were incorrect.">
        <FailureTextStyle CssClass="error-message error-box" />
        <LayoutTemplate>

            <div class="login">
                <div class="column-container">
                    <div class="column" id="main-left">
                        <h1>Enter credentials below to access SensorTec's QuickPrice quoting application.</h1>
                        <div class="credentials">
                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label></h4>
                                </div>
                                <div class="column">
                                    <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        CssClass="error-message" ErrorMessage="Email is required." ToolTip="Email is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></h4>
                                </div>
                                <div class="column">
                                    <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        CssClass="error-message" ErrorMessage="Password is required." ToolTip="Password is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="login-footer">
                            <ul class="inline-list">
                           <li> <asp:CheckBox ID="RememberMe" runat="server" />
                            <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline"><h5>Remember me</h5></asp:Label>
                               </li>
                                <li>    
                            <asp:LinkButton ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"
                                CssClass="button" />
                                <li>

                            </ul>
                        </div>
                        <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="error-message error-box"
                            ValidationGroup="LoginUserValidationGroup" />
                        <div class="error-message">
                            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                        </div>
                    </div>

                    <div class="column" id="main-right">

                        <p>
                            <h4>Looking for access to QuickPrice?</h4>
                            <br />
                            <asp:HyperLink ID="RequestAccount" runat="server" NavigateUrl="mailto:sales@sensortecinc.com?subject=Request An Account">Request an account!</asp:HyperLink>
                        </p>
                        <br />
                        <br />
                        <p>
                            <h4>Forgot your password?</h4>
                            <br />
                            <asp:HyperLink ID="RequestPassword" runat="server" NavigateUrl="RecoverPassword.aspx">Have it sent to you!</asp:HyperLink>
                        </p>
                        <br />
                        <br />
                        <p>
                            <h4>Got Milk?</h4>
                            <br />
                            <asp:HyperLink ID="ChangePassword" runat="server" NavigateUrl="http://www.gotmilk.com"
                                Target="_blank">Have yourself a glass!</asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
            <br />
            <hr />
            <div class="clear">
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
