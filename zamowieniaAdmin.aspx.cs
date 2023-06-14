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
            int idklient = Int32.Parse(ddlKlienci.Text.Trim());

            zamowieniaSqlDataSource.InsertParameters["Uzytkownik_ID"].DefaultValue = idklient.ToString();
            zamowieniaSqlDataSource.InsertParameters["Data"].DefaultValue = data;
            zamowieniaSqlDataSource.InsertParameters["Status"].DefaultValue = status;

            zamowieniaSqlDataSource.Insert();

            zamowieniaGridView.DataBind();
            ddlStatusZamowienia.SelectedIndex = 0;
            ddlKlienci.SelectedIndex = 0;
            txtDataZamowienia.Text = null;
        }
    }
}