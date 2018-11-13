<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_m.Master" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="Projeto.Grid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="valign-wrapper">
        <div class="container valign">     
            <!--===============EMAIL==============================================-->
            <div class="form-body">
                <div class="row">
                    <div class="input-field col s6 offset-s4">
                        <i class="material-icons prefix">email</i>                       
                        <asp:DropDownList ID="ddl_email" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="email" DataValueField="codPaciente" required="true">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" Connecti
                            .onString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [codPaciente], [email] FROM [Paciente]"></asp:SqlDataSource>
                    </div>
                </div>
             <!--===============ESPECIALIDADESSSS==============================================-->
                <div class="row margin">
                    <div class="input-field col s3 offset-s4">
                        <asp:DropDownList ID="ddl_espec" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="especialidade" DataValueField="codEspec" ForeColor="#0033CC" required="true">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [espec]"></asp:SqlDataSource>                        
                    </div>                
            <!--===============Medicos==============================================-->                
                    <div class="input-field col s3">
                        <asp:DropDownList ID="ddl_medico" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="codMedico" required="true">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select codMedico, name from Medico where codEspecialidade=@codEspec">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_espec" Name="codEspec" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            <!--===============DATA================================================-->
                <div class="row margin">
                    <div class="input-field col s6 offset-s4">
                        <i class="material-icons prefix">date_range</i>
                        <asp:TextBox ID="txt_dataConsulta" runat="server" class="datepicker" placeholder="Data da consulta" required="true"></asp:TextBox> 
                    </div>
                </div>
            <!--================HORA=======================================-->
                <div class="row">
                    <div class="input-field col s6 offset-s4">
                        <i class="material-icons prefix">add_alarm</i>
                        <asp:TextBox ID="txt_horaConsulta" runat="server" class="timepicker" required="true"></asp:TextBox>
                    </div>
                </div>

                 <div class="row">
                    <div class="input-field col s6 offset-s4">
                        <label>Duracao</label><br/><br/>
                        <asp:DropDownList ID="ddl_duracion" runat="server" AutoPostBack="True" placeholder="Duracao" required="true">
                            <asp:ListItem Value="1">1 hora</asp:ListItem>
                            <asp:ListItem Value="30">30 min</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                   <div class="row">
                        <div class="input-field col s6 offset-s6">
                            <asp:Button ID="btn_agendar" runat="server" Text="Agendar" class="waves-effect waves-light btn-large" BackColor="#00B789" OnClick="btn_agendar_Click"/>
                        </div>
                    </div>          
            </div>
        </div>
    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server"> 
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
	    document.addEventListener('DOMContentLoaded', function () {
		    var elems = document.querySelectorAll('select');
			var instances = M.FormSelect.init(elems, {});
        });

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.datepicker');
            var instances = M.Datepicker.init(elems, {
                format: 'dd/mm/yyyy',
                showClearBtn: true
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.timepicker');
            var instances = M.Timepicker.init(elems, {
                twelveHour : false
            });
        });       
        
       
    </script>
</asp:Content>
