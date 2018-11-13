<%@ Page Title="" Language="C#" MasterPageFile="~/Modelo.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Projeto.Home2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="slider">
    <ul class="slides">
      <li>
        <img src="image/idoso.jpg"/>
        <div class="caption center-align">
          <h3>Atendimento a todas as idades!</h3>
          <h5 class="light grey-text text-lighten-3">Contamos com um ambiente agradável e confortável.</h5>
        </div>
      </li>
      <li>
        <img src="image/clinicaSite.jpg"/>
        <div class="caption left-align">
          <h3>Contamos com o melhor dos equipamentos.</h3>
          <h5 class="light grey-text text-lighten-3">Tudo para você e seu bem estar.</h5>
        </div>
      </li>
    </ul>
  </div>

<br /><br /><br /><br /><br /><br /><br /><br /><br />

<!--============================Script===============================================-->
 <script src="materialize/js/jquery-3.3.1.slim.min.js"></script>
 <script src="materialize/js/materialize.min.js"></script>
 <script>
    $(document).ready(function () {
        $('.slider').slider();
    });

    function carregar(pagina) {
        $("#conteudo").load(pagina);
    }
  </script>
</asp:Content>
