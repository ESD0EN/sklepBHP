using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class rejestracja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRejestracja_Click(object sender, EventArgs e)
        {
            string imie = txtImie.Text;
            string nazwisko = txtNazwisko.Text;
            string email = txtEmail.Text;
            string haslo = txtHaslo.Text;
            string rola = "user";

            rejSqlDataSource.InsertParameters["Imie"].DefaultValue = imie;
            rejSqlDataSource.InsertParameters["Nazwisko"].DefaultValue = nazwisko;
            rejSqlDataSource.InsertParameters["Email"].DefaultValue = email;
            rejSqlDataSource.InsertParameters["Haslo"].DefaultValue = haslo;
            rejSqlDataSource.InsertParameters["Rola"].DefaultValue = rola;

            rejSqlDataSource.Insert();
            rejSqlDataSource.DataBind();

            clearTxt();

            Response.Redirect("logowanie.aspx");
        }
        protected void clearTxt()
        {
            txtImie.Text = string.Empty;
            txtNazwisko.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtHaslo.Text = string.Empty;
        }
    }
}