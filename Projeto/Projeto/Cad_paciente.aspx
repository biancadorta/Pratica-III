<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_m.Master" AutoEventWireup="true" CodeBehind="Cad_paciente.aspx.cs" Inherits="Projeto.Cad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Main Start -->
  
  <main class="valign-wrapper">
    <div class="container valign">

      <!--  Tables Section-->
      <div id="login" class="row">
        <!-- <h1 class="thin">Login</h1> -->
        <div class="col s12 m8 l6 offset-s10 offset-l4 card-panel">
          <!--<form class="login-form"  id="formulario">-->
            <div class="row primary-color form-header" style="background: #e6ffe6; color: cadetblue;">
              <!--<div class="col s4">
                <img src="image/user.png" alt="logo" class="logo responsive-img-height" id="imageReg">
              </div>-->
              <div class="col s8 right-align">
                <h4 class="light white-text">Cadastrar Paciente</h4>
              </div>
            </div>

	<div class="erro_cadastro">Erro no cadastro dos dados</div>

     <div class="form-body">
              <div class="row">
                <div class="input-field col s12">
                  <i class="material-icons prefix">face</i>
                  <asp:TextBox ID="txt_nome" runat="server" placeholder="Username"  required="true" name="nome"></asp:TextBox>                  
                </div>
              </div>
            
             <div class="row">
                <div class="input-field col s12">
                  <i class="material-icons prefix">assignment_ind</i>
                  <asp:TextBox ID="txt_cpf" runat="server" placeholder="CPF" required="true"></asp:TextBox>                  
                </div>
              </div>


              <div class="row">
                <div class="input-field col s12">
                  <i class="material-icons prefix">email</i>
                  <asp:TextBox ID="txt_email" runat="server" MaxLength="40" placeholder="Email" required="true" TextMode="Email"></asp:TextBox>
                </div>
              </div>

              <div class="row">
                <div class="input-field col s12">
                  <i class="material-icons prefix">lock</i>
                   <asp:TextBox ID="txt_senha" runat="server" TextMode="Password" MaxLength="22" placeholder="Password" required="true"></asp:TextBox>
                </div>
              </div>

            <div class="row margin">

                <div class="input-field col s6">
                  <i class="material-icons prefix">phone</i>            
                  <asp:TextBox ID="txt_tel" runat="server" TextMode="Phone" MaxLength="12" placeholder="Telefone" required="true"></asp:TextBox>
                </div>

                <div class="input-field col s6">
                  <i class="material-icons prefix">phone</i>
                  <asp:TextBox ID="txt_telresidencial" runat="server" TextMode="Phone" placeholder="Tel Residencial" MaxLength="12" required="true"></asp:TextBox>
               </div>
             </div>


        <div class="row margin">
            <div class="input-field col s12">   
                <i class="material-icons prefix">room</i>
                <asp:TextBox ID="txt_endereco" runat="server" MaxLength="30" placeholder="Endereço" required="true"></asp:TextBox>
            </div>
        </div>


    <!--=======================FILEEEEEEEEEEEEE=========================================-->
       <div class="row margin">
            <div class="input-field col s12">   
                <i class="material-icons prefix">add_a_photo</i>
                <asp:TextBox ID="txt_imagem" runat="server" placeholder="C:\coala.jpg" required="true" TextMode="Url"></asp:TextBox>
            </div>
        </div>
    <!--==============================DATAAA===========================================-->
    <div class="row margin">
        <div class="input-field col s12">
            <i class="material-icons prefix">date_range</i>
            <asp:TextBox ID="txt_dataNascimento" runat="server" class="datepicker" placeholder="Data de nascimento" required="true"></asp:TextBox> 
        </div>
    </div>
    <!--=========================================================================================-->
	<div class="row">
		<div class="input-field col s12">             
			<asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
		</div>
	</div>

    <div class="row">
        <div class="input-field col s12">              
            <asp:Button ID="btnRegister" runat="server" Text="Register Now" class="btn-large waves-effect waves-light col s12" OnClick="btnRegister_Click"/>
        </div>
       <!--<div class="input-field col s12">
            <p class="center medium-small sign-up">Already registered? <a href="Sign.aspx">Login</a></p>
        </div>-->
    </div>

    </div>
  <!-- </form>-->
  </div>
 </div>
</div>
    <!-- container end -->
  </main>
  <!-- Main End -->
  <!--=======================================SCRIPT========================================== -->
    <script>
         document.addEventListener('DOMContentLoaded', function () {
             var elems = document.querySelectorAll('.datepicker');
             var instances = M.Datepicker.init(elems, {
                 format: 'dd/mm/yyyy',
                 showClearBtn: true
             });
         });
         
    </script>
    <asp:Literal ID="Literal1" runat="server">
    </asp:Literal>
</asp:Content>
