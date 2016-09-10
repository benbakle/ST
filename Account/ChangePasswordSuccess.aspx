<%@ Page Title="Change Password" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.Master" AutoEventWireup="false"
    CodeFile="ChangePasswordSuccess.aspx.vb" Inherits="Account_ChangePasswordSuccess" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
     <link href="../Styles/login.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Change password to sensortecinc.com
    </h2>
    <br />
    <br />
    <hr />
    <br />
    <div class="login">
        <div style="text-align: center; width: 550px; margin: 0 25px;">
            <h4>Your password has been successfully changed!  
            </h4>
            <br />
            <br />
            <div style="font: normal .9em Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif;">
                You can start using your new password immediately.  Click <a href="../QuickPriceUser/QPConfigure.aspx">here</a> to return to QuickPrice™.
            </div>
        </div>
    </div>
</asp:Content>
