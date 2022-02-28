<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="Group_6_MP.Signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <center>
            <h1> Sign In</h1>
        </center>
        <div class="movcontainer">
            <asp:Label ID="Label3" runat="server" Text="Email" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Email" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label4" runat="server" Text="Password" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Passw"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Passw" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
         <br />
        </div>
        <center>
            <br />
            <asp:Button ID="Login" runat="server" Text="Log in" class="button" OnClick="Login_Click"/>
            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="button" OnClick="Cancel_Click"/>
        </center>
    </div>
</asp:Content>
