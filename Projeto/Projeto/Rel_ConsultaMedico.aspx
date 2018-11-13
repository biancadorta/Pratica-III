<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="Rel_ConsultaMedico.aspx.cs" Inherits="Projeto.Rel_ConsultaMedico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col s20 m6">
      <div class="card card-panel">
          <div class="input-field col s6">
              <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="especialidade" DataValueField="codEspec"></asp:DropDownList>          
	          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT * FROM [espec]">
              </asp:SqlDataSource>
	     </div>
          <div class="input-field col s10">
              <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5">
                  <Series>
                      <asp:Series Name="Series1" XValueMember="codEspec" YValueMembers="QTD"></asp:Series>
                  </Series>
                  <ChartAreas>
                      <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                  </ChartAreas>
              </asp:Chart>
              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT codEspec, count(codConsulta) AS 'QTD' FROM [agenda] WHERE codEspec=@cod and data=@data GROUP BY codEspec">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="DropDownList1" Name="cod" PropertyName="SelectedValue" />
                      <asp:SessionParameter Name="data" SessionField="data" />
                  </SelectParameters>
              </asp:SqlDataSource>              
          </div>
      </div>
    </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">    
</asp:Content>
