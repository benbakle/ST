<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="QuickPrice_Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/help.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="help">
        <h2>QuickPrice Help</h2>
        <br />
        <br />
        <hr />
        <br />
        <h5>There is nothing more frustrating than trying to figure out how to do simple tasks within a website.
        Our goal is to make your browsing experience as easy as possible, so we have compiled a small list of
        instructions on how to go about using QuickPrice. 
        </h5>
        <br />
        <br />
        <hr />
        <br />

        <br />
        <div class="forgot-password">
            <div class="column-container">

                <div class="column">
                    <h1>I forgot my password</h1>
                    <br />
                    <br />
                    <p>
                        This happens to the best of us.  With all the technology and websites available to us, it is easy to forget what password 
    goes to what.  We have you covered.  If for any reason you forget your password, we will have one immediately generated
    and emailed to you. Simply click on the "LOST PASSWORD" link in the login area of the main page. 
                    </p>
                    <br />

                </div>
                <div class="column">
                    <img src="../images/help/main_login.png" alt="" />
                    <br />
                    <div class="indent"><i>Figure 1.1</i></div>
                </div>

            </div>
            <div class="column-container">
                <div class="column">
                    <p>
                        You will be directed to our password recovery page. Simply enter in the email address associated with your account and a
    new password will be sent to you.
                    </p>
                    <br />
                    <p>
                        After receiving your new password, return to the login screen and sign in using your new password.  You may consider changing your password to something more familiar. 
                    If so, see our section on "How do I change my password?".
                    </p>
                    <br />
                    <p>
                        Usernames and passwords can also be reset by the web master.  If you are having problems, contact
    the web master at <a href="mailto:webmaster@sensortecinc.com" target="_blank">webmaster@sensortecinc.com</a> to 
    resolve any web related issues.
                    </p>
                </div>
                <div class="column">
                    <img src="../images/help/password_restore.png" alt="" />
                    <br />
                    <div class="indent"><i>Figure 1.2</i></div>
                </div>
            </div>
        </div>
        <hr />
        <div class="change-password">
            <div class="column-container">
                <div class="column">
                    <img src="../images/help/main_login.png" alt="" />
                    <br />
                    <div class="indent"><i>Figure 2.1</i></div>
                </div>
                <div class="column">
                    <h1>How do I change my password?</h1>
                    <br />
                    <br />
                    <p>
                        First, you will need to be logged in to change your password.  Enter your login information in the
                        login box located at the bottom of Sensortec's main page. <i>see Figure 2.1</i>
                    </p>
                    <br />
                    <p>
                        <b>Note: You will leave the "Help" page when logging in. To return to the Help Page after logging in, simply click on
                            the QuickPrice logo at the top of the login box. On the destination page, hover over the "Welcome" greeting at the top left of the page. A drop
                            down menu will appear, select "Help".
                        </b>
                    </p>


                </div>
            </div>
            <div class="column-container">
                <div class="column">
                    <img src="../images/help/welcome.png" alt="" id="welcome" />
                    <br />
                    <div class="indent"><i>Figure 2.2</i></div>
                </div>
                <div class="column">
                    <p>
                        After logging in,  simply click on the QuickPrice logo to be taken to the pricing application. At the top of the page, in the header, you should see a
    <b>"Welcome, <i>&lt;your name&gt;</i>"</b>.  Hover over your name and a list will appear. Click on "Change Password". <i>(See Figure 2.2)</i>
                    </p>
                </div>
            </div>
            <div class="column-container">
                <div class="column">
                    <img src="../images/help/change_password.png" alt="" />
                    <br />
                    <div class="indent"><i>Figure 2.3</i></div>
                </div>
                <div class="column">
                    <p>
                        As stated in the prompts, enter in your current password and then your new password twice. <i>(See Figure 2.3)</i>
                        All passwords are case sensitive.  Be sure to keep track of your updated password.  However, if you forget your password, you may see the above section "I forgot my password".
                    </p>
                    <br />
                    <p>
                        After entering in new information, click "Change Password".  Your password will immediately be changed and be ready for you
    to use at your next log in.
                    </p>
                </div>
            </div>
        </div>
        <hr />
    </div>
</asp:Content>

