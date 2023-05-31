<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="CompanyPrinters.Account.Reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Company Printers</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style type="text/css">
        .auto-style1 {
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Printers</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                       <%-- <li><a runat="server" href="~/Admin/Users.aspx">Users</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/AddPrinter.aspx">Add Printers</a></li>
                        <li><a runat="server" href="~/Admin/Reg.aspx">Add User</a></li>--%>
                       <%-- <li><a runat="server" href="~/Account/Log.aspx">Sign Out</a></li>--%>
                    </ul>
                </div>
         </div>
</div>
    <div>
 
    <center><h2>CREATE ACCOUNT</h2></center>
     <center>
        <table class="form-control" style="width: 500px; border: 4px solid black; height: 530px; border-radius: 20px ">
            <tr>
                <td style="font-family: Georgia; font-weight:300">FirstName :</td>
                <td>
                    <asp:TextBox ID="fname" runat="server" Style="height: 35px; border-radius: 7px; width: 190px; margin-right: 36px" CssClass="form-control" placeholder="First name here.."
                        Height="24px" Width="175px"></asp:TextBox>
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname"
                         ErrorMessage="Please enter first name">*</asp:RequiredFieldValidator>
                       <br />
                </td>
            </tr>
             <tr>
                <td style="font-family: Georgia; font-weight:300">LastName :</td>
                <td>
                    <asp:TextBox ID="lname"  runat="server" Style="height: 35px; border-radius: 7px; width: 190px" CssClass="form-control" placeholder="Last name here.."
                        Height="24px" Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname"
                         ErrorMessage="Please enter last name ">*</asp:RequiredFieldValidator>                   
                    <br />
                </td>
            </tr>
            <tr>
                <td style="font-family: Georgia; font-weight:300">Designation :</td>
                <td>
                    <asp:DropDownList ID="drplstDesi" CssClass="form-control" Style="position: absolute; top: 328px; right: 748px; width: 190px" runat="server" DataSourceID="SqlDataSource2" DataTextField="DesignationName" DataValueField="DesignationID">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:desgDatasource %>" SelectCommand="SELECT * FROM [Designations]"></asp:SqlDataSource>
                </td>
            </tr>
                <tr>
                <td style="font-family: Georgia; font-weight:300">Email :</td>
                <td>
                    <asp:TextBox ID="email"  runat="server" Style="height: 35px; border-radius: 7px; width: 190px" CssClass="form-control" placeholder="Type Email adress .."
                         
                        Height="24px" Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email"
                        ErrorMessage="Please enter email_id">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
                       ErrorMessage="enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="font-family: Georgia; font-weight:300">Username :</td>
                <td>
                    <asp:TextBox ID="username"  runat="server" Style="height: 35px; border-radius: 7px; width: 190px" CssClass="form-control" placeholder="Type User Name .."
                         
                        Height="24px" Width="175px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="font-family: Georgia; font-weight:300">Password :</td>
                <td>
                    <asp:TextBox ID="password" TextMode="Password" runat="server" Style="height: 35px; border-radius: 7px; width: 190px" CssClass="form-control" placeholder="Type password here.."
                         Height="24px" Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password"
                        ErrorMessage="Please enter password">*</asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="font-family: Georgia; font-weight:300">Address :</td>
                <td>
                    <div id="searchBoxContainer">
                        <asp:TextBox ID="searchBox" runat="server" ClientIDMode="Static" Style="height: 35px; border-radius: 7px; width: 190px" placeholder="Type Address..." CssClass="form-control" ></asp:TextBox>
                       </div>
                    <div id="myMap" style="position: relative; height: 100px;"></div><br />
                </td>
            </tr>
            <tr>
                <td style="width: 148px"> </td>
                <td>
                    <asp:Button ID="registerbtn" runat="server" Style="height: 35px; border-radius: 7px; width: 160px" Text="Register" OnClick="registerbtn_Click" CssClass="btn btn-primary" />
                    <br />
                    <asp:Label ID="outputlabel" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
        </table>
    </center>
        <br />
   <center><h3 style="font-family: Georgia;font-size: 17px"; color: black> If you have account Already <a runat="server" href="~/Account/Log.aspx">Login Here!</a></h3></center>
 
 
<script type='text/javascript'>
    var map;



    function GetMap() {
        map = new Microsoft.Maps.Map('#myMap', {});



        Microsoft.Maps.loadModule('Microsoft.Maps.AutoSuggest', function () {
            var manager = new Microsoft.Maps.AutosuggestManager({ map: map });
            manager.attachAutosuggest('#<%=searchBox.ClientID %>', '#searchBoxContainer', selectedSuggestion);
            });
    }



    function selectedSuggestion(result) {
        //Remove previously selected suggestions from the map.
        map.entities.clear();



        //Show the suggestion as a pushpin and center map over it.
        var pin = new Microsoft.Maps.Pushpin(result.location);
        map.entities.push(pin);
        map.setView({ bounds: result.bestView });
    }
</script>
 

<script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?callback=GetMap&key=Al7bopkhZpa7DeStIuDGQQISefR-wffsN0FM2gDTTCMcEfl492E2NFraUwBgdiNu' async defer></script>




    </div>
    </form>
</body>
</html>
