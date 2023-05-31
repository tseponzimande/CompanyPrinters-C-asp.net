<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gridUsers.aspx.cs" Inherits="CompanyPrinters.NewFolder2.gridUsers" %>
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
                         <li><a runat="server" href="~/Admin/gridUsers.aspx">Users</a></li>
                        <%--<li><a runat="server" href="~/">Home</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/Users.aspx">Users</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/AddPrinter.aspx">Add Printers</a></li>--%>
                        <%--<li><a runat="server" href="~/Admin/Reg.aspx">Add User</a></li>--%>
                    </ul>
                    <ul class="nav">
                        <li><a style="float: right" runat="server" href="~/Account/Log.aspx">Sign Out</a></li>
                    </ul>
                </div>
        </div>
</div>
<script>
    function validate() {
        var textBox1 = document.getElementById('<%= txt_firstname.ClientID %>');
        var textBox2 = document.getElementById('<%= txt_lastname.ClientID %>');
        var textBox3 = document.getElementById('<%= txt_email.ClientID %>');
        var textBox4 = document.getElementById('<%= txt_username.ClientID %>');
        var textBox5 = document.getElementById('<%= txt_password.ClientID %>');
        var textBox6 = document.getElementById('<%= searchBox.ClientID %>');

        if (textBox1.value.trim() === '') {
            alert('Please fill First Name.');
            textBox1.focus();
            return false;
        }
        else if (textBox2.value.trim() === '') {
            alert('Please fill Last Name.');
            textBox2.focus();
            return false;
        } else if (textBox3.value.trim() === '') {
            alert('Please fill Email.');
            textBox3.focus();
            return false;
        } else if (!textBox3.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
            alert('Please enter a valid email address.');
            textBox3.focus();
            return false;
        }
        else if (textBox4.value.trim() === '') {
            alert('Please fill Username.');
            textBox4.focus();
            return false;
        }
        else if (textBox5.value.trim() === '') {
            alert('Please fill Password.');
            textBox5.focus();
            return false;
        }
        else if (!textBox5.value.match(/^[A-Za-z]\w{7,14}$/)) {
            alert('Password must start with a letter and be 1 to 5 characters long.');
            textBox5.focus();
            return false;
        }
        else if (textBox6.value.trim() === '') {
            alert('Please fill Address.');
            textBox5.focus();
            return false;
        }

        return true;
    }
</script>

    <%--<script type="text/javascript">
        function Clear() {
            document.getElementById("<%=txtFilter.ClientID %>").value = "";
            return true;
        }
    </script>--%>
<br />
<br />
        <asp:TextBox ID="txtFilter" CssClass="form-control" placeholder="User Name" style="text-align:center;display: block; margin: 0 auto; border-radius: 10px" runat="server" /><br />
        <asp:Button ID="btnSearch" CssClass="form-control" style="display: block; margin: 0 auto;border-radius: 10px" runat="server" Text="Search" OnClick="btnSearch_Click" /><br />
        <%--<asp:Button ID="BtnAdd" CssClass="form-control" runat="server" Text="Add User" style="display: block; margin: 0 auto; border-radius: 10px" OnClick="BtnAdd_Click"></asp:Button>--%>
        <button type="button" class="form-control" style="display: block; margin: 0 auto; border-radius: 10px; width: 270px" data-toggle="modal" data-target="#exampleModal">Add User</button>
        <%--<asp:Button ID="btnClear" CssClass="form-control" style="display: block; margin: 0 auto;border-radius: 10px" runat="server" Text="Clear" OnClientClick="return Clear()" /><br />--%>
<br />
<br />
    <center>
           <asp:GridView ID="gvData" runat="server" BackColor="White"
            AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="4"
            Font-Names="Georgia" Font-Size="X-Small" DataKeyNames="UserID" OnDataBound="OnDataBound" OnPageIndexChanging="gvData_PageIndexChanging" 
               OnRowDeleting="gvData_RowDeleting" CellSpacing="2" ForeColor="Black" AllowPaging="True" PageSize="5" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
            <Columns>
                                <asp:BoundField HeaderText="UserID" DataField="UserID" Visible="false" ReadOnly="true" />
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" ItemStyle-Width="10px" />
                                <asp:BoundField DataField="LastName" HeaderText="LastName" ItemStyle-Width="10px"/>
                                <asp:BoundField DataField="DesignationName" HeaderText="Designation" ItemStyle-Width="10px" />
                                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="10px"/>
                                <asp:BoundField DataField="UserName" HeaderText="UserName" ItemStyle-Width="10px"/>
                                <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-Width="10px"/>
                                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="10px"/>
                    
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
                        <asp:Button ID="multiDel" OnClick="multiDel_Click" OnClientClick="return confirm('Are you sure to delete');" CommandName="Multidelete"  Height="25px" Width="39px" runat="server" Text="Del" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkxDel" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                    <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
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
    <asp:Label ID="Label2" runat="server" Text="Selected rows"></asp:Label>
  <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
         <asp:ListItem Text="5" Value="5"></asp:ListItem>
         <asp:ListItem Text="15" Value="15"></asp:ListItem>
         <asp:ListItem Text="20" Value="20"></asp:ListItem>
         <asp:ListItem Text="25" Value="25"></asp:ListItem>
         <asp:ListItem Text="30" Value="30"></asp:ListItem>
         <asp:ListItem Text="35" Value="35"></asp:ListItem>
         <asp:ListItem Text="40" Value="40"></asp:ListItem>
     </asp:DropDownList><br /><br />
    <%--<asp:Button ID="BtnMultiDel" CssClass="form-control" style="float: right; width :70px; margin-right: 7em" OnClientClick="return confirm('Are you sure to delete');" CausesValidation="false" 
        CommandName="Mutiple Delete" runat="server" Text="Multi Del" OnClick="BtnMultiDel_Click" />--%>
<asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
<br />

    <div class="modal fade" id="exampleModal" style="height: 700px" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-dialog" role="document">
            
            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title" id="exampleModalLabel">ADD USER
                    </h5>

                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                        <span aria-hidden="true">&times;</span>

                    </button>

                </div>

                <div class="modal-body">

                    <!-- Form to enter User information -->

                    <formview>

                        <div class="form-group" style="margin-bottom: 250px">
                            <label for="firstName" style="position: absolute; top: 20px; font-family: Georgia">First Name</label>
                            <asp:TextBox ID="txt_firstname" runat="server" class="form-control" Style="position: absolute; top: 5px; left: 180px" placeholder="First Name"></asp:TextBox>
                            <asp:Label ID="lblfirstname" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>

                        <div class="form-group">
                            <label for="LastName" style="position: absolute; top: 50px; font-family: Georgia">Last name</label>
                            <asp:TextBox ID="txt_lastname" runat="server" class="form-control" Style="position: absolute; top: 45px; left: 180px" placeholder="Last Name"></asp:TextBox>
                            <asp:Label ID="lbllastname" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="Email" style="position: absolute; top: 95px; font-family: Georgia">Email</label>
                            <asp:TextBox ID="txt_email" class="form-control" runat="server" Style="position: absolute; top: 90px; left: 180px" placeholder="Email"></asp:TextBox>
                            <asp:Label ID="lblEmail" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="username" style="position: absolute; top: 150px; font-family: Georgia">Username </label>
                            <asp:TextBox ID="txt_username" class="form-control" runat="server" Style="position: absolute; top: 141px; left: 180px" placeholder="Username"></asp:TextBox>
                            <asp:Label ID="lblusername" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="password" style="position: absolute; top: 195px; font-family: Georgia">Password</label>
                            <asp:TextBox ID="txt_password" TextMode="Password" class="form-control" Style="position: absolute; top: 185px; left: 180px" runat="server" placeholder="Password"></asp:TextBox>
                            <asp:Label ID="lblpassword" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="Address" style="position: absolute; top: 251px; font-family: Georgia">Address</label><br />
                            <div id="searchBoxContainer">
                                <asp:TextBox ID="searchBox" CssClass="form-control" placeholder="Address" Style="position: absolute; top: 240px; left: 180px" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                            <div id="myMap" style="position: relative; width: 400px; height: 120px;"></div>
                            <asp:Label ID="lbladdress" runat="server" Visible="false" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group" style="float: left">
                            <label for="Designation" style="font-family: Georgia">Designation</label>
                            <asp:DropDownList ID="Drplst" CssClass="form-control" Style="position: absolute; top: 430px; left: 180px" runat="server" DataSourceID="SqlDataSource1" DataTextField="DesignationName" DataValueField="DesignationID">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:desgDatasource %>" SelectCommand="SELECT * FROM [Designations]"></asp:SqlDataSource>

                            <br />
                            <br />
                        </div>
                    </formview>

                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-primary" style="float: right" data-dismiss="modal">Close</button>

                    <asp:Button ID="modal" CssClass="btn btn-primary" runat="server" style="position: absolute; right: 530px;" Text="Save" OnClick="Button1_Click" OnClientClick="return validate()" />

                </div>
                </div>
            </div>

        </div>

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


<asp:Button ID="btnShowPopup" runat="server" style="display:none" />

<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</asp:ModalPopupExtender>

    <asp:Panel ID="pnlpopup" runat="server" Height="480px" Width="389px" style="display:block">

        <table style="border: Solid 3px grey; background-color: dimgray; width: 100%; height: 100%" cellpadding="0" cellspacing="0">

            <tr>
                <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger" align="center">User Details</td>
            </tr>
            <tr>
                <td align="right" style="width: 45%"></td>
                <td>
                    <asp:Label ID="lblID" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white">First Name:
                </td>
                <td>
                    <asp:TextBox ID="FName" CssClass="form-control" runat="server" />
                    <asp:Label ID="lblfnames" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white">Last Name:
                </td>
                <td>
                    <asp:TextBox ID="LName" CssClass="form-control" runat="server" />
                    <asp:Label ID="lbllnames" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white">Email:
                </td>
                <td>
                    <asp:TextBox ID="Email" CssClass="form-control" runat="server" />
                    <asp:Label ID="lblemails" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white">UserName:
                </td>
                <td>
                    <asp:TextBox ID="UserName" CssClass="form-control" runat="server" />
                    <asp:Label ID="lblusernames" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white">Password:
                </td>
                <td>
                    <asp:TextBox ID="Password" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lblpasswords" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white; position: absolute; top: 353px;">Address:
                </td>
                <td>
                    <asp:TextBox ID="Address" Style="position: absolute; top: 345px; left: 176px; width: 209px" CssClass="form-control" runat="server" /><br />
                    <asp:Label ID="lbladdresses" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: white">Designation:
                </td>
                <td>
                    <div class="form-group" style="float: left">
                        <%--<label for="Designation">Designation</label>--%>
                        <asp:DropDownList ID="drplstDesi" CssClass="form-control" Style="position: absolute; top: 395px; left: 176px; width: 209px" runat="server" DataSourceID="SqlDataSource2" DataTextField="DesignationName" DataValueField="DesignationID">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:desgDatasource %>" SelectCommand="SELECT * FROM [Designations]"></asp:SqlDataSource>
                        <asp:Label ID="lbldesi" Visible="false" runat="server"></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary" Style="width: 70px; height: 40px; float: left" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click" OnClientClick="return validateTextBox();"  />
                    <asp:Button ID="btnCancel" CssClass="btn btn-primary" Style="width: 70px; height: 40px; float: right" runat="server" Text="Close" />
                </td>
            </tr>
        </table>
</asp:Panel>

    <script>
        function validateTextBox() {
        var textBox1 = document.getElementById('<%= FName.ClientID %>');
        var textBox2 = document.getElementById('<%= LName.ClientID %>');
        var textBox3 = document.getElementById('<%= Email.ClientID %>');
        var textBox4 = document.getElementById('<%= UserName.ClientID %>');
        var textBox5 = document.getElementById('<%= Password.ClientID %>');
        var textBox6 = document.getElementById('<%= Address.ClientID %>');

            if (textBox1.value.trim() === '') {
                alert('Please fill First Name.');
                textBox1.focus();
                return false;
            }
            else if (textBox2.value.trim() === '') {
                alert('Please fill Last Name.');
                textBox2.focus();
                return false;
            } else if (textBox3.value.trim() === '') {
                alert('Please fill Email .');
                textBox3.focus();
                return false;
            } else if (!textBox3.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
                alert('Please enter a valid email address.');
                textBox3.focus();
                return false;
            }
            else if (textBox4.value.trim() === '') {
                alert('Please fill Username .');
                textBox4.focus();
                return false;
            }
            else if (textBox5.value.trim() === '') {
                alert('Please fill Password.');
                textBox5.focus();
                return false;
            }
            else if (!textBox5.value.match(/^[A-Za-z]\w{7,14}$/)) {
                alert('Password must start with a letter and be 1 to 5 characters long.');
                textBox5.focus();
                return false;
            }
            else if (textBox6.value.trim() === '') {
                alert('Please fill Address.');
                textBox5.focus();
                return false;
            }

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


</asp:Content>
