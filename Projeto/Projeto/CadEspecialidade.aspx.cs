using Projeto.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto
{
    public partial class CadEspecialidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig

            //Instanciar a classe Conexao para uso de seus metodos
            conexaoBD conexao = new conexaoBD();
            conexao.Connection(conString);
            conexao.abrirConexao();

            if (txt_especialidade.Text.Equals("")){
                lblMessage.Visible = true;
                lblMessage.Text = "Preencha o campo de especialidade.";
                return;
            }

            string con = "select especialidade from espec where especialidade ='" + txt_especialidade.Text + "'";
            int ret = conexao.executarConsulta(con);

            if (ret == 0) //quer dizer que nao existe 
            {
                String insert = "insert into espec values('" + txt_especialidade.Text+"')";

                int result = conexao.ExecutaInsUpDel(insert);
                if(result>0)
                    Response.Write("<script>alert('Especialidade cadastrada.');</script>");
                //limpar o campo
                txt_especialidade.Text = "";
            }
            else //mostrar mensagem de erro         
            {
                Response.Write("<script>alert('Já existe essa especialidade.');</script>");
            }
        }
    }
}