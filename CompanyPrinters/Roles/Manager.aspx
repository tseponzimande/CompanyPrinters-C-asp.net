<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="CompanyPrinters.Roles.Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <%--<a class="navbar-brand" runat="server" href="~/">Printers</a>--%>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <li><a runat="server" href="~/Roles/Manager.aspx">Printers</a></li>
                        <%--<li><a runat="server" href="~/Manager/Search.aspx">Users</a></li>--%>
                        <%--<li><a runat="server" href="~/Account/Log.aspx">Sign Out</a></li>--%>
                        <%--<li><a runat="server" href="~/Account/Reg.aspx">Add User</a></li>--%>
                    </ul>
                    <ul class="nav">

                        <li><a style="float: right" runat="server" href="~/Account/Log.aspx">Sign Out</a></li>
                    </ul>
                </div>
            </div>
        </div>

    <style>

        html,body{
            background-image: linear-gradient(-10deg, silver,#505b62,silver,#505b62,silver,#505b62,#a8a9ad,silver);
        }
        table{
            margin-top:13px;

        }
    </style>

<script>
    function vali() {
        var textBox1 = document.getElementById('<%= txtStartDate.ClientID %>');
        var textBox2 = document.getElementById('<%= txtEndDate.ClientID %>');

        if (textBox1.value.trim() === '') {
            alert('Please fill First Date.');
            textBox1.focus();
            return false;
        }
        else if (textBox2.value.trim() === '') {
            alert('Please fill Last Date.');
            textBox2.focus();
            return false;
        }
        return true;
    }
</script>

    <script src="../jquery/jquery.quicksearch.js"></script>

    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/Quicksearch.js"></script>
    <script src="jquery.quicksearch.js"></script>--%>

<br />
         <script src="../jquery/jquery.quicksearch.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('.search_textbox').each(function (i) {
            var columnWidth = $('[id*=gvData] th:eq(' + i + ')').width();
            $(this).css('width', columnWidth);
            $(this).quicksearch("[id*=gvData] tr:not(:has(th))", {
                'testQuery': function (query, txt, row) {
                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                }
            });
        });
    });
</script>

<div class="form-group">
    <asp:Label ID="Label3" runat="server" style="position: absolute; top: 80px; left: 500px;" Text="Printer Maker"></asp:Label>
   <asp:DropDownList ID="drpdownprinter" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" runat="server"  DataSourceID="SqlDataSource2" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                            <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT [PrinterMake], [PrinterMakeID] FROM [PrinterMakes]"></asp:SqlDataSource>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpdownprinter"
    ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
        <%--<asp:DropDownList ID="DropDownList1" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" runat="server">
            <asp:ListItem></asp:ListItem>--%>
            <%--<asp:ListItem Text="Canon" Value="Canon"></asp:ListItem>
            <asp:ListItem Text="Samsung" Value="Samsung"></asp:ListItem>
            <asp:ListItem Text="Epson" Value="Epson"></asp:ListItem>--%>
      <%--</asp:DropDownList>--%>
    <asp:Label ID="Label2" runat="server" style="position: absolute; top:130px; left: 500px;" Text="From"></asp:Label>
    <asp:TextBox ID="txtStartDate" ClientIDMode="Static" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" TextMode="Date" runat="server" /><br />
     <asp:Label ID="lblstartdate" runat="server" style="position: absolute; top:115px; left: 500px;" Text=""></asp:Label>
    <asp:Label ID="Label1" runat="server" style="position: absolute; top:175px; left: 500px;" Text="To"></asp:Label>
    <asp:TextBox ID="txtEndDate" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" TextMode="Date" runat="server" />      
    <asp:Label ID="lblenddate" runat="server" Visible="false" Text="Label"></asp:Label>
    <br /><br />
    <asp:Button ID="btnFilter" CssClass="form-control"  data-toggle="modal" runat="server" Text="Filter" style="height: 35px;width: 140px;display: block; margin: 0 auto; border-radius: 10px" OnClick="btnFilter_Click" OnClientClick="return vali()" />
    
   <%-- <asp:Button ID="Button2" CssClass="btn btn-primary"  data-toggle="modal" runat="server" Text="Clear" style="height: 33px; display: block; margin: 0 auto" />--%>
</div>

            <asp:GridView ID="gvData" DataKeyNames="EngenPrintersID" runat="server" BackColor="White"
            AutoGenerateColumns="False" CellPadding="3" CellSpacing="2"
            Font-Names="Georgia" Font-Size="Smaller" Width="475px" OnDataBound="OnDataBound" OnPageIndexChanging="gvData_PageIndexChanging" ForeColor="Black" AllowPaging="True" PageSize="10" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Printer ID" DataField="EngenPrintersID" Visible="false" ReadOnly="true" />
                    <asp:TemplateField HeaderText="PrinterName">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("PrinterName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_printerName" runat="server" Text='<%# Bind("PrinterName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Printer Maker">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_printerMake" runat="server" Text='<%# Eval("PrinterMake") %>'></asp:TextBox>
                        </EditItemTemplate>
                         <ItemTemplate>
                              <asp:Label ID="Label8" runat="server" Text='<%# Eval("PrinterMake") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FolderToMonitor">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("FolderToMonitor") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_folderToMonitor" Width="10px" runat="server" Text='<%# Bind("FolderToMonitor") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OutputType">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("OutputType") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_OutputType" runat="server" Text='<%# Bind("[OutputType]") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FileOutput">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("FileOutput") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_FileOutput" runat="server" Text='<%# Bind("FileOutput") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Active") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <asp:TextBox ID="txt_active" runat="server" Text='<%# Bind("Active") %>'></asp:TextBox>
                            <%--<asp:CheckBox ID="chkbx"  runat="server" Checked='<%# Eval("Active") %>'></asp:CheckBox>--%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CreateTimeStamp">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("CreateTimeStamp") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_CreateTimeStamp" runat="server" Text='<%# Bind("CreateTimeStamp") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Remove Record" ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/images/trash.png" OnClientClick="return confirm('Are you sure to delete');" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ControlStyle-Width="20px"
                                ControlStyle-Height="20px"></asp:ImageButton>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>--%>
                    <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />--%>
            </Columns>
            <%--<FooterStyle BackColor="#CCCCCC" />--%>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <%--<FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />--%>
            <HeaderStyle BackColor="#cccccd" Font-Bold="True" ForeColor="Black" />
                <PagerStyle BackColor="white" ForeColor="Black" HorizontalAlign="Center" />
             <%--   <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />--%>
        </asp:GridView>
 <asp:Label ID="Label5" runat="server" Text="Selected rows"></asp:Label>
  <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
         <asp:ListItem Text="5" Value="5"></asp:ListItem>
         <asp:ListItem Text="15" Value="15"></asp:ListItem>
         <asp:ListItem Text="20" Value="20"></asp:ListItem>
         <asp:ListItem Text="25" Value="25"></asp:ListItem>
         <asp:ListItem Text="30" Value="30"></asp:ListItem>
         <asp:ListItem Text="35" Value="35"></asp:ListItem>
         <asp:ListItem Text="40" Value="40"></asp:ListItem>
     </asp:DropDownList>    
<br /><br />
<asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>

<div id="loader">
    <div class="loader-spinner"></div>
</div>

<style>
    #loader {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        display: flex;
        justify-content: center;
        align-items: center;
    }

.loader-spinner {
    border: 4px solid #f3f3f3;
    border-top: 4px solid #3498db;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    animation: spin 90s linear infinite;
    animation-duration: 7s;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
    <script>

        document.onreadystatechange = function () {
            var loader = document.getElementById('loader');
            loader.style.display = 'flex';
            if (document.readyState !== "complete") {
                loader.style.visibility = "visible";
                document.body.style.overflow = "hidden";
            } else {
                loader.style.visibility = "hidden";
                document.body.style.overflow = "auto";
            }
        };
    </script>

    <footer>
        <p style="margin-top: 250px; display: flex; justify-content: center; align-items: center">&copy; <%: DateTime.Now.Year %> Company Printers</p>
    </footer>
</asp:Content>
