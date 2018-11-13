<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="Anotacao.aspx.cs" Inherits="Projeto.Anotacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main class="valign-wrapper">
        <div class="card card-panel" style="background:white; height: 740px; width: 400px; left:45%">     
            <!--===============Nomes==============================================-->
            <div class="form-body">
                <textarea id="temDiagnostico" Visible="False" name="temDiagnostico" style="display:none;">1</textarea>
                <div class="row">
                    <div class="input-field col s6 offset-s1"><!--offset-s4-->
                        <asp:DropDownList ID="ddlNome" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="nome">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="select nome from agenda where data = @data and nomeMedico=@nome and emailMedico=@email">
                            <SelectParameters>
                                <asp:SessionParameter Name="data" SessionField="data" />
                                <asp:SessionParameter Name="nome" SessionField="nomeMedico" />
                                <asp:SessionParameter Name="email" SessionField="emailMedico" />
                            </SelectParameters>
                        </asp:SqlDataSource>                                                          
                   </div>               
             <!--===============Hora==============================================-->                
                    <div class="input-field col s4">                       
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
            <!--===============Sintomas==============================================-->    
               <div class="row">
                    <div class="input-field col s6">
						<label>Sintomas</label><br />
						<textarea id="txtSintomas" cols="80" rows="1" placeholder="Sintomas" style="margin: 0px; width: 208px; height: 38px; resize: none" name="sintomas" required></textarea>						
                    </div>                	
                </div>                
               
            <!--===============Resultado exames(nao obrigatorio)================================================
                <div class="row">
                    <div class="input-field col s6 offset-s2">                           
						<label>Exames</label><br/>
						<textarea id="TxtExames" cols="80" rows="2" placeholder="Resultado dos exames" style="margin: 0px; width: 208px; height: 38px;resize: none" name="resultadoExames"></textarea>
                    </div>
                </div>-->
            <!--===============Diagnostico==============================================-->    
               <label><h6>Diagnóstico</h6></label>
               <div class="row">
                    <div class="input-field col s5">                                  
                        <!--<asp:CheckBox ID="cbkDiag" runat="server" Text="Em andamento..." CssClass="filled-in" Visible="true"/>-->
                        <p>
                        <label>
                          <input class="with-gap" type="radio" onclick="desabilitar();"/>
                          <span>Em andamento</span>
                        </label>
                      </p>
                    </div> 
                   <label>Exames</label>
                   <div class="input-field col s7">                    
                       <asp:DropDownList ID="ddlExames" runat="server" DataSourceID="SqlDataSource3" DataTextField="nomeExame" DataValueField="nomeExame">
                       </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [nomeExame] FROM [exame]"></asp:SqlDataSource>
                    </div>
                </div> 

                <div class="row"  id="teste">
                    <label>Diagnosticar</label>
                    <div class="input-field col s10" > 
                        <asp:DropDownList ID="ddlDiagnosticos" runat="server" DataSourceID="SqlDataSource4" DataTextField="Diagnostico"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [Diagnostico] FROM [diagnostico]"></asp:SqlDataSource>
                    </div>
                </div>
            <!--================Medicamentos=======================================-->
                <div class="row">
                    <div class="input-field col s6">                         
						<label>Medicamentos</label><br />
						<textarea id="TxtMedicamentos" cols="80" rows="1" placeholder="Medicamentos" style="margin: 0px; width: 208px; height: 38px; resize: none" name="medicamentos" required></textarea>						
                    </div>
                </div>
            <!--================Observacoes(nao obrigatorio)=====================-->
                 <div class="row">
                    <div class="input-field col s6">
						<label>Observações</label><br />
						<textarea id="TxtObs" cols="80" rows="1" placeholder="Observações" style="margin: 0px; width: 208px; height: 38px; resize: none" name="observacao"></textarea>						
                    </div>
                </div>
            <!--==============BUTTON==========================-->
                <div class="row">
                    <div class="input-field col s6 offset-s4">
                           <asp:Button ID="btnAnotar" runat="server" Text="Registrar" class="btn btn-primary" Backcolor="#1eac85"/>              
                    </div>
                </div>          
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems, {});
        });

        function desabilitar() {
            $(document).ready(function () {
                $("#teste").hide();
            });
            var div = document.getElementById("temDiagnostico");
            document.getElementById("temDiagnostico").value = ""; 
            div.innerHTML = 0;
        }      
        
    </script>
</asp:Content>
