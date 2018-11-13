<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_m.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="Projeto.Email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<!--<h2><label id="lblData"></label></h2>-->
	<div style="left:200px;">
		<asp:Label ID="lblData" runat="server" visible="false"></asp:Label>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
<script>
	var data = new Date();
	var dia = data.getDate();
	var mes = (data.getMonth()+1); //+1 porque comeca com 0 
	var ano = data.getFullYear();
	var str = dia + '/' + mes + '/' + ano;
	alert('Hoje é: ' + str);
	//document.getElementById("lblData").value = str;
</script>
</asp:Content>
