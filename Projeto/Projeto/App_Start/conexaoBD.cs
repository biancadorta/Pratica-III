using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using System.Data.SqlClient;
using System.Data;

[assembly: OwinStartup(typeof(Projeto.App_Start.conexaoBD))]

namespace Projeto.App_Start
{
    public class conexaoBD
    {
        private SqlConnection con;
        private String ConnectionString { get; set; }
        
        public void Configuration(IAppBuilder app)
        {
            // Para obter mais informações sobre como configurar seu aplicativo, visite https://go.microsoft.com/fwlink/?LinkID=316888
        }

        //Setando a string de conexao
        public void Connection(String connection)
        {
            this.ConnectionString = connection;
        }

        public void abrirConexao(){

            if (string.IsNullOrEmpty(this.ConnectionString)) //se nao atribuiu o valor a String
                throw new Exception("Erro na atribuição da String de conexão! - Método abrir");

            if (con == null) //nao foi referenciado, ou seja, nao foi instaciado
            {
                con = new SqlConnection();
                con.ConnectionString = this.ConnectionString;
            }
            con.Open();  // abrindo a conexao com o BD
        }

        public void fecharConexao()
        {
            con.Close();
        }

        public int ExecutaInsUpDel(String sql)
        {
            // verificando se o sql veio preenchido
            if (String.IsNullOrEmpty(sql)) throw
                  new Exception("A query de consulta veio vazia - ExecutaInsUpDel()");

            // verificar se a conexao está fechada
            if ((con == null) || (con.State == ConnectionState.Closed))
                throw new Exception("A conexao com BD está fechada! ExecutaInsUpDel()");

            SqlCommand comando = new SqlCommand();
            comando.Connection = this.con;
            comando.CommandText = sql;
            try
            {
                int retorno;
                retorno = (int)comando.ExecuteNonQuery(); //ExecuteNonQuery retorna a quantidade de linhas afetadas
                return retorno;
            }
            catch(SqlException e)
            {
                // problema na execução do INSERT, UPDATE ou DELETE
                return -1;
            }
        }

        public int executarConsulta(String sql)
        {
            //verificar se a string vazia esta vazia
            if(string.IsNullOrEmpty(sql))
                throw new Exception("String para consulta nao fornecida");

            //verificar se conexao foi aberta ou fechada 
            if ((con == null) || (con.State == ConnectionState.Closed))
                throw new Exception("Conexao nao foi instanciada ou esta fechada!");

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = this.con;
            cmd.CommandText = sql;  //atribuimos o comando ao text
            try
            {
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);             
                if (ds.Tables[0].Rows.Count == 1) //achou
                    return 1; //sucesso ao executar a consulta
                else //nao achou
                    return 0; 
            }
            catch
            {
                return -1; //Erro ao executar a consulta
            }
            
        }


    }
}
