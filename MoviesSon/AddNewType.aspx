<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="AddNewType.aspx.cs" Inherits="moviesSon.Movies" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
                        <link href="css/style1.css" rel="stylesheet" />
                        <link href="css/CSS.css" rel="stylesheet" type="text/css" />
                        <link rel="stylesheet" type="text/css" href="css/CSS.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  } );
  </script>
<style type="text/css">
    div.polaroid {
        width: 84%;
        background: #ddd url('../../images/bg.jpg');
        box-shadow: 0 8px 9px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.27);
        margin-bottom: 90px;
        margin-left: 20px;
        height: 280px;
        width: 360px;
    }

div.container {
  text-align: center;
   margin-bottom: 10px;
}
        .auto-style83 {
        width: 22%;
        height: 698px;
    }
    .auto-style85 {
        height: 238px;
    }
    .auto-style88 {
        width: 1582px;
        text-align: left;
    }
    .auto-style90 {
        width: 2276px;
        text-align: left;
    }
    .auto-style84 {
        width: 1582px;
        text-align: left;
    }
    .auto-style91 {
        width: 2276px;
        text-align: left;
    }
    .auto-style92 {
        width: 670px;
        text-align: center;
        font-size: medium;
    }
    .auto-style93 {
        font-size: medium;
    }
    .auto-style94 {
        width: 670px;
        text-align: center;
        font-size: large;
    }
    .auto-style95 {
        font-weight: normal;
    }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table align="center" class="auto-style83">
            <tr>
                <td class="auto-style85" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" ImageUrl="~/Uploads/movies.png" runat="server" Height="173px" Width="199px" />
                             2</td>
            </tr>
            <tr>
                <td class="auto-style94" style="color: #009999; font-weight: bold; font-style: normal; font-variant: small-caps; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">Type</td>
                <td class="auto-style88" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txttype" runat="server" Font-Size="Small" Height="36px" Width="233px"></asp:TextBox>
                </td>
                <td class="auto-style90" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:Button ID="Button1" runat="server" Height="30px" OnClick="Button1_Click" Text="Add " Width="74px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bold; font-style: normal; font-variant: small-caps; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">&nbsp;</td>
                <td class="auto-style88" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:ListBox ID="listType" runat="server" Height="113px" Width="154px" DataValueField="typeId" SelectionMode="Multiple" style="text-align: left"></asp:ListBox>
                        </td>
                <td class="auto-style90" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;"><strong><span class="auto-style93">ACTOR</span></strong><span class="auto-style93">&nbsp; Name</span></td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txtactors" runat="server" Font-Size="Small" Height="36px" Width="233px"></asp:TextBox>
                </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;"><strong><span class="auto-style93">ACTOR</span></strong><span class="auto-style93">&nbsp; Last Name</span></td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txtactorsL" runat="server" Font-Size="Small" Height="36px" Width="233px"></asp:TextBox>
                </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:Button ID="Button2" runat="server" Height="30px" OnClick="Button2_Click" Text="Add " Width="74px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:ListBox ID="listActors" runat="server" Height="113px" Width="154px"  SelectionMode="Multiple" style="text-align: left"></asp:ListBox>
                        </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: 700;">DIRECTOR <span class="auto-style95">Name</span></td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txtdirector" runat="server" Font-Size="Small" Height="36px" Width="233px"></asp:TextBox>
                </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: 700;">DIRECTOR <span class="auto-style95">Lastname</span></td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txtdirectorL" runat="server" Font-Size="Small" Height="36px" Width="233px"></asp:TextBox>
                </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:Button ID="Button3" runat="server" Height="30px" OnClick="Button3_Click" Text="Add " Width="74px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:ListBox ID="listDirectors" runat="server" Height="113px" Width="154px"  SelectionMode="Multiple" style="text-align: left"></asp:ListBox>
                        </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style92" style="color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:Button ID="Buttonmain" runat="server" Height="49px" OnClick="Buttonmain_Click" Text="Main Page" Width="150px" />
                        </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
