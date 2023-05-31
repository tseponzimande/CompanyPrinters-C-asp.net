<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CompanyPrinters.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/Roles/Manager.aspx">Company Printers</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <li><a runat="server" href="~/Manager/Test.aspx">Printers</a></li>
                        <%--<li><a runat="server" href="~/Manager/Search.aspx">Users</a></li>--%>
                        <li><a runat="server" href="~/Account/Log.aspx">Sign Out</a></li>
                        <%--<li><a runat="server" href="~/Account/Reg.aspx">Add User</a></li>--%>
                    </ul>
                </div>
            </div>
        </div>



<asp:Label runat="server" Text="Label"> Filter / Search Users</asp:Label>
<hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="817px" Height="110px" AllowPaging="True" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
    <Columns>
        <asp:BoundField DataField="PrinterName" HeaderText="Printer Name" ItemStyle-Width="50px" >
<ItemStyle Width="50px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="PrinterMake" HeaderText="Printer Make" />
        <asp:BoundField DataField="FolderToMonitor" HeaderText="FolderToMonitor" />
        <asp:BoundField DataField="OutputType" HeaderText="OutputType" />
        <asp:BoundField DataField="FileOutput" HeaderText="FileOutput" />
        <asp:BoundField DataField="Active" HeaderText="Active" />
        <asp:BoundField DataField="CreateTimeStamp" HeaderText="CreateTimeStamp" ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
    </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
<br />
<hr />
<asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
<asp:TextBox ClientIDMode="Static" ID="txtStartDate" runat="server" />
<asp:TextBox ID="txtEndDate" runat="server" />
<asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click" />

        <%--<asp:label ID="lblmessage" runat="server" CssClass="mylabel" Font-Bold="true" ForeColor="Red"></asp:label>
         <asp:GridView ID="grdview" Border="1" style="border: 1px solid #CCCCCC" FooterStyle-BackColor="#1493f4"
                footerStyle-foreColor="#ffffff" FooterStyle-Font-Bold="true" ShowFooter="true"
                footerStyle-height="25" AlternatingRowStyle-BackColor="#CCCCCC" GridLines="None"
                allowPaging="True" FooterStyle-HorizontalAlign="Center" PageSize="5" Width="100%"
                autoGenerateColumns="false" runat="server" OnPageIndexChanging="grdview_PageIndexChanging">
             <RowStyle BackColor="#f7f6f3" HorizontalAlign="Center" ForeColor="#333333" />
             <PagerStyle BackColor="Orange" ForeColor="White" HorizontalAlign="Center" />
             <HeaderStyle BackColor="#1493f4" Font-Bold="true" Height="30" ForeColor="White" />
             <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
             <Columns>
                 <asp:TemplateField HeaderText="Printer Name" HeaderStyle-Width="90">
                     <ItemTemplate>
                         <asp:Label ID="lblPrinter" runat="server" Text='<%#Eval("PrinterName")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                  <asp:TemplateField HeaderText="Printer Make" HeaderStyle-Width="90">
                     <ItemTemplate>
                         <asp:Label ID="lblPrinterMake" runat="server" Text='<%#Eval("PrinterMake")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="FolderToMonitor" HeaderStyle-Width="80">
                     <ItemTemplate>
                         <asp:Label ID="lblMnitor" runat="server" Text='<%#Eval("FolderToMonitor")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="OutputType" HeaderStyle-Width="50">
                     <ItemTemplate>
                         <asp:Label ID="lblOutputType" runat="server" Text='<%#Eval("OutputType")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="FileOutput" HeaderStyle-Width="80">
                     <ItemTemplate>
                         <asp:Label ID="lblFileOutput" runat="server" Text='<%#Eval("FileOutput")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Active" HeaderStyle-Width="20">
                     <ItemTemplate>
                         <asp:Label ID="lblActive" runat="server" Text='<%#Eval("Active")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="CreateTimeStamp" HeaderStyle-Width="70">
                     <ItemTemplate>
                         <asp:Label ID="lblTimeStamp" runat="server" Text='<%#Eval("CreateTimeStamp")%>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>

            </Columns>

         </asp:GridView>--%>


</asp:Content>
