<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="Group_6_MP.FirstPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-image1">
        <div class="bg-text">
            <h2 class="css-reflects">Ready to watch?</h2>
            <h3>Sign up to start your membership and enjoy 
                <br />the drive-in cinema experience</h3>
            <asp:Button ID="button" runat="server" Text="Sign up" CssClass="button-nomargin" OnClick="button_Click"/>
         </div>
    </div>
</asp:Content>
