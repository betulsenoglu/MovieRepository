<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertMovies.aspx.cs" Inherits="moviesSon.InsertMovies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <link href="css/style1.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/CSS.css" />
    <title></title>
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
        margin-bottom: 150px;
        margin-left: 20px;
        height: 300px;
        width: 360px;
    }

div.container {
  text-align: center;
   margin-bottom: 10px;
}
        .auto-style6 {
        width: 290px;
        text-align: right;
        font-size: small;
    }
        .auto-style17 {
            width: 168px;
            text-align: right;
            height: 48px;
            font-size: small;
        }
        .auto-style19 {
        width: 168px;
        text-align: right;
        font-size: small;
        height: 22px;
    }
        .auto-style24 {
        width: 290px;
        text-align: right;
        font-size: small;
        height: 96px;
    }
        .auto-style40 {
        height: 48px;
        width: 309px;
        font-size: small;
        text-align: left;
    }
    .auto-style41 {
        width: 309px;
        font-size: small;
        text-align: left;
        height: 22px;
    }

    .auto-style43 {
        width: 309px;
        font-size: small;
        text-align: left;
        height: 96px;
    }
    .auto-style44 {
        width: 290px;
        text-align: right;
        font-size: small;
        height: 66px;
    }
    .auto-style45 {
        width: 309px;
        font-size: small;
        text-align: left;
        height: 66px;
    }
    .auto-style46 {
        height: 20px;
        width: 309px;
        font-size: small;
        text-align: left;
    }
    .auto-style47 {
        width: 303px;
        height: 58px;
    }
    .auto-style49 {
        height: 20px;
        width: 303px;
        font-size: small;
        text-align: left;
    }
    .auto-style50 {
        height: 48px;
        width: 303px;
        font-size: small;
        text-align: left;
    }
    .auto-style51 {
        width: 303px;
        font-size: small;
        text-align: left;
        height: 22px;
    }
    .auto-style52 {
        width: 303px;
        font-size: small;
        text-align: left;
        height: 66px;
    }
    .auto-style53 {
        width: 303px;
        font-size: small;
        text-align: left;
        height: 96px;
    }
    .auto-style54 {
        height: 58px;
        width: 309px;
    }
    .auto-style55 {
        width: 290px;
        text-align: right;
        font-size: small;
        height: 58px;
    }
    .auto-style57 {
        width: 168px;
        text-align: right;
        font-size: small;
    }
    .auto-style58 {
        width: 168px;
        text-align: right;
        font-size: small;
        height: 66px;
    }
    .auto-style59 {
        width: 168px;
        text-align: right;
        font-size: small;
        height: 58px;
    }
    .auto-style60 {
        width: 168px;
        text-align: right;
        font-size: small;
        height: 96px;
    }
    .auto-style61 {
        width: 100%;
        font-weight: bold;
        font-size: medium;
        text-align: center;
    }
    .auto-style62 {
        font-size: medium;
    }
    .auto-style64 {
        height: 24px;
        width: 309px;
        font-size: small;
        text-align: left;
    }
    .auto-style65 {
        height: 24px;
        width: 303px;
        font-size: small;
        text-align: left;
    }
    .auto-style66 {
        width: 168px;
        text-align: right;
        font-size: small;
        height: 24px;
    }
    </style>
    <link rel="stylesheet" type="text/css" href="css/CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 1119px; height: 1079px;">
            &nbsp;<table style="height: 1067px; width: 1241px">
                <tr>
                    <td class="auto-style6" rowspan="4"> <div class="polaroid">
                        <div class="auto-style61">
                                 <strong style="text-align: center">
                                 <pre class="auto-style62">The Poster Area</strong></pre>
                        </div>
                        <asp:Image ID="Image1" runat="server" Height="290px" Width="700px" style="width:100%" />
                             &nbsp;</td>
                    <td class="auto-style57">
                        <br />
                        Movie Name :</td>
                    <td class="auto-style46">&nbsp;&nbsp;&nbsp;<br />
                        <asp:TextBox ID="txtName" runat="server"  Height="35px" Width="166px"></asp:TextBox>
                        </td>
                    <td class="auto-style49">
                        <br />
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="VName" runat="server" ControlToValidate="txtName" ErrorMessage="*The Name is REQUIRED! " Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#009999" ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">Movie Type :</td>
                    <td class="auto-style40">
                        <asp:CheckBoxList ID="chkbox"  runat="server" Width="290px" DataTextField="type" DataValueField="type" CellPadding="0" CellSpacing="0" RepeatColumns="2">
                        <asp:ListItem>dram</asp:ListItem>
                        <asp:ListItem>gerilim</asp:ListItem>
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TypesConnectionString %>" SelectCommand="SELECT [type] FROM [tayps]"></asp:SqlDataSource>
                        </td>
                    <td class="auto-style50">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style66">Movie Year :</td>
                    <td class="auto-style64">
                        <asp:TextBox ID="datepicker" runat="server" Height="35px" Width="166px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="auto-style65">
                        <p>
                            <asp:RequiredFieldValidator ID="Vyear" runat="server" ControlToValidate="datepicker" ErrorMessage="*The Year is REQUIRED! " Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#009999" ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                        </p>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style19">Director :</td>
                    <td class="auto-style41">
                        <asp:RadioButtonList ID="rbDirectors" runat="server" DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="directorId" CellPadding="0" CellSpacing="0" RepeatColumns="2">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT directorId, directorName + ' ' + directorLastname AS Expr1 FROM Directors"></asp:SqlDataSource>
                        <br />
                    </td>
                    <td class="auto-style51">
                        <asp:RequiredFieldValidator ID="VDirector" runat="server" ControlToValidate="rbDirectors" ErrorMessage="*The Director is REQUIRED! " Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#009999" ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style58">Actors :</td>
                    <td class="auto-style45"><asp:CheckBoxList ID="chkactors" runat="server" Width="290px" DataSourceID="SqlDataSource3" DataTextField="Expr1" DataValueField="actorId" CellPadding="0" CellSpacing="2" RepeatColumns="2">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT actorId, actorName + ' ' + actorLastname AS Expr1 FROM Actors"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style52">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style58">Set a Poster :</td>
                    <td class="auto-style45">
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="46px" Width="298px" />
                    </td>
                    <td class="auto-style52">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style55">
                        </td>
                    <td class="auto-style59">
                        </td>
                    <td class="auto-style54">
                        <asp:Button ID="btnadd" runat="server" OnClick="Button3_Click" Text="Add Movie!" Height="41px" Width="131px" />
                        <br />
                    </td>
                    <td class="auto-style47">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style60"></td>
                    <td class="auto-style43">
                        <asp:Button ID="btnMovies" runat="server" OnClick="btnMovies_Click" Text="Go to Update Page" Height="64px" Width="201px" Font-Size="Large" />
                        <br />
                    </td>
                    <td class="auto-style53">
                        <asp:Label ID="lblmessage" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style60">&nbsp;</td>
                    <td class="auto-style43">
                        &nbsp;</td>
                    <td class="auto-style53">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
