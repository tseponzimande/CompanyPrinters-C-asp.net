<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="CompanyPrinters.Account.Log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2 style="display: flex; justify-content: center; align-items: center; text-decoration:underline">Welcome to Company Printers</h2><br /> 

        <div class="form-group">
             <img src="../images/printer.jpg" style="height: 150px; width: 250px;display: block; border-radius: 35px; margin: 0 auto" alt=""/>
        </div>
    <br />
     <div>
            <h4 style="display: flex; justify-content: center; align-items: center">Login</h4>
            <table style="display: flex; justify-content: center; align-items: center; border: 4px solid; margin-left:455px; margin-right: 400px; margin-top: 20px;border-radius: 50px">
                <tr>                    
                    <td style="width: 163px">UserName -:-</td>
                    <td>
                        <asp:TextBox ID="Text_Username" runat="server" Style="text-align:center;height: 35px; border-radius: 20px; width: 185px; margin-top: 40px" CssClass="form-control"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 163px">Password -:-</td>
                    <td>
                        <asp:TextBox ID="Text_password" TextMode="Password" Style="text-align:center;height: 35px; border-radius: 20px; width: 185px" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 163px"></td>
                    <td>
                        <asp:Button ID="submitbtn" runat="server" CssClass="form-control" Style="height: 35px; width: 185px; border-radius: 20px; background-color: lightgrey" Text="Submit" OnClick="submitbtn_Click" />
                        <br /><br /><br />
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblLoggedUser" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
       </div>   
        <%--<h3><a style="color: black; text-decoration: none" href="~/Account/Reg.aspx">Create Account here </a></h3>--%>
        <%--<h3><a runat="server" style="display: flex; justify-content: center;align-items: center" href="~/Account/Reg.aspx"><span class="auto-style1">Register!</span></a></h3>--%>
        <h3 style="font-family:Cambria; font-size:medium;"><center>If you dont have account<a href="../Admin/Reg.aspx"> Register Here </a></center></h3>
        <footer>
                <p style="margin-top: 250px; display: flex; justify-content: center; align-items: center">&copy; <%: DateTime.Now.Year %> Company Printers</p>
        </footer>
    </div>
    </form>
</body>
</html>
