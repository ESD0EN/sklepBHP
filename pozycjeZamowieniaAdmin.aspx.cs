using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class position : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDodajPozycje_Click(object sender, EventArgs e)
        {
            string ilosc = txtIloscZamowionych.Text;
            int zamowienieID = ddlZamowienie.SelectedIndex + 1;
            int produktID = ddlProdukt.SelectedIndex + 1;

            pozycjeSqlDataSource.InsertParameters["ID_zamowienia"].DefaultValue = zamowienieID.ToString();
            pozycjeSqlDataSource.InsertParameters["ID_produkt"].DefaultValue = produktID.ToString();
            pozycjeSqlDataSource.InsertParameters["Ilosc_zamowionych_produktow"].DefaultValue = ilosc;

            pozycjeSqlDataSource.Insert();

            pozycjeGridView.DataBind();

            txtIloscZamowionych.Text = null;
            ddlProdukt.SelectedIndex = -1;
            ddlZamowienie.SelectedIndex = -1;
        }
    }
}