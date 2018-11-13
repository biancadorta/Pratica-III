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
    public partial class Anotacao : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAnotar_Click(object sender, EventArgs e)
        {
            string sintomas     = Request["sintomas"];
            string medicamentos = Request["medicamentos"];
            string obs          = Request["observacao"];
            string diag         = Request["temDiagnostico"];

            String con = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig
            string retorno = "select codConsulta from agenda where nome='" + ddlNome.SelectedItem + "' and hora='" + ddlHora.SelectedItem + "'";

            SqlConnection connection = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand(retorno, connection);
            connection.Open();
            int idConsulta = (int)(cmd.ExecuteScalar());

            if (diag.Equals("1"))
            { //tem diagnostico e nao tem exames
                if (!(medicamentos.Equals("") && sintomas.Equals("")))
                {                
                    //Instanciar a classe Conexao para uso de seus metodos
                    conexaoBD conexao = new conexaoBD();
                    conexao.Connection(con);
                    conexao.abrirConexao();
                    string str = "insert into anotacao values(" + idConsulta + ",'" + sintomas + "','" +ddlDiagnosticos.SelectedItem+ "','" + medicamentos + "',' ','"+ obs + "')";
                    int ret = conexao.ExecutaInsUpDel(str);
                    if (ret == 1)
                        Response.Write("<script>alert('Sucesso no cadastro das anotações!!!');</script>");
                    else
                        Response.Write("<script>alert('Erro no cadastro das anotações.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Preencha os campos.');</script>");
                }
            }
            else {//nao tem diagnostico, logo no diagnostico inserimos "Em andamento..."
                  //Instanciar a classe Conexao para uso de seus metodos
                conexaoBD conexao = new conexaoBD();
                conexao.Connection(con);
                conexao.abrirConexao();
                string str2 = "insert into anotacao values(" + idConsulta + ",'" + sintomas + "','EM ANDAMENTO...','" + ddlExames.SelectedItem+"','"+medicamentos+"','"+obs+"')";
                int ret = conexao.ExecutaInsUpDel(str2);
                if (ret == 1)
                    Response.Write("<script>alert('Sucesso no cadastro das anotações!!!');</script>");
                else
                    Response.Write("<script>alert('Erro no cadastro das anotações.');</script>");
            }
        }

        protected void ckbEmAndamento_CheckedChanged(object sender, EventArgs e)
        {
        }
    }
}