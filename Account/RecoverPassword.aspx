<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.Master" AutoEventWireup="false"
    CodeFile="RecoverPassword.aspx.vb" Inherits="Account_RecoverPassword" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/password-recovery.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="recover-password">
        <div class="column-container">
            <h2>Reset your QuickPrice password</h2>
            <br />
            <br />
            <hr />
            <br />
            <div class="column" id="main-left">

                <h1>Enter your email/username to have a new password sent to you.</h1>
                <br />
                <br />
                <p>
                    It may take several minutes for your password to arrive.  Once you recieve your password, you may change it after logging in.
                    Feel free to contact our <a href="mailto:webmaster@sensortecinc.com">webmaster</a> for help.
                </p>
                <br />
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" OnSendingMail="PasswordRecovery1_SendingMail">
                    <UserNameTemplate>
                        <div class="change-input">
                            <div class="column-container">
                                <div class="column">
                                    <h4>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label></h4>
                                </div>
                                <div class="column">
                                    <asp:TextBox ID="UserName" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1" CssClass="error-message">*</asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                        <div class="recover-password-footer">
                            <div class="submit">
                                <asp:LinkButton CssClass="button" ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" ValidationGroup="PasswordRecovery1" />
                            </div>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <div class="update_progress_background"></div>
                                    <div class="update_progress_container">
                                        Sending New Password...
                                        <img src="../images/loading.gif" alt="" />
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <br />
                            <div class="error-message">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                    </UserNameTemplate>
                    <SuccessTemplate>
                        <h4>A new password has been sent!</h4>
                        <br />
                        <br />
                        <p>
                            It may take several minutes to receive your new password. After recieving your new password, you have the option to change it. All passwords are case sensitive.    
                            </p>
                        <br />
                        <p>
                         Click <a href="Login.aspx">here</a> to log in. If you have any problems, please contact the web master at 
                            <a href="mailto:webmaster@sensortecinc.com?subject=Problem With Login" target="_blank">webmaster@sensortecinc.com</a>
                        </p>
                        </div>
                        </div>
                    </SuccessTemplate>
                </asp:PasswordRecovery>
                </div>
                <div class="column" id="main-right">
                    <img src="../images/icons/lock.png" alt="" />
                </div>
        </div>
        <br />
        <hr />
    </div>
</asp:Content>
