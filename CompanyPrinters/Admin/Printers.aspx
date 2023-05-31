<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Printers.aspx.cs" Inherits="CompanyPrinters.NewFolder1.Printers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/html" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" type="text/javascript"></script>

    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <%--<a class="navbar-brand" runat="server" href="~/Roles/Admin.aspx">Company Printers</a>--%>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <li><a runat="server" href="~/Admin/Printers.aspx">Printers</a></li>
                         <li><a runat="server" href="~/Admin/Users.aspx">Users</a></li>
                        <%--<li><a runat="server" href="~/Admin/AddPrinter.aspx">Add Printers</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/Reg.aspx">Add User</a></li>--%>
                        <li><a style="float:right" runat="server" href="~/Account/Log.aspx">Sign Out</a></li>
                    </ul>
                </div>
        </div>
</div>
    <script src="../jquery/jquery.quicksearch.js" type="text/javascript"></script>
<script type="text/javascript">
        $(function () {
            $('.search_textbox').each(function (i) {
                $(this).quicksearch("[id*=gvData] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                    }
                });
            });
        });
</script>
<hr />

<div class="form-group">
   <asp:DropDownList ID="drpdownprinter" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" runat="server"  DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                            <asp:ListItem></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpPrinterMaker"
    ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
        <%--<asp:DropDownList ID="DropDownList1" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" runat="server">
            <asp:ListItem></asp:ListItem>--%>
            <%--<asp:ListItem Text="Canon" Value="Canon"></asp:ListItem>
            <asp:ListItem Text="Samsung" Value="Samsung"></asp:ListItem>
            <asp:ListItem Text="Epson" Value="Epson"></asp:ListItem>--%>
      <%--</asp:DropDownList>--%>
    <asp:TextBox ClientIDMode="Static" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" TextMode="Date" ID="txtStartDate" runat="server" /><br />
    <asp:TextBox ID="txtEndDate" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" TextMode="Date" runat="server" />      
    <br />
    <asp:Button ID="btnFilter" CssClass="btn btn-primary"  data-toggle="modal" runat="server" Text="Filter" style="height: 33px; display: block; margin: 0 auto" OnClick="btnFilter_Click" />
    <button type="button" class="btn btn-primary" style="display: block; margin: 0 auto; align-content:center" data-toggle="modal" data-target="#exampleModal">Add Printer</button>
   <%-- <asp:Button ID="Button2" CssClass="btn btn-primary"  data-toggle="modal" runat="server" Text="Clear" style="height: 33px; display: block; margin: 0 auto" />--%>
</div>
<hr />
            <asp:GridView ID="gvData" DataKeyNames="EngenPrintersID" runat="server" BackColor="White" BorderColor="#999999"
            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Height="90px"
            Font-Names="Georgia" Font-Size="Small" Width="475px" OnDataBound="OnDataBound" OnPageIndexChanging="gvData_PageIndexChanging" 
            OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" 
            OnRowUpdating="gvData_RowUpdating" ForeColor="Black" GridLines="Vertical" AllowPaging="True" PageSize="10">
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
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="black" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

<hr />
<asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
<hr />

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="exampleModalLabel">ADD A PRINTER
                    </h5>

                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                        <span aria-hidden="true">&times;</span>

                    </button>

                </div>

                <div class="modal-body">

 

                    <!-- Form to enter printer information -->

                    <formview>

                        <div class="form-group">
                            <label for="printerName">Printer Name</label>

                            <asp:TextBox ID="txtPrinterName" runat="server" class="form-control" placeholder="Enter printer name"></asp:TextBox>
                        </div>

                        <div class="form-group">

                            <label for="printerMake">Printer Make</label>

                            <asp:DropDownList ID="drpPrinterMaker" CssClass="form-control" runat="server"  DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                            <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="drpPrinterMaker"
                        ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                  
                        </div>

                        <div class="form-group">

                            <label for="folderToMonitor">Folder to Monitor</label>

                            <asp:TextBox ID="txtFolderToMonitor" class="form-control" runat="server" placeholder="Enter folder to monitor"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label for="outputType">Output Type</label>

                            <asp:TextBox ID="txtOutputType" class="form-control" runat="server" placeholder="Enter output type"></asp:TextBox>

                        </div>

                        <div class="form-group">

                            <label for="fileOutput">File Output</label>

                            <asp:TextBox ID="txtFileOutput" class="form-control" runat="server" placeholder="Enter file output"></asp:TextBox>

                        </div>

                        <div class="form-group form-check">
                            <asp:RadioButtonList ID="rblActive" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="InActive" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>

                        </div>

                        <%--<div class="form-group">

                            <label for="outputType">Created TimeStamp:</label>

                            <asp:TextBox ID="txtCreatedTimeStamp" runat="server" TextMode="Date"></asp:TextBox>

                        </div>--%>

                    </formview>

 

                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    <asp:Button ID="modal" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="Button1_Click" />

 



                </div>

            </div>

        </div>

    </div>


</asp:Content>
