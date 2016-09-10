<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Topic.aspx.vb" Inherits="Topic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/topic.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="paper">
            <div class="paper-container">
                <div class="topic-view">
                    <asp:Image ID="Topic_Image" runat="server" />
                    <div class="topic-body">
                        <h1><asp:Label ID="TopicHeader_Label" runat="server"/></h1>
                        <br />
                        <br />
                        <asp:Label ID="TopicDesc_Label" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="paper-shadow">
        </div>
    </div>
</asp:Content>
