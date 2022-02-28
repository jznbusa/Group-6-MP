<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Upcoming.aspx.cs" Inherits="Group_6_MP.Upcoming" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="movcontainer">
     <center>
         <h2 class="css-reflects">UPCOMING</h2>

         <div class="align">
             <asp:Image ID="Image1" runat="server" ImageUrl="~/img/batman.jpg" CssClass="shadow" /> 
             <br /><br />
             <asp:Label ID="Name1" runat="server" CssClass="label">
            The Batman</asp:Label><br />
            <asp:Label ID="Time1" runat="server" CssClass="label">
            Coming Soon</asp:Label><br />
            <asp:Label ID="Date1" runat="server" CssClass="label">
            MARCH 4 2022</asp:Label>
         </div>

         <div class="align">
             <asp:Image ID="Image2" runat="server" ImageUrl="~/img/turningred.jpg" CssClass="shadow" />
             <br /><br />
             <asp:Label ID="Name2" runat="server" CssClass="label">
            Turning Red</asp:Label><br />
            <asp:Label ID="Time2" runat="server" CssClass="label">
            Coming Soon</asp:Label><br />
            <asp:Label ID="Date2" runat="server" CssClass="label">
            MARCH 11 2022</asp:Label>
         </div>

         <div class="align">
             <asp:Image ID="Image3" runat="server" ImageUrl="~/img/lostcity.jpg" CssClass="shadow" />
             <br /><br />
             <asp:Label ID="Name3" runat="server" CssClass="label">
            The Lost City</asp:Label><br />
            <asp:Label ID="Time3" runat="server" CssClass="label">
            Coming Soon</asp:Label><br />
            <asp:Label ID="Date3" runat="server" CssClass="label">
            MARCH 25 2022</asp:Label>
         </div>
    </center>
         <br />
    </div>
</asp:Content>
