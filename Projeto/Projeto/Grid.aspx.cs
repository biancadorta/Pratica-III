using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using Projeto.App_Start;

namespace Projeto
{
    public partial class Grid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_agendar_Click(object sender, EventArgs e)
        {
            String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig

            //Instanciar a classe Conexao para uso de seus metodos
            conexaoBD conexao = new conexaoBD();
            conexao.Connection(conString);
            conexao.abrirConexao();

            string retorno = "select nome from paciente where email='"+ddl_email.SelectedItem+"'";

            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand(retorno, con);
            con.Open();
            string nome = (String)(cmd.ExecuteScalar());

            string str = "select email from Medico where codEspecialidade="+ddl_espec.SelectedValue+"and codMedico="+ddl_medico.SelectedValue+"";
            SqlConnection con2 = new SqlConnection(conString);
            SqlCommand cmd2 = new SqlCommand(str, con2);
            con2.Open();
            string emailMedico = (String)(cmd2.ExecuteScalar());

            string sql = "insert into agenda values(" + ddl_email.SelectedValue + "," + ddl_espec.SelectedValue + ",'" + txt_dataConsulta.Text
                          + "'," + ddl_duracion.Text + ",'" + txt_horaConsulta.Text + "','" + ddl_medico.SelectedItem.Text+"','"+nome+"',' ','"+emailMedico+"')";

            int ret = conexao.ExecutaInsUpDel(sql);
            if (ret > 0)
            {
                Response.Write("<script>alert('sucesso no cadastro da consulta.');</script>");
                //limpar os campos
                txt_dataConsulta.Text = "";
                txt_horaConsulta.Text = "";                
            }
            else {
                Response.Write("<script>alert('erro no cadastro da consulta.');</script>");
            }

        }
    }
}