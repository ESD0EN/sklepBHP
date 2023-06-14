using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class kategorieAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDodajKategorie_Click(object sender, EventArgs e)
        {
            string kat = txtNazwaKategorii.Text;

            kategorieSqlDataSource.InsertParameters["Nazwa"].DefaultValue = kat;
            kategorieSqlDataSource.Insert();

            kategorieGridView.DataBind();
            txtNazwaKategorii.Text = null;
        }
    }
}