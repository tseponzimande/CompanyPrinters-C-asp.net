<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CompanyPrinters.NewFolder1.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../jquery/jquery.quicksearch.js"></script>

    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/Roles/Admin.aspx">Company Printers</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <li><a runat="server" href="~/Admin/Users.aspx">Users</a></li>
                        <%--<li><a runat="server" href="~/Admin/AddPrinter.aspx">Add Printers</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/Reg.aspx">Add User</a></li>--%>
                        <li><a runat="server" href="~/Account/Log.aspx">Sign Out</a></li>
                    </ul>
                </div>
         </div>
</div>
     <h2>Users</h2>

         <asp:GridView ID="grd_users" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" 
         BorderWidth="1px" CellPadding="3" CellSpacing="1" DataKeyNames="UserID" GridLines="None" Width="857px" OnRowCancelingEdit="grd_users_RowCancelingEdit" 
         OnRowDeleting="grd_users_RowDeleting" OnRowUpdating="grd_users_RowUpdating" OnRowEditing="grd_users_RowEditing" AllowPaging="true" PageSize="3" 
         OnPageIndexChanging="grd_users_PageIndexChanging">
         <Columns>
             <asp:TemplateField HeaderText="First Name">
                 <EditItemTemplate>
                     <asp:TextBox ID="txt_fname" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Last Name">
                 <EditItemTemplate>
                     <asp:TextBox ID="txt_lname" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Email">
                 <EditItemTemplate>
                     <asp:TextBox ID="txt_email" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="UserName">
                 <EditItemTemplate>
                     <asp:TextBox ID="txt_username" runat="server" Text='<%# Eval("UserName") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label6" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Password">
                 <EditItemTemplate>
                     <asp:TextBox ID="txt_password" runat="server" Text='<%# Eval("Password") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label4" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Address">
                 <EditItemTemplate>
                     <asp:TextBox ID="txt_address" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label5" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
         </Columns>
         <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
         <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
         <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
         <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
         <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F1F1F1" />
         <SortedAscendingHeaderStyle BackColor="#594B9C" />
         <SortedDescendingCellStyle BackColor="#CAC9C9" />
         <SortedDescendingHeaderStyle BackColor="#33276A" />
         </asp:GridView>  
 <hr />
<asp:Label ID="lblmsg" runat="server" Text="Filter"></asp:Label>
<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
<hr />
<asp:Button ID="BtnAdd" runat="server" Text="Add User" style="height: 26px; width: 175px" OnClick="BtnAdd_Click"></asp:Button>
</asp:Content>
