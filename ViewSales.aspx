<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="ViewSales.aspx.cs" Inherits="Group_6_MP.ViewSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <center> <h1>Sales report</h1> 
            <hr />
        <div class="movcontainer">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="TicketSold" BackColor="#FFFFCC" BorderColor="#CC0000" ForeColor="#660033" AutoGenerateColumns="False" DataKeyNames="PurchaseID">
                    <Columns>
                        <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseID" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    </Columns>
                    <EditRowStyle BackColor="#FFFF66" BorderColor="#993366" BorderStyle="Inset" />
                    <EmptyDataRowStyle BorderColor="#993366" BorderStyle="Inset" ForeColor="#990000" />
                    <HeaderStyle BackColor="#ffcc00" Font-Bold="True" BorderStyle="Inset" />
                    <RowStyle BorderColor="#993366" BorderStyle="Inset" />
                </asp:GridView>

            <asp:GridView ID="GridView2" runat="server" DataSourceID="TotalRevenue" BackColor="#FFFFCC" BorderColor="Red" ForeColor="#660033" AutoGenerateColumns="False" >
                    <Columns>
                        <asp:BoundField DataField="TotalRevenue" HeaderText="TotalRevenue" SortExpression="TotalRevenue" ReadOnly="True" />
                    </Columns>
                    <EditRowStyle BackColor="#FFFF66" BorderColor="#993366" BorderStyle="Inset" />
                    <EmptyDataRowStyle BorderColor="#993366" BorderStyle="Inset" />
                    <HeaderStyle BackColor="#ffcc00" Font-Bold="True" />
                    <RowStyle BorderColor="#993366" BorderStyle="Inset" />
                </asp:GridView>

            <asp:SqlDataSource ID="TicketSold" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Purchase]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="TotalRevenue" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT SUM(Total) AS TotalRevenue FROM Purchase"></asp:SqlDataSource>
        <br />
        </div>
            </center>
    </div>
</asp:Content>
