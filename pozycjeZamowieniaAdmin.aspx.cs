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
            int zamowienieID = Int32.Parse(ddlZamowienie.Text.Trim());
            int produktID = Int32.Parse(ddlProdukt.Text.Trim());

            pozycjeSqlDataSource.InsertParameters["Zamowienie_ID"].DefaultValue = zamowienieID.ToString();
            pozycjeSqlDataSource.InsertParameters["Produkt_ID"].DefaultValue = produktID.ToString();
            pozycjeSqlDataSource.InsertParameters["Ilosc"].DefaultValue = ilosc;

            pozycjeSqlDataSource.Insert();

            pozycjeGridView.DataBind();

            txtIloscZamowionych.Text = null;
            ddlProdukt.SelectedIndex = 0;
            ddlZamowienie.SelectedIndex = 0;
        }
    }
}