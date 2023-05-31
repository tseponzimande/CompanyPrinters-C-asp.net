<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPrinter.aspx.cs" Inherits="CompanyPrinters.User.UserPrinter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../jquery/jquery.quicksearch.js" type="text/javascript"></script>

    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Company Printers</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                       <%-- <li><a runat="server" href="~/">Home</a></li>
                        <li><a runat="server" href="~/About">About</a></li> --%>
                        <li><a runat="server" href="~/Roles/user.aspx">User</a></li>
                        <li><a runat="server" href="~/Default.aspx">Sign Out</a></li>
                    </ul>
                </div>
            </div>
</div>

    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="172px" Width="192px" AllowPaging="true" PageSize="3">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="PrinterName" HeaderText="PrinterName" SortExpression="PrinterName" />
            <asp:BoundField DataField="PrinterMake" HeaderText="PrinterMake" SortExpression="PrinterMake" />
            <asp:BoundField DataField="FolderToMonitor" HeaderText="FolderToMonitor" SortExpression="FolderToMonitor" />
            <asp:BoundField DataField="OutputType" HeaderText="OutputType" SortExpression="OutputType" />
            <asp:BoundField DataField="FileOutput" HeaderText="FileOutput" SortExpression="FileOutput" />
            <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />
            <asp:BoundField DataField="CreateTimeStamp" HeaderText="CreateTimeStamp" SortExpression="CreateTimeStamp" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:userUsers %>" SelectCommand="SELECT Printers.PrinterName, PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp FROM Printers INNER JOIN PrinterMakes ON Printers.PrinterMakeID = PrinterMakes.PrinterMakeID"></asp:SqlDataSource>--%>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
    <Columns>
        <asp:BoundField DataField="PrinterName" HeaderText="Printer Name" />
        <asp:BoundField DataField="PrinterMake" HeaderText="Printer Make" />
        <asp:BoundField DataField="FolderToMonitor" HeaderText="FolderToMonitor" />
        <asp:BoundField DataField="OutputType" HeaderText="OutputType" />
        <asp:BoundField DataField="FileOutput" HeaderText="FileOutput" />
        <asp:BoundField DataField="Active" HeaderText="Active" />
        <asp:BoundField DataField="CreateTimeStamp" HeaderText="CreateTimeStamp" DataFormatString="{0:dd/MM/yyyy}" />
    </Columns>
    <FooterStyle BackColor="#CCCCCC" />
    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    <PagerSettings FirstPageText="First" LastPageText="Last" />
    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
    <RowStyle BackColor="White" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#808080" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>

<asp:TextBox ClientIDMode="Static" ID="txtStartDate" runat="server" />
<asp:TextBox ID="txtEndDate" runat="server" />
<asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click1" />

<asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
</asp:Content>
