<%@ Page Title="" Language="VB" MasterPageFile="~/QuickPrice/QuickPrice.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../Styles/admin-home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>
        Web Application Managment</h1>
    <br />
    <br />
    <hr />
    <br />
    <div class="admin-home">
    <div class="admin-home-left">
            <h4>
                <a href="Pricing.aspx?ctype=1&stype=1">Base Product </a>
            </h4>
            <p>
                Build and edit SensorTec base cost pricing.  To force customer to "Consult Factory",
                remove base cost from database.
            </p>
            <br />
            <h4>
                <a href="Pricing.aspx?ctype=2&stype=1">Sheath Termination</a></h4>
            <p>
                Build and edit sheath termination cost adders for each style of temperature sensor.
                To force customer to "Consult Factory", remove sheath termination build from database.
            </p>
            <br />
            <h4>
                <a href="Pricing.aspx?ctype=3&stype=1">Leadwire Termination</a></h4>
            <p>
                Build and edit leadwire termination cost adders for each leadwire style temperature
                sensor. To force customer to "Consult Factory", remove leadwire termination build
                from database.
            </p>
            <br />
            <h4>
                <a href="Pricing.aspx?ctype=4&stype=1">Sanitary</a></h4>
            <p>
                Build and edit sanitary cost adders. To force customer to "Consult Factory", remove
                leadwire termination build from database.
            </p>
            <br />
            <h4>
                <a href="Pricing.aspx?ctype=5&stype=1">Insertion Probes</a></h4>
            <p>
                Build and edit insertion probe adders. To force customer to "Consult Factory", remove
                insertion probe build from database.
            </p>
            <br />
            <h4>
                <a href="Pricing.aspx?ctype=6&stype=1">Thermowell Assemblies</a></h4>
            <p>
                Build and edit thermowell assemblies adders. To force customer to "Consult Factory",
                remove leadwire termination build from database.
            </p>
            <br />
            <h4>
                <a href="Pricing.aspx?ctype=7&stype=1">Quick Connects</a></h4>
            <p>
                Build and edit quick connect cost. To force customer to "Consult Factory", remove
                leadwire termination build from database.
            </p>
            <br />
            <h4>
                <a href="Components.aspx">Components</a></h4>
            <p>
                Add and edit components and their cost for part building and resale. To force customer
                to "Consult Factory", remove component from database.
            </p>
            <br />
        </div>
        <div class="admin-home-right">
            <h4>
                <a href="CreateUser.aspx">Create User</a>
            </h4>
            <p>
                Create new users for access to QuickPrice, sales information and administrative
                tools.
            </p>
            <br />
            <h4>
                <a href="EditUser.aspx">Edit Users</a></h4>
            <p>
                Edit users name, email, and permissions. Give seperate permissions to different
                users allowing them to view schedule discounts or for administrators to be able
                to manage the SensorTec web application.</p>
            <br />
            <h4>
                <a href="Pages.aspx">Manage Pages</a></h4>
            <p>
                Create and edit content for both products and services. Use basic html to uniquely
                format each page. Recommended only for users with a strong knowledge in html/css.</p>
            <br />
            <h4>
                <a href="DistList.aspx">Distributor List</a></h4>
            <p>
                Keep distributors up to date by creating and editing SensorTec distributors.</p>
            <br />
            <h4>
                <a href="DistMapping.aspx">Regional Distributors</a></h4>
            <p>
                Using distributors from the "Distributor List", add them to different regions within
                SensorTec's distribution area.</p>
            <br />
        </div>
        
    </div>
    <div class="clear">
    </div>
</asp:Content>
