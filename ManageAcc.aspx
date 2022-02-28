<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="ManageAcc.aspx.cs" Inherits="Group_6_MP.ManageAcc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class ="movcontainer">
            <h1 style="text-align: center;">Manage Accounts</h1> 
            </div>
                <hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True" UpdateMode="Always">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1">
            <HeaderStyle BackColor="#ffcc00" Font-Bold="True" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" Visible="False" />
                <asp:BoundField DataField="xLastname" HeaderText="Lastname" SortExpression="xLastname" />
                <asp:BoundField DataField="xFirstname" HeaderText="Firstname" SortExpression="xFirstname" />
                <asp:BoundField DataField="xEmail" HeaderText="Email" SortExpression="xEmail" />
                <asp:BoundField DataField="xPassword" HeaderText="Password" SortExpression="xPassword" />
                <asp:BoundField DataField="xPayment" HeaderText="Payment" SortExpression="xPayment" />
                <asp:BoundField DataField="xAddress" HeaderText="Address" SortExpression="xAddress" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Users] WHERE [CustomerID] = @CustomerID" 
                InsertCommand="INSERT INTO [Users] ([xLastname], [xFirstname], [xEmail], [xPassword], [xPayment], [xAddress]) VALUES (@xLastname, @xFirstname, @xEmail, @xPassword, @xPayment, @xAddress)" 
                SelectCommand="SELECT * FROM [Users]" 
                UpdateCommand="UPDATE [Users] SET [xLastname] = @xLastname, [xFirstname] = @xFirstname, [xEmail] = @xEmail, [xPassword] = @xPassword, [xPayment] = @xPayment, [xAddress] = @xAddress WHERE [CustomerID] = @CustomerID">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="xLastname" Type="String" />
                    <asp:Parameter Name="xFirstname" Type="String" />
                    <asp:Parameter Name="xEmail" Type="String" />
                    <asp:Parameter Name="xPassword" Type="String" />
                    <asp:Parameter Name="xPayment" Type="String" />
                    <asp:Parameter Name="xAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="xLastname" Type="String" />
                    <asp:Parameter Name="xFirstname" Type="String" />
                    <asp:Parameter Name="xEmail" Type="String" />
                    <asp:Parameter Name="xPassword" Type="String" />
                    <asp:Parameter Name="xPayment" Type="String" />
                    <asp:Parameter Name="xAddress" Type="String" />
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 140px">
                    Lastname:<br />
                    <asp:TextBox ID="LastTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Firstname:<br />
                    <asp:TextBox ID="FirstTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Email:<br />
                    <asp:TextBox ID="EmailTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Password:<br />
                    <asp:TextBox ID="PasswordTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Payment:<br />
                    <asp:DropDownList ID="PaymentDDL" runat="server" Width="140" AutoPostBack="True">
                        <asp:ListItem>Select payment method</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 140px">
                    Address:<br />
                    <asp:TextBox ID="AddressTB" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        </div>
</asp:Content>
