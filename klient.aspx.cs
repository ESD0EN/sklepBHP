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
            string nrtel = txtNumerTelefonu.Text;
            string email = txtAdresEmail.Text;
            int idadres = ddlAdresy.SelectedIndex;

            klientSqlDataSource.InsertParameters["ID_adres_klienta"].DefaultValue = idadres.ToString();
            klientSqlDataSource.InsertParameters["Imie"].DefaultValue = imie;
            klientSqlDataSource.InsertParameters["Nazwisko"].DefaultValue = nazwisko;
            klientSqlDataSource.InsertParameters["Numer_telefonu"].DefaultValue = nrtel;
            klientSqlDataSource.InsertParameters["Adres_email"].DefaultValue = email;

            klientSqlDataSource.Insert();

            klientGridView.DataBind();
            clearTextBox();
        }
        void clearTextBox()
        {
            txtImie.Text = null;
            txtNazwisko.Text = null;
            txtNumerTelefonu.Text = null;
            txtAdresEmail.Text = null;
        }
    }
}