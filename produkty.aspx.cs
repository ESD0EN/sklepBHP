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
            string marka = txtMarka.Text;
            string kategoria = txtKategoria.Text;
            string cena = txtCena.Text;
            string stanmag = txtStanMagazynowy.Text;

            produktySqlDataSource.InsertParameters["Nazwa"].DefaultValue = nazwa;
            produktySqlDataSource.InsertParameters["Opis"].DefaultValue = opis;
            produktySqlDataSource.InsertParameters["Marka"].DefaultValue = marka;
            produktySqlDataSource.InsertParameters["Kategoria"].DefaultValue = kategoria;
            produktySqlDataSource.InsertParameters["Cena"].DefaultValue = cena;
            produktySqlDataSource.InsertParameters["Stan_magazynowy"].DefaultValue = stanmag;

            produktySqlDataSource.Insert();

            produktyGridView.DataBind();

            clearTextBox();
        }
        void clearTextBox()
        {
            txtNazwa.Text = null;
            txtOpis.Text = null;
            txtMarka.Text = null;
            txtKategoria.Text = null;
            txtCena.Text = null;
            txtStanMagazynowy.Text = null;
        }
    }
}