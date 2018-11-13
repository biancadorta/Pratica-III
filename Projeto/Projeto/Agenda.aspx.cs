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
    public partial class Agenda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*DateTime date = DateTime.Now;
            //txtData.Text = date.ToString("dd/MM/yyyy");
            Session["data"] = date.ToString("dd/MM/yyyy");
            if (Session["email"] != null)
            {
                string emailMedico = (string)Session["email"];
                String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig

                //Instanciar a classe Conexao para uso de seus metodos
                conexaoBD conexao = new conexaoBD();
                conexao.Connection(conString);
                conexao.abrirConexao();

                string retorno = "select name from medico where email='"+emailMedico+"'";

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand(retorno, con);
                con.Open();
                string nomeMedico = (String)(cmd.ExecuteScalar());
                //txtNomeMedico.Text = nomeMedico;

                Session["emailMedico"] = emailMedico;
                Session["nomeMedico"] = nomeMedico;
                //Response.Write("<script>alert('email é: " +emailMedico+ "e nome medico:"+nomeMedico+"')</script>");
            }*/
        }

        protected void gv_agenda_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}