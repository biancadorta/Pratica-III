<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="Projeto.Status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="row">
    <div class="col s20 m6">
      <div class="card card-panel" style="height: 400px; width: 400px; left: 90%">
        <div class="card-content white-text">
          <span class="card-title">Status da consulta</span>         
			<div class="row">
                <div class="input-field col s6">
                    <asp:DropDownList ID="ddlNome" runat="server" AutoPostBack="True" DataTextField="nome" DataValueField="nome" DataSourceID="SqlDataSource1">
			        </asp:DropDownList>
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="select nome from agenda where data = @data and nomeMedico=@nome and emailMedico=@email">
                            <SelectParameters>
                                <asp:SessionParameter Name="data" SessionField="data" />
                                <asp:SessionParameter Name="nome" SessionField="nomeMedico" />
                                <asp:SessionParameter Name="email" SessionField="emailMedico" />
                            </SelectParameters>
                        </asp:SqlDataSource>                                                       
				</div>

				<div class="input-field col s6">
					<asp:DropDownList ID="ddlHora" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="hora" DataValueField="hora">
                    </asp:DropDownList>
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="select hora from agenda where nome = @nome and data=@data and emailMedico=@email">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlNome" Name="nome" PropertyName="SelectedValue"/>
                                <asp:SessionParameter Name="data" SessionField="data" />
                                <asp:SessionParameter Name="email" SessionField="emailMedico" />
                            </SelectParameters>
                        </asp:SqlDataSource>                       
				</div>
			</div> 
			<div class="row">
				<div class="input-field col s6 offset-s3">
					<asp:DropDownList ID="ddlSituacao" runat="server" AutoPostBack="True">
						<asp:ListItem>OCORRIDA</asp:ListItem>
						<asp:ListItem>CANCELADA</asp:ListItem>
					</asp:DropDownList>
				</div>				
			</div>
			<div class="row">
                    <div class="input-field col s6 offset-s4">
                           <asp:Button ID="btnAnotar" runat="server" Text="Registrar" class="btn btn-primary" Backcolor="#1eac85" OnClick="btnAnotar_Click"/>              
                    </div>
            </div> 
	   </div>
     </div>
	</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
	<script>
		document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems, {});
        });
	</script>
</asp:Content>
