using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dodajButton_Click(object sender, EventArgs e)
        {
            string nazwa = txtNazwa.Text;
            string opis = txtOpis.Text;
            int kategoria = katDropDownList.SelectedIndex;
            string cena = txtCena.Text;
            string stanmag = txtStanMagazynowy.Text;

            produktySqlDataSource.InsertParameters["Nazwa"].DefaultValue = nazwa;
            produktySqlDataSource.InsertParameters["Opis"].DefaultValue = opis;
            produktySqlDataSource.InsertParameters["Kategoria_ID"].DefaultValue = kategoria.ToString();
            produktySqlDataSource.InsertParameters["Cena"].DefaultValue = cena;
            produktySqlDataSource.InsertParameters["Dostepnosc"].DefaultValue = stanmag;

            produktySqlDataSource.Insert();

            produktyGridView.DataBind();

            clearTextBox();
        }
        void clearTextBox()
        {
            txtNazwa.Text = null;
            txtOpis.Text = null;
            katDropDownList.SelectedIndex = 0;
            txtCena.Text = null;
            txtStanMagazynowy.Text = null;
        }
    }
}