using Projeto.App_Start;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto
{
    public partial class Status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAnotar_Click(object sender, EventArgs e)
        {

            String con = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig
            SqlConnection connection = new SqlConnection(con);
            string ret = "select codConsulta from Agenda where nome='"+ddlNome.SelectedItem+"'and hora='"+ddlHora.SelectedItem+"'";
            SqlCommand cmd = new SqlCommand(ret, connection);
            connection.Open();
            int idConsulta = (int)(cmd.ExecuteScalar());

            conexaoBD conexao = new conexaoBD();
            conexao.Connection(con);
            conexao.abrirConexao();
            string str = "insert into status values("+idConsulta+","+ddlSituacao.SelectedIndex+")";
            int i = conexao.ExecutaInsUpDel(str);
            if (i == 1)//deu certo a insercao
                Response.Write("<script>alert('Sucesso ao cadastrar o status.');</script>");
            else
                Response.Write("<script>alert('Erro ao cadastrar o status.');</script>");
        }
    }
}