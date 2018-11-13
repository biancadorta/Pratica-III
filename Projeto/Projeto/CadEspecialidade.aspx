<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_m.Master" AutoEventWireup="true" CodeBehind="CadEspecialidade.aspx.cs" Inherits="Projeto.CadEspecialidade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<main class="valign-wrapper">
    <div class="container valign"> 
		<div class="form-body">
			<div class="row offset-s6">
				<div class="input-field col s6 offset-s4">
					<i class="material-icons prefix">add_circle</i>
					<asp:TextBox ID="txt_especialidade" runat="server" placeholder="especialidade" required="true"></asp:TextBox>                  
				</div>			
			</div>

			<!--<div class="row">
				<div class="input-field col s12 offset-s8">             
					<asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="#F93F2B"></asp:Label>
				</div>
			</div>-->	

			<div class="row">
				<div class="input-field col s3 offset-s6">              
					<asp:Button ID="btnRegister" runat="server" Text="Cadastrar" class="btn btn-primary" OnClick="btnRegister_Click" style="background: yellowgreen;"/>
				</div>       
			</div>
		</div>
	</div>
</main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
