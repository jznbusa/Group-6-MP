<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="ManageMovies.aspx.cs" Inherits="Group_6_MP.AdminMov" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
        <div class ="movcontainer">
            <h1 style="text-align: center;">Manage Movies</h1> 
            </div>
                <hr />
        <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MovID" DataSourceID="SqlDataSource1">
            <HeaderStyle BackColor="#ffcc00" Font-Bold="True" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="MovID" HeaderText="MovID" InsertVisible="False" ReadOnly="True" SortExpression="MovID" Visible="False" />
                <asp:BoundField DataField="Mov_name" HeaderText="Movie" SortExpression="Mov_name" />
                <asp:BoundField DataField="Mov_time" HeaderText="Time" SortExpression="Mov_time" />
                <asp:BoundField DataField="Mov_date" HeaderText="Date" SortExpression="Mov_date" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Movies] WHERE [MovID] = @MovID" InsertCommand="INSERT INTO [Movies] ([Mov_name], [Mov_time], [Mov_date], [Price]) VALUES (@Mov_name, @Mov_time, @Mov_date, @Price)" SelectCommand="SELECT * FROM [Movies]" UpdateCommand="UPDATE [Movies] SET [Mov_name] = @Mov_name, [Mov_time] = @Mov_time, [Mov_date] = @Mov_date, [Price] = @Price WHERE [MovID] = @MovID">
            <DeleteParameters>
                <asp:Parameter Name="MovID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Mov_name" Type="String" />
                <asp:Parameter Name="Mov_time" Type="String" />
                <asp:Parameter Name="Mov_date" Type="DateTime" />
                <asp:Parameter Name="Price" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Mov_name" Type="String" />
                <asp:Parameter Name="Mov_time" Type="String" />
                <asp:Parameter Name="Mov_date" Type="DateTime" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="MovID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 140px">
                    Movie:<br />
                    <asp:TextBox ID="MovName" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Time:<br />
                    <asp:TextBox ID="MovTime" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Date:<br />
                    <asp:TextBox ID="MovDate" runat="server" Width="140" />
                </td>
                <td style="width: 140px">
                    Price:<br />
                    <asp:TextBox ID="Price" runat="server" Width="140" />

                </td>
                <td style="width: 140px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
            </center>
    </div>
</asp:Content>
