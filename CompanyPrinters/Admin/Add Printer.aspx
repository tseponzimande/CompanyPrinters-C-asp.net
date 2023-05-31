<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add Printer.aspx.cs" Inherits="CompanyPrinters.Admin.Add_Printer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/html" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" type="text/javascript"></script>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Add Printer</button>


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog" role="document">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="exampleModalLabel">Enter Printer Information</h5>

                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

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
