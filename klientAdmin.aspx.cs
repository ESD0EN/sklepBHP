using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class klient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDodajKlienta_Click(object sender, EventArgs e)
        {
            string imie = txtImie.Text;
            string nazwisko = txtNazwisko.Text;
            string email = txtAdresEmail.Text;
            string haslo = txtHaslo.Text;
            string rola = rolaDropDownList.Text.Trim();

            klientSqlDataSource.InsertParameters["Imie"].DefaultValue = imie;
            klientSqlDataSource.InsertParameters["Nazwisko"].DefaultValue = nazwisko;
            klientSqlDataSource.InsertParameters["Haslo"].DefaultValue = haslo;
            klientSqlDataSource.InsertParameters["Email"].DefaultValue = email;
            klientSqlDataSource.InsertParameters["Rola"].DefaultValue = rola;

            klientSqlDataSource.Insert();

            klientGridView.DataBind();
            clearTextBox();
        }
        void clearTextBox()
        {
            txtImie.Text = null;
            txtNazwisko.Text = null;
            txtHaslo.Text = null;
            txtAdresEmail.Text = null;
            rolaDropDownList.SelectedIndex = 0;
        }
    }
}