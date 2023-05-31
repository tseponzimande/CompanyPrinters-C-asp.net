<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CompanyPrinters.Roles.Admin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/html" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" type="text/javascript"></script>
   <style>
        html,body{
            background-image: linear-gradient(-10deg, silver,#505b62,silver,#505b62,silver,#505b62,#a8a9ad,silver);
        }
        table{
            margin-top:13px;

        }
    </style>
    <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/Roles/Admin.aspx">Printers</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/Printers.aspx">Printers</a></li>--%>
                         <li><a runat="server" href="~/Admin/gridUsers.aspx">Users</a></li>
                        <%--<li><a runat="server" href="~/Admin/AddPrinter.aspx">Add Printers</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/Reg.aspx">Add User</a></li>--%>
                       <%-- <li><a style="float:right" runat="server" href="~/Account/Log.aspx">Sign Out</a></li>--%>
                    </ul>
                    <ul class="nav">
                        <li><a style="float: right" runat="server" href="~/Account/Log.aspx">Sign Out</a></li>
                    </ul>
                </div>
        </div>
</div>
 <!-- ======================================================== The jquery underneath is for page loading ============================================================ -->
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

<!-- ==================================================== validations ========================================================== -->
<script>
    function validateTextBox() {
        var textBox1 = document.getElementById('<%= txtPrinterName.ClientID %>');
        var textBox2 = document.getElementById('<%= txtFolderToMonitor.ClientID %>');
        var textBox3 = document.getElementById('<%= txtOutputType.ClientID %>');
        var textBox4 = document.getElementById('<%= txtFileOutput.ClientID %>');
        <%--var textBox5 = document.getElementById('<%= rblActive.ClientID %>');--%>

        if (textBox1.value.trim() === '') {
            alert('Please fill Printer Name.');
            textBox1.focus();
            return false;
        }
        else if (textBox2.value.trim() === '') {
            alert('Please fill Folder to Monitor.');
            textBox2.focus();
            return false;
        } else if (textBox3.value.trim() === '') {
            alert('Please fill Output Type.');
            textBox3.focus();
            return false;
        } else if (textBox4.value.trim() === '') {
            alert('Please fill FileOutput Type.');
            textBox4.focus();
            return false;
        }
        //else if (textBox5.value.trim() === '') {
        //    alert('Please fill Status Type.');
        //    textBox5.focus();
        //    return false;
        //    }

        return true;
    }
</script>

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

 <updatepanel id="UpdatePanel1" runat="server">

    <asp:Label ID="Label4" runat="server" style="position: absolute; top: 60px; left: 500px;" Text="Printer Maker"></asp:Label>
   <asp:DropDownList ID="drpdownprinter" AutoPostBack="false" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" runat="server"  DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                            <asp:ListItem></asp:ListItem>
    </asp:DropDownList><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drpdownprinter"
    ErrorMessage="Required Field">*</asp:RequiredFieldValidator>--%>
    <asp:Label ID="Label2" runat="server" style="position: absolute; top:115px; left: 500px;" Text="From"></asp:Label>
    <asp:TextBox ID="txtStartDate" ClientIDMode="Static" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" TextMode="Date" runat="server" /><br />
    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStartDate"
    ErrorMessage="Required Field">*</asp:RequiredFieldValidator>--%>
     <asp:Label ID="lblstartdate" runat="server" Visible="false" Text="Label"></asp:Label>
    <asp:Label ID="Label3" runat="server" style="position: absolute;top:160px;left: 500px;" Text="To"></asp:Label>
    <asp:TextBox ID="txtEndDate" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" TextMode="Date" runat="server" /> 
    <br />
     <asp:Label ID="lblenddate" runat="server" Visible="false" Text="Label"></asp:Label>
   <%-- <asp:Button ID="btnFilter" CssClass="form-control" AutoPostback = false; runat="server" Text="Filter" style="width: 70px;height: 33px;  border-radius: 10px; margin-left: 550px" OnClick="btnFilter_Click" />--%>
    <asp:Button ID="btnFilter" CssClass="form-control" style="width: 70px;height: 33px;  border-radius: 10px; position: absolute; top: 220px; left: 812px;" runat="server" Text="Filter" OnClick="btnFilter_Click" OnClientClick="return vali()" />
    <button type="button" class="form-control" style="border-radius: 10px; position: absolute; top: 221px; left: 700px;width: 70px;" data-toggle="modal" data-target="#exampleModal">Add</button><br />
    <asp:Button ID="BtnClear" CssClass="form-control" runat="server" Text="Clear" style="width: 70px;height: 33px;  border-radius: 10px; position: absolute; top: 220px; left: 915px;" OnClick="BtnClear_Click" />

     <br /><br /><br /><br />
     
    <center>
            <asp:GridView ID="gvData" DataKeyNames="EngenPrintersID" runat="server" BackColor="White"
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="2" PageSize="10"
            Font-Names="Georgia" Font-Size="X-Small" Height="100%" CssClass="style" ForeColor="black" AllowPaging="true" OnDataBound="OnDataBound" OnPageIndexChanging="gvData_PageIndexChanging"  OnRowDeleting="gvData_RowDeleting">
            <Columns>
                                <asp:BoundField HeaderText="Printer ID" DataField="EngenPrintersID" Visible="false" ReadOnly="true" />
                                <asp:BoundField DataField="PrinterName" HeaderText="PrinterName" />
                                <asp:BoundField DataField="PrinterMake" HeaderText="PrinterMake" />
                                <asp:BoundField DataField="FolderToMonitor" HeaderText="FolderToMonitor" />
                                <asp:BoundField DataField="OutputType" HeaderText="OutputType" />
                                <asp:BoundField DataField="FileOutput" HeaderText="FileOutput" />
                                <%--<asp:CheckBoxField DataField="Active" HeaderText="Active" ></asp:CheckBoxField>--%>
                                <asp:BoundField DataField="Active" HeaderText="Active" />
                                <asp:BoundField DataField="CreateTimeStamp" HeaderText="CreateTimeStamp"/>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtn" ImageUrl="~/images/edit.jpg" runat="server" Width="25" Height="25" OnClick="imgbtn_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgBtnDel" ImageUrl="~/images/delete.jpg" OnClientClick="return confirm('Are you sure to delete');" Width="45px" Height="35px"
                            runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:ImageButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Button ID="multiDel" OnClick="multiDel_Click" OnClientClick="return confirm('Are you sure to delete');" CommandName="Multidelete" Height="25px" Width="39px" runat="server" Text="Del" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkxDel" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                
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
    </center>

  <asp:Label ID="Label5" runat="server" Text="Selected rows"></asp:Label>
  <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
         <asp:ListItem Text="5" Value="5"></asp:ListItem>
         <asp:ListItem Text="15" Value="15"></asp:ListItem>
         <asp:ListItem Text="20" Value="20"></asp:ListItem>
         <asp:ListItem Text="25" Value="25"></asp:ListItem>
         <asp:ListItem Text="30" Value="30"></asp:ListItem>
         <asp:ListItem Text="35" Value="35"></asp:ListItem>
         <asp:ListItem Text="40" Value="40"></asp:ListItem>
     </asp:DropDownList>    
<%--<asp:Button ID="BtnMultiDel" CssClass="form-control" style="float: right; width :70px; margin-right: 1em" OnClientClick="return confirm('Are you sure to delete');" CausesValidation="false" 
        CommandName="Mutiple Delete" runat="server" Text="Multi Del" OnClick="BtnMultiDel_Click" />--%>
     <br /><br />
   
<asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>

<div class="modal fade" id="exampleModal" style="height: 700px" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

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
                            <label for="printerName" style="float:left">Printer Name</label>

                            <asp:TextBox ID="txtPrinterName" runat="server" style="position:absolute; top: 25px; left: 180px;" class="form-control" placeholder="Enter printer name"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrinterName"
                ErrorMessage="Required Field">*</asp:RequiredFieldValidator>--%>
                            <asp:Label ID="lblprinterName" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>

                        <div class="form-group">

                            <label for="printerMake" style="float:left">Printer Make</label>

                            <asp:DropDownList ID="drpPrinterMaker" CssClass="form-control" runat="server" style="position:absolute; top: 80px; left: 180px"  DataSourceID="SqlDataSource3" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                            <%--<asp:ListItem></asp:ListItem>--%>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="drpPrinterMaker"
                        ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                  --%>
                        </div>

                        <div class="form-group">

                            <label for="folderToMonitor" style="float:left">Folder to Monitor</label>

                            <asp:TextBox ID="txtFolderToMonitor" class="form-control" runat="server" style="position:absolute; top: 130px; left: 181px" placeholder="Enter folder to monitor"></asp:TextBox>
                              <asp:Label ID="lblFolderM" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>

                        <div class="form-group">

                            <label for="outputType" style="float:left">Output Type</label>

                            <asp:TextBox ID="txtOutputType" class="form-control" runat="server" style="position:absolute; top: 180px; left: 181px" placeholder="Enter output type"></asp:TextBox>
                            <asp:Label ID="lblOutputType" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>

                        <div class="form-group">

                            <label for="fileOutput" style="float:left">File Output</label>

                            <asp:TextBox ID="txtFileOutput" class="form-control" style="position:absolute; top: 240px; left: 181px" runat="server" placeholder="Enter file output"></asp:TextBox>
                            <asp:Label ID="lblFileOutput" runat="server" Visible="false" Text="Label"></asp:Label>

                        </div>

                        <div class="form-group form-check" style="position: absolute; top: 260px; left: 181px">
                             <%--<label for="Status" style="position: absolute; top: 145px; right: 248px;">Status</label>--%>
                            <asp:RadioButtonList ID="rblActive" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="InActive" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        <asp:Label ID="lblrblActive" runat="server" Visible="false" Text="Label"></asp:Label>
                      <%--  <div class="form-group">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFileOutput"
                                ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                        </div>--%>
                    </formview>

 
                </div>

                <div class="modal-footer">

                    <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Clear</button>--%>
                    <asp:Button ID="Clearbtn" CssClass="btn btn-primary" style="float:right" runat="server" Text="Clear" OnClick="Clearbtn_Click" />
                    <asp:Button ID="modal" CssClass="btn btn-primary" runat="server" style="float:left" Text="Save" OnClick="Button1_Click" OnClientClick="return validateTextBox();" />

 
                </div>

            </div>

        </div>

    </div>

<!-- =========================================================== The underneath is for popup edit ======================================================================== -->

<asp:Button ID="btnShowPopup" runat="server" style="display:none" />

<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</asp:ModalPopupExtender>

    <asp:Panel ID="pnlpopup" runat="server" Height="490px" Width="409px" style="display:block">
    <center>
        <table style="border: 2px solid white;background-color: white;width: 100%; height: 100%" cellpadding="0" cellspacing="0">
            
            <tr>
                <td colspan="2" style="height: 10%; color: black; font-weight: bold; font-size: larger" align="center">Printer Details</td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: white"><br />
                </td>
                <td>
                    <asp:Label ID="lblID" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: black;font-weight: bold;">Printer Name:
                </td>
                <td>
                    <asp:TextBox ID="PName" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblPName" runat="server" Visible="false" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: black;font-weight: bold;">Printer Make
                </td>
                <td>
                    <asp:DropDownList ID="drplsPMake" CssClass="form-control" Style="display: block; margin: 0 auto; border-radius: 10px" runat="server" DataSourceID="SqlDataSource2" DataTextField="PrinterMake" DataValueField="PrinterMakeID" AppendDataBoundItems="true">
                        <%--<asp:ListItem></asp:ListItem>--%>
                    </asp:DropDownList><br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drplsPrintermake"
                ErrorMessage="Required Field">*</asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: black;font-weight: bold;">FolderToMonitor:
                </td>
                <td>
                    <asp:TextBox ID="FolderM" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblfolder" runat="server" Visible="false" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: black;font-weight: bold;">OutputType:
                </td>
                <td>
                    <asp:TextBox ID="Output" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblOutput" runat="server" Visible="false" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: black;font-weight: bold;">FileOutput:
                </td>
                <td>
                    <asp:TextBox ID="File" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblfile" runat="server" Visible="false" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 45%; color: black;font-weight: bold;">Active:
                </td>
                <td>
                    <asp:DropDownList ID="Status" Style="float: right" CssClass="form-control" runat="server">
                        <asp:ListItem Text="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="False" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Time" CssClass="hidden" runat="server" /><br />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary" Style="width: 70px; height: 40px; float: left" CommandName="Update" runat="server" Text="Save" OnClick="btnUpdate_Click" OnClientClick="return validate();" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-primary" Style="width: 70px; height: 40px; float: right" runat="server" Text="Close" />
                </td>
            </tr>
        </table>
        </center>
</asp:Panel>

<style>
    .hidden {
        display: none;
    }
</style>

<script>
    function validate() {
        var textBox1 = document.getElementById('<%= PName.ClientID %>');
        var textBox2 = document.getElementById('<%= FolderM.ClientID %>');
        var textBox3 = document.getElementById('<%= Output.ClientID %>');
        var textBox4 = document.getElementById('<%= File.ClientID %>');
        <%--var textBox5 = document.getElementById('<%= rblActive.ClientID %>');--%>

        if (textBox1.value.trim() === '') {
            alert('Printer Name is empty.');
            textBox1.focus();
            return false;
        }
        else if (textBox2.value.trim() === '') {
            alert('FolderToMonitor is empty.');
            textBox2.focus();
            return false;
        } else if (textBox3.value.trim() === '') {
            alert('Output Type is empty.');
            textBox3.focus();
            return false;
        } else if (textBox4.value.trim() === '') {
            alert('File Output Type is empty.');
            textBox4.focus();
            return false;
        }
        //else if (textBox5.value.trim() === '') {
        //    alert('Please fill Status Type.');
        //    textBox5.focus();
        //    return false;
        //    }

        return true;
    }
</script>

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

</updatepanel>
</asp:Content>
