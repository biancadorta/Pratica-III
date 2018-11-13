<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="Sign.aspx.cs" Inherits="Projeto.Sign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="estilo/bootstrap.css">
    <link href="estilo/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">          
        <center>                
         <div class="form-group">
             <br /><br/><br/><br />
             <img alt="" src="image/lalala.png" class="img-fluid" height="65px" width="100px"/><br /><br/>             
             &nbsp;
             <asp:TextBox ID="txtLogin" runat="server" Height="30px" Width="194px" class= "form-control" placeholder="Enter email"></asp:TextBox>             
         </div>

         <div class="form-group">
			  <asp:TextBox ID="txtSenha" runat="server"  class= "form-control" Width="194px" Height="30px" TextMode="Password" placeholder="Password"></asp:TextBox>             
              <asp:Label ID="lblMensagem" runat="server" Visible="False"></asp:Label>     
        </div>

        <asp:Button ID="btnLogar" runat="server" Text="Logar" class="btn btn-primary" Width="227px" OnClick="btnLogar_Click"/>             
        </center>
        <br/><br/><br /><br /><br/><br/><br/><br/>
        <br />
        <br />
        <br />
        <br/><br/>
    </form>
</asp:Content>
