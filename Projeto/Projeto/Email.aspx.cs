using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projeto
{
    public partial class Email : System.Web.UI.Page
    { 

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime date = DateTime.Now;
            lblData.Text = date.ToString("dd/MM/yyyy");
            string dia = date.Day.ToString();
            string mes = date.Month.ToString();
            string ano = date.Year.ToString();      
            //string str = dia+ "\" + mes + "\" +ano;

        }
    }
}