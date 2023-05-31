<%@ Page Title=""  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="prac.aspx.cs" Inherits="CompanyPrinters.prac" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 

<%--<asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
</asp:ToolkitScriptManager>--%>
    <%--<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
<div>
        <asp:GridView runat="server" ID="gvdetails" DataKeyNames="EngenPrintersID" AutoGenerateColumns="false">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
                    <Columns>
                                <asp:BoundField HeaderText="Printer ID" DataField="EngenPrintersID" Visible="false" ReadOnly="true" />
                                <asp:BoundField DataField="PrinterName" HeaderText="PrinterName" />
                                <asp:BoundField DataField="PrinterMake" HeaderText="PrinterMake" />
                                <asp:BoundField DataField="FolderToMonitor" HeaderText="FolderToMonitor" />
                                <asp:BoundField DataField="OutputType" HeaderText="OutputType" />
                                <asp:BoundField DataField="FileOutput" HeaderText="FileOutput" />
                                <asp:BoundField DataField="Active" HeaderText="Active" />
                                <asp:BoundField DataField="CreateTimeStamp" HeaderText="CreateTimeStamp" />
                        <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtn" ImageUrl="~/images/edit.jpg" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />
                                 </ItemTemplate>
                         </asp:TemplateField>
                    </Columns>
        </asp:GridView>
<asp:Label ID="lblresult" runat="server"/>

<asp:Button ID="btnShowPopup" runat="server" style="display:none" />

<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</asp:ModalPopupExtender>

<asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="269px" Width="400px" style="display:none">

                <table width="100%" style="border:Solid 3px #D55500; width:100%; height:100%" cellpadding="0" cellspacing="0">

                  <tr style="background-color:#D55500">
                  <td colspan="2" style=" height:10%; color:White; font-weight:bold; font-size:larger" align="center">Printer Details</td>
                  </tr>
                   <tr>
                  <td align="right" style=" width:45%">
                     Printer ID:
                  </td>
                  <td>
                  <asp:Label ID="lblPrinterID" runat="server"></asp:Label>
                    </td>
                  </tr>
                 <tr>
                 <td align="right">
                    Printer Name:
                </td>
                <td>
                    <asp:TextBox ID="txtPrinterName" CssClass="form-control" runat="server"/>
                </td>
                </tr>
                <tr>
                <td align="right">
                    Printer Make
                </td>
                <td>
                    <asp:DropDownList ID="drplsPrintermake" CssClass="form-control" style="display: block; margin: 0 auto; border-radius: 10px" runat="server"  DataSourceID="SqlDataSource2" DataTextField="PrinterMake" DataValueField="PrinterMakeID">
                            <asp:ListItem></asp:ListItem>
                   </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="drplsPrintermake"
                ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td align="right">
                    FolderToMonitor:
                </td>
                <td>
                <asp:TextBox ID="txtFolderToMonitor" CssClass="form-control" runat="server"/>
                </td>
                </tr>
                <tr>
                <td align="right">
                    OutputType:
                </td>
                <td>
                <asp:TextBox ID="txtOutputType" CssClass="form-control" runat="server"/>
                </td>
                </tr>
                <tr>
                <td align="right">
                     FileOutput:
                </td>
                <td>
                <asp:TextBox ID="txtFileOutput" CssClass="form-control" runat="server"/>
                </td>
                </tr>
                    <tr>
                <td align="right">
                     Active:
                </td>
                <tr>
                <td>
                        <asp:DropDownList ID="DropDownList1" style="float:right; border-radius: 10px" CssClass="form-control" runat="server">
                            <%--<asp:ListItem></asp:ListItem>--%>
                            <asp:ListItem Text="True" Value="1"></asp:ListItem>
                            <asp:ListItem Text="False" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                </td>
                </tr>
                    <tr>
                <td align="right">
                     CreateTimeStamp:
                </td>
                <td>
                <asp:TextBox ID="txtCreateTimeStamp" CssClass="form-control" runat="server"/>
                </td>
                </tr>
                <tr>
                <td>
                </td>
                <td>
                <asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" onclick="btnUpdate_Click"/>
                <asp:Button ID="btnCancel" runat="server"  Text="Cancel" />
                </td>
                </tr>
                </table>
</asp:Panel>
</div>
<%--<asp:GridView ID="GridView1" runat="server" DataKeyNames="EngenPrintersID" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
    <Columns>
        <asp:BoundField HeaderText="Printer ID" DataField="EngenPrintersID" Visible="false" ReadOnly="true" />
        <asp:BoundField DataField="PrinterName" HeaderText="PrinterName" />
        <asp:BoundField DataField="PrinterMake" HeaderText="PrinterMake" />
        <asp:BoundField DataField="FolderToMonitor" HeaderText="FolderToMonitor" />
        <asp:BoundField DataField="OutputType" HeaderText="OutputType" />
        <asp:BoundField DataField="FileOutput" HeaderText="FileOutput" />
        <asp:BoundField DataField="Active" HeaderText="Active" />
        <asp:BoundField DataField="CreateTimeStamp" HeaderText="CreateTimeStamp" />
               <asp:TemplateField HeaderText="Edit">
                          <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                          </ItemTemplate>
                          <%--<EditItemTemplate>
                                <asp:LinkButton ID="btnUpdate" runat="server" Text="Update" CommandName="Update" />
                                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                          </EditItemTemplate>
                        </asp:TemplateField>
    </Columns>
</asp:GridView>--%>

<%--<asp:Panel ID="pnlEdit" runat="server">
    <asp:TextBox ID="txt_printerName" runat="server" />
    <asp:TextBox ID="txt_printerMake" runat="server" />
    <asp:TextBox ID="txt_folderToMonitor" runat="server" />
    <asp:TextBox ID="txt_OutputType" runat="server" />
    <asp:TextBox ID="txt_FileOutput" runat="server" />
    <asp:TextBox ID="txt_active" runat="server" />
    <asp:TextBox ID="txt_CreateTimeStamp" runat="server" />
    <asp:Button ID="btnSave" runat="server" Text="Save"/>
</asp:Panel>--%>




</asp:Content>
