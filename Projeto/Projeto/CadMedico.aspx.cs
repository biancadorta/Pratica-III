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
    public partial class CadMedico : System.Web.UI.Page
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
            //ver se ja existe um medico com aquele email
            string con = "select email from medico where email ='" + txt_email.Text + "'";
            int ret = conexao.executarConsulta(con);

            if (txt_crm.Text.Equals("") || txt_email.Text.Equals("") || txt_nome.Text.Equals("") || txt_senha.Text.Equals("") || txt_tel.Text.Equals(""))
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Preencha todos os campos.";
                return;
            }

            else if (txt_telresidencial.Text.Equals("") || txt_dataNascimento.Text.Equals("") || txt_imagem.Text.Equals("")){
                lblMessage.Visible = true;
                lblMessage.Text = "Preencha todos os campos.";
                return;
            }

            if (ret == 0) //quer dizer que nao existe 
            {
                String insert = "insert into values('"+txt_email.Text+"','"+txt_nome.Text+"','"+txt_senha.Text+"','"+txt_telresidencial.Text+"','"+txt_tel.Text+"','"+txt_dataNascimento.Text+
                                                    "','"+txt_crm.Text+"','"+txt_imagem.Text+"',"+ddl_espec.SelectedValue+")";

                int result = conexao.ExecutaInsUpDel(insert);
                Response.Write("<script>alert('Cadastrado.');</script>");
                //limpar os campos
                txt_nome.Text = "";
                txt_crm.Text = "";
                txt_email.Text = "";
                txt_senha.Text = "";
                txt_tel.Text = "";
                txt_telresidencial.Text = "";
                txt_imagem.Text = "";
                txt_dataNascimento.Text = "";
            }
            else //mostrar mensagem de erro         
            {
                Response.Write("<script>alert('Já existe um medico com esse email.');</script>");
            }
        }
    }
}