<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userTest.aspx.cs" Inherits="CompanyPrinters.userTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--<table width="100%" style="border: Solid 3px #D55500; width: 100%; height: 100%" cellpadding="0" cellspacing="0">

        <tr style="background-color: #D55500">
            <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger" align="center">Printer Details</td>
        </tr>
        <tr>
            <td align="right" style="width: 45%">Printer ID:
            </td>
            <td>
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">Printer Name:
            </td>
            <td>
                <asp:TextBox ID="PName" CssClass="form-control" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">Printer Make
            </td>
            <td>
                <asp:DropDownList ID="drplsPMake" CssClass="form-control" Style="display: block; margin: 0 auto; border-radius: 10px" runat="server" DataSourceID="SqlDataSource2" DataTextField="PrinterMake" DataValueField="PrinterMakeID" AppendDataBoundItems="true">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:makes %>" SelectCommand="SELECT PrinterMake,PrinterMakeID FROM [PrinterMakes]"></asp:SqlDataSource>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drplsPrintermake"
                ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">FolderToMonitor:
            </td>
            <td>
                <asp:TextBox ID="FolderM" CssClass="form-control" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">OutputType:
            </td>
            <td>
                <asp:TextBox ID="Output" CssClass="form-control" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">FileOutput:
            </td>
            <td>
                <asp:TextBox ID="File" CssClass="form-control" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">Active:
            </td>
            <td>
                <asp:DropDownList ID="Status" Style="float: right" CssClass="form-control" runat="server">
                    <asp:ListItem Text="True" Value="1"></asp:ListItem>
                    <asp:ListItem Text="False" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <%--<td align="right">
                     CreateTimeStamp:x
                </td>
            <td>
                <asp:TextBox ID="Time" CssClass="hidden" runat="server" /><br />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnUpdate" CssClass="form-control" Style="width: 70px; height: 40px; float: left" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" CssClass="form-control" Style="width: 70px; height: 40px; float: right" runat="server" Text="Cancel" />
            </td>
        </tr>
    </table>--%>

</asp:Content>
