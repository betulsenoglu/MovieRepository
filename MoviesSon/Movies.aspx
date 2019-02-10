<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Movies.aspx.cs" Inherits="moviesSon.Movies" %>

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
        text-align: center;
    }

div.container {
  text-align: center;
   margin-bottom: 10px;
}
        .auto-style1 {
            width: 61%;
            height: 1365px;
        }
        .auto-style6 {
            text-align: right;
            height: 93px;
            font-size: small;
        width: 810px;
    }
        .auto-style8 {
            text-align: left;
            }
        .auto-style16 {
            height: 50px;
            width: 262px;
            font-size: small;
            text-align: justify;
        }
        .auto-style17 {
            width: 810px;
            text-align: right;
            height: 25px;
            font-size: small;
        }
        .auto-style19 {
        width: 810px;
        text-align: right;
        font-size: small;
        height: 84px;
    }
        .auto-style20 {
        width: 262px;
        font-size: small;
        text-align: justify;
        height: 84px;
    }
        .auto-style23 {
            height: 25px;
            width: 262px;
            font-size: small;
            text-align: justify;
        }
        .auto-style24 {
            width: 810px;
            font-size: small;
            height: 96px;
        }
        .auto-style25 {
            width: 262px;
            font-size: small;
            height: 96px;
        }
    .auto-style32 {
        height: 50px;
        width: 479px;
        font-size: small;
        text-align: justify;
    }
    .auto-style33 {
        height: 25px;
        width: 479px;
        font-size: small;
        text-align: left;
    }
    .auto-style34 {
        font-size: small;
        text-align: left;
        height: 84px;
    }
    .auto-style37 {
        width: 479px;
        font-size: small;
        text-align: center;
        height: 96px;
    }
    .auto-style39 {
        width: 810px;
        text-align: right;
        font-size: small;
        height: 50px;
    }
    .auto-style42 {
        width: 280px;
        text-align: right;
        font-size: small;
        height: 65px;
    }
    .auto-style45 {
        height: 233px;
        width: 810px;
    }
    .auto-style46 {
        width: 810px;
        text-align: right;
        font-size: small;
        height: 120px;
    }
    .auto-style47 {
        width: 479px;
        font-size: small;
        text-align: left;
        height: 120px;
    }
    .auto-style48 {
        width: 262px;
        font-size: small;
        text-align: justify;
        height: 120px;
    }
    .auto-style49 {
        width: 479px;
    }
    .auto-style51 {
        height: 233px;
        width: 183px;
    }
    .auto-style52 {
        width: 183px;
        text-align: right;
        font-size: small;
        height: 84px;
    }
    .auto-style53 {
        width: 183px;
        text-align: right;
        font-size: small;
        height: 65px;
    }
    .auto-style54 {
        width: 183px;
        font-size: small;
        height: 96px;
    }
    .auto-style55 {
        width: 183px;
    }
    .auto-style57 {
        width: 810px;
        text-align: right;
        font-size: small;
        height: 65px;
    }
    .auto-style60 {
        width: 479px;
        text-align: left;
    }
    .auto-style67 {
        font-size: small;
        text-align: justify;
        height: 41px;
    }
    .auto-style68 {
        width: 38px;
        text-align: right;
        font-size: small;
        height: 65px;
    }
    .auto-style70 {
        width: 38px;
        font-size: small;
        height: 96px;
    }
    .auto-style71 {
        width: 38px;
    }
    .auto-style72 {
        width: 810px;
    }
    .auto-style73 {
        width: 479px;
        font-size: small;
        text-align: left;
        height: 84px;
    }
    .auto-style78 {
        width: 28px;
        font-size: small;
        text-align: justify;
        height: 84px;
    }
    .auto-style80 {
        width: 28px;
        text-align: right;
        font-size: small;
        height: 65px;
    }
    .auto-style81 {
        width: 28px;
    }
    .auto-style82 {
        width: 28px;
        font-size: small;
        height: 96px;
    }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1" align="left">
                <tr>
                    <td rowspan="4" class="auto-style55"> <div class="polaroid">
                        <asp:Image ID="Image1" ImageUrl="~/Uploads/movies.png" runat="server" Height="290px" Width="361px" />
                             <div class="container">
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Candara" Font-Size="X-Large" style="text-align: center"></asp:Label>
                                 </p>
  </div><asp:Label ID="lblmessage" runat="server" Font-Bold="False" Font-Size="Medium" ForeColor="#000000"></asp:Label>
                                                                                                
                    </td>
                    <td class="auto-style6">
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        Movie&nbsp;&nbsp; Name :</td>
                    <td class="auto-style32">&nbsp;&nbsp;<br />
                        &nbsp;<br />
                        <br />
                        <asp:DropDownList ID="ddlMovie" runat="server" AutoPostBack="True" EnableViewState="true" Height="40px" Width="176px" BackColor="#CCCCCC" CssClass="auto-style8" Font-Bold="False" Font-Size="Medium" ForeColor="#37A69B" OnSelectedIndexChanged="ddlMovie_SelectedIndexChanged" >
                        </asp:DropDownList>
                        <br />
&nbsp;&nbsp;&nbsp;
                        &nbsp;</td>
                    <td class="auto-style16">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">Movie&nbsp;&nbsp; Type :</td>
                    <td class="auto-style33">
                        <br />
                        <asp:CheckBoxList ID="chktype" runat="server">
                        </asp:CheckBoxList>
                        <br />
                        <asp:Button ID="ButtonType" runat="server" Font-Size="15px" Height="35px" OnClick="ButtonType_Click" Text="Add a New Type!" Width="132px" />
                        </td>
                    <td class="auto-style23">&nbsp; 
                                                                                                
                        </td>
                </tr>
                <tr>
                    <td class="auto-style39">
                        <br />
                        Movie Year :</td>
                    <td class="auto-style32">
                        &nbsp;<br />
                        <asp:TextBox ID="datepicker" runat="server" Height="40px" Width="174px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style46">Director :</td>
                    <td class="auto-style47">
                        &nbsp;<asp:DropDownList ID="ddlDirectors" runat="server" Height="40px" Width="176px" BackColor="#CCCCCC" CssClass="auto-style8" Font-Bold="False" Font-Size="Medium" ForeColor="#37A69B" OnSelectedIndexChanged="ddlMovie_SelectedIndexChanged" >
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style48">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style52">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="auto-style19">Actors :</td>
                    <td class="auto-style73">
                        <asp:CheckBoxList ID="chkboxActors" runat="server" DataSourceID="SqlDataSource1" DataTextField="namesurname" DataValueField="actorId">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MoviesConnectionString %>" SelectCommand="SELECT [actorId], [actorName]+' '+[actorLastname] as &quot;namesurname&quot; FROM [Actors]"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="ButtonActor" runat="server" Font-Size="15px" Height="35px" OnClick="ButtonActor_Click" Text="Add a New Actor!" Width="133px" />
                        <br />
                    </td>
                    <td class="auto-style20"> 
                                                                                                
                        <asp:Label ID="lblmessageActor" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#009999"></asp:Label>
                                                                                                
                    </td>
                </tr>
                <tr>
                    <td class="auto-style52">&nbsp;</td>
                    <td class="auto-style19">Poster Path:</td>
                    <td class="auto-style34" colspan="2">
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="46px" Width="298px" />
                    </td>
                    <td class="auto-style78">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style53">&nbsp;</td>
                    <td class="auto-style57">&nbsp;</td>
                    <td class="auto-style60" >
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Height="42px" Width="130px" />
                                                
                    <td class="auto-style67" colspan="3">&nbsp;</td>
                                                
                </tr>
                <tr>
                    <td class="auto-style53"> 
                        &nbsp;</td>
                    <td class="auto-style57"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td class="auto-style60" aria-orientation="horizontal" >
                        <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="Button2_Click" Height="41px" Width="130px"  />
                                                                        
                    <td class="auto-style68">
                        &nbsp;</td>
                                                                        
                    <td class="auto-style80">
                        &nbsp;</td>
                                                                        
                    <td class="auto-style42">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style53"> 
                        &nbsp;</td>
                    <td class="auto-style57"> 
                        &nbsp;</td>
                    <td class="auto-style60" aria-orientation="horizontal" >
                        <asp:Button ID="ButtonAddMovie" runat="server" Text="Add Movie!" OnClick="Button3_Click" Height="64px" Width="201px" Font-Size="Large"  /> 
                                                                                                
                        <td class="auto-style68">
                            &nbsp;</td>
                                                                                                
                    <td class="auto-style80">
                        &nbsp;</td>
                                                                                                
                    <td class="auto-style42">
                        &nbsp;</td>
                </tr>
                <tr>
                       
                    <td class="auto-style51">
                        &nbsp;</td>
                    
                    <td class="auto-style45">
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style55">&nbsp;</td>
                    <td class="auto-style72">&nbsp;</td>
                    <td class="auto-style49">
                        &nbsp;</td>
                       
                    <td class="auto-style71">
                        &nbsp;</td>
                    
                    <td class="auto-style81">
                        &nbsp;</td>
                    
                    <td>
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="auto-style54">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style37">
                        &nbsp;</td>
                    <td class="auto-style70">
                        &nbsp;</td>
                    <td class="auto-style82">
                        &nbsp;</td>
                    <td class="auto-style25">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
