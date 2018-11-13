<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="Relatorios.aspx.cs" Inherits="Projeto.Relatorios" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
		<Series>
			<asp:Series Name="Series1" ChartType="StackedColumn" XValueMember="nome"></asp:Series>
		</Series>
		<ChartAreas>
			<asp:ChartArea Name="ChartArea1"></asp:ChartArea>
		</ChartAreas>
	</asp:Chart>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [nomeMedico], [nome] FROM [agenda]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
