<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Projeto.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="estilo/bootstrap.css">
    <link href="estilo/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <form id="form1" runat="server">          
        <center>        
         <div class="form-group">
             <br />             
             <br />
             <br />
             <br />
             <img alt="" src="image/coracion3.png" class="img-fluid" height="65px" width="100px"/><br />
             <br/>             
             &nbsp;<label for="exampleInputEmail1"><asp:TextBox ID="txtLogin" runat="server" Height="30px" Width="194px" class= "form-control" placeholder="Enter email"></asp:TextBox>
            </label>
         </div>
         <div class="form-group">
             <label for="exampleInputPassword1">   
             <asp:TextBox ID="txtSenha" runat="server" OnTextChanged="TextBox1_TextChanged" class= "form-control" Width="194px" Height="30px" TextMode="Password" placeholder="Password"></asp:TextBox></br>             
             <asp:Label ID="lblMensagem" runat="server" Visible="False"></asp:Label>
             </label>
        </div>
        <asp:Button ID="btnLogar" runat="server" Text="Logar" class="btn btn-primary" OnClick="btnLogar_Click" Width="227px"/>            
        <br />
        </center>
</form>        
</body>
</html>
       