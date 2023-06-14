using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDodajZamowienie_Click(object sender, EventArgs e)
        {
            string data = txtDataZamowienia.Text;
            string status = ddlStatusZamowienia.Text.Trim();
            int idklient = ddlKlienci.SelectedIndex + 1;

            zamowieniaSqlDataSource.InsertParameters["ID_klient"].DefaultValue = idklient.ToString();
            zamowieniaSqlDataSource.InsertParameters["Data_zamowienia"].DefaultValue = data;
            zamowieniaSqlDataSource.InsertParameters["Status_zamowienia"].DefaultValue = status;

            zamowieniaSqlDataSource.Insert();

            zamowieniaGridView.DataBind();
            ddlKlienci.SelectedIndex = -1;
            txtDataZamowienia.Text = null;
        }
    }
}