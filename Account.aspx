<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Group_6_MP.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
        <center>
            <h1> My Account</h1>
            </center>
        <div class="movcontainer">
            <asp:Label ID="Label1" runat="server" Text="First name" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Firstname" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label2" runat="server" Text="Last name" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Lastname" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label3" runat="server" Text="Email" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Email" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label4" runat="server" Text="Password" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Passw" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label5" runat="server" Text="Payment Method" CssClass="labelz"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown" AutoPostBack="True">
                <asp:ListItem>Cash</asp:ListItem>
                <asp:ListItem>Credit Card</asp:ListItem>
            </asp:DropDownList>
         <br />
            <asp:Label ID="Label6" runat="server" Text="Address" CssClass="labelz"></asp:Label>
            <asp:TextBox ID="Address" runat="server" CssClass="textboxAddress"></asp:TextBox>
        </div>
        <center>
            <asp:Button ID="Save" runat="server" Text="Save" class="button" OnClick="Save_Click"/>
            <asp:Button ID="Back" runat="server" Text="Back to Main" class="button" OnClick="Back_Click"/>
        </center>
            
    </div>
</asp:Content>
