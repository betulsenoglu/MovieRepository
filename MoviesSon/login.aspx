<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="login.aspx.cs" Inherits="moviesSon.Movies" %>

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
        height: 474px;
        width: 374px;
    }

div.container {
  text-align: center;
   margin-bottom: 10px;
}
        .auto-style83 {
        width: 22%;
        height: 584px;
    }
    .auto-style84 {
        width: 1582px;
        text-align: center;
    }
    .auto-style85 {
        height: 238px;
    }
    .auto-style86 {
        width: 670px;
        text-align: center;
    }
    .auto-style87 {
        text-align: center;
        width: 275px;
    }
    .auto-style88 {
        width: 1582px;
        text-align: left;
    }
    .auto-style90 {
        width: 2276px;
        text-align: left;
    }
    .auto-style91 {
        width: 2276px;
        text-align: center;
    }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table align="center" class="auto-style83">
            <tr>
                <td class="auto-style85" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image1" ImageUrl="~/Uploads/movies.png" runat="server" Height="173px" Width="199px" />
                             </td>
            </tr>
            <tr>
                <td class="auto-style86" style="font-size: medium; color: #009999; font-weight: bold; font-style: normal; font-variant: small-caps; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">USERNAME</td>
                <td class="auto-style87" rowspan="6" style="font-size: small; color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style88" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txtusername" runat="server" Font-Size="Small" Height="48px" Width="260px"></asp:TextBox>
                </td>
                <td class="auto-style90" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="txtusername" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style86" style="font-size: medium; color: #009999; font-weight: bold; font-style: normal; font-variant: small-caps; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">PASSWORD</td>
                <td class="auto-style88" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:TextBox ID="txtpassword" runat="server" Font-Size="Small" Height="48px" TextMode="Password" Width="260px"></asp:TextBox>
                </td>
                <td class="auto-style90" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtusername" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style86" style="font-size: small; color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style86" style="font-size: small; color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:Button ID="btnlogin" runat="server" Font-Size="Medium" Height="72px" Text="LOGIN" Width="222px" OnClick="btnlogin_Click" />
                </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style86" style="font-size: small; color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    <asp:Button ID="btngiveup" runat="server" Font-Size="Medium" Height="72px" Text="Main Page" Width="222px" OnClick="btnsignup_Click" CausesValidation="False" />
                </td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style86" style="font-size: small; color: #009999; font-weight: bolder;">&nbsp;</td>
                <td class="auto-style84" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
                <td class="auto-style91" style="font-size: small; color: #009999; font-weight: bolder;">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
