<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Group_6_MP.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <center>
            <h1>Sign Up</h1>
            </center>
        <div class="movcontainer">
            <asp:Label ID="Label1" runat="server" Text="First name" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Firstname"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Firstname" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label2" runat="server" Text="Last name" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Lastname"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Lastname" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label3" runat="server" Text="Email" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Email" runat="server" CssClass="textbox"></asp:TextBox>
        <br />
            <asp:Label ID="Label4" runat="server" Text="Password" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Passw"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Passw" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
        <br />
            <asp:Label ID="Label5" runat="server" Text="Payment Method" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown" AutoPostBack="True">
                <asp:ListItem>Select payment method</asp:ListItem>
                <asp:ListItem>Cash</asp:ListItem>
                <asp:ListItem>Credit Card</asp:ListItem>
            </asp:DropDownList>
         <br />
            <asp:Label ID="Label6" runat="server" Text="Address" CssClass="labelz"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Passw"><span style="color: red;">*</span></asp:RequiredFieldValidator>
            <asp:TextBox ID="Address" runat="server" CssClass="textboxAddress"></asp:TextBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        </div>
        <center>
            <asp:Button ID="Register" runat="server" Text="Register" class="button" OnClick="Register_Click"/>
            <asp:Button ID="Cancel" runat="server" Text="Cancel" class="button" OnClick="Cancel_Click"/>
        </center>
            
    </div>
</asp:Content>
