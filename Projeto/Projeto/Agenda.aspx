<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="Projeto.Agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><div class="card-panel" style="width: 500px;">
    <asp:GridView class="striped" ID="gv_agenda" runat="server" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="gv_agenda_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="duracaoConsulta" HeaderText="Duração" SortExpression="duracaoConsulta" />
            <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora"/>
            <asp:BoundField DataField="nomeMedico" HeaderText="Medico" SortExpression="nomeMedico" />
            <asp:BoundField DataField="nome" HeaderText="Paciente" SortExpression="nome" />
            <asp:TemplateField ShowHeader="False"></asp:TemplateField>
        </Columns>
    </asp:GridView>     
    </div></center>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [duracaoConsulta], [hora], [nomeMedico], [nome] FROM [agenda] WHERE nomeMedico=@nome AND data=@data">
        <SelectParameters>
            <asp:SessionParameter Name="nome" SessionField="nomeMedico" />
            <asp:SessionParameter Name="data" SessionField="data"/>
        </SelectParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT nomeMedico, nome, data, hora, duracaoConsulta FROM agenda WHERE (data = ' 15/10/2018') AND (nomeMedico = 'Joao Lucas')">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
