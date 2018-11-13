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
    public partial class Sign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            //Associar o valor da string de conexao do webConfig a esta variavel

            String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig

            //Instanciar a classe Conexao para uso de seus metodos
            conexaoBD conexao = new conexaoBD();
            conexao.Connection(conString);
            conexao.abrirConexao();

            //Fazer validacoes dos campos
            if ((txtLogin.Text.Equals("")) || (txtSenha.Text.Equals("")))
            {
                lblMensagem.Attributes["style"] = "color:rgba(255, 87, 34, 0.75); font:bold; text-align:center; font-size: 16px";
                lblMensagem.Text = "Por favor, preencha todos os campos.";
                lblMensagem.Visible = true;
            }
            else
            {
                //Vamos consultar se ha este usuario no BD
                //Mas ha 3 possibilidades do usuario ser: Um medico, um paciente ou a secretaria
                //Para isso, vamos testar em todas as tabelas se ha tal usuario, no final caso todas as respostas da consulta sejam -1, sabemos que
                //de fato nao ha tal usuario, caso contrario redirecionamos para a pagina adequada
                Session["email"] = txtLogin.Text;
                int resMed, resPac, resSec = 0;
                String conMed = "select * from Medico where email='" + txtLogin.Text + "'and senha='" + txtSenha.Text + "'";
                resMed = conexao.executarConsulta(conMed);
                if (resMed == 1) //achou na tabela medico, redireciono para a pagina de medico
                {
                    //Criar variavel de sessao
                    lblMensagem.Attributes["style"] = "color:rgba(255, 87, 34, 0.75); font:bold; text-align:center; font-size: 16px;";
                    lblMensagem.Text = "ACESSO permitido.";
                    lblMensagem.Visible = true;
                    Session["email"] = txtLogin.Text;

                    DateTime date = DateTime.Now;                   
                    Session["data"] = date.ToString("dd/MM/yyyy");
                    if (Session["email"] != null)
                    {
                        string emailMedico = (string)Session["email"];
                        String con = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString; //parametro de Conne..e o valor atribuido na tag do webConfig
                        string retorno = "select name from medico where email='" + emailMedico + "'";

                        SqlConnection connection = new SqlConnection(con);
                        SqlCommand cmd = new SqlCommand(retorno, connection);
                        connection.Open();
                        string nomeMedico = (String)(cmd.ExecuteScalar());                      
                        Session["emailMedico"] = emailMedico;
                        Session["nomeMedico"] = nomeMedico;

                    }
                    Response.Redirect("Home_medico.aspx");
                    //return;
                }


                String conPac = "select * from Paciente where email='" + txtLogin.Text + "'and senha='" + txtSenha.Text + "'";
                resPac = conexao.executarConsulta(conPac);
                if (resPac == 1) //achou na tabela paciente, redireciono para a pagina do paciente
                {
                    lblMensagem.Attributes["style"] = "color:rgba(255, 87, 34, 0.75); font:bold; text-align:center; font-size: 16px;";
                    lblMensagem.Text = "ACESSO permitido.";
                    lblMensagem.Visible = true;
                    //Response.Redirect("admin.aspx");
                    //return;
                }

                String conSec = "select * from Secretaria where email='" + txtLogin.Text + "'and senha='" + txtSenha.Text + "'";
                resSec = conexao.executarConsulta(conSec);
                if (resSec == 1) //achou na tabela secretaria, redireciono para a pagina da secretaria
                {
                    lblMensagem.Visible = true;
                    lblMensagem.Attributes["style"] = "color:rgba(255, 87, 34, 0.75); font:bold; text-align:center; font-size: 16px;";
                    lblMensagem.Text = "ACESSO permitido.";
                    Response.Redirect("admin.aspx");
                    //return;
                }

                //Chegando aqui nao achou em nenhuma tabela, logo nao esta cadastrado
                if ((resPac == 0) && (resMed == 0) && (resSec == 0))
                {
                    lblMensagem.Attributes["style"] = "color:rgba(255, 87, 34, 0.75); font:bold; text-align:center; font-size: 16px;";
                    lblMensagem.Text = "ACESSO negado, não esta cadastrado.";
                    lblMensagem.Visible = true;
                }
            }
        }
    }
}