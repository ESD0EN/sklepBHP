using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class adress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDodajAdres_Click(object sender, EventArgs e)
        {
            string ulica = txtUlica.Text;
            string nrdom = txtNumerDomu.Text;
            string kodpocz = txtKodPocztowy.Text;
            string miasto = txtMiasto.Text;
            string kraj = txtKraj.Text;

            adresSqlDataSource.InsertParameters["Ulica"].DefaultValue = ulica;
            adresSqlDataSource.InsertParameters["Numer_domu_mieszkania"].DefaultValue = nrdom;
            adresSqlDataSource.InsertParameters["Kod_pocztowy"].DefaultValue = kodpocz;
            adresSqlDataSource.InsertParameters["Miasto"].DefaultValue = miasto;
            adresSqlDataSource.InsertParameters["Kraj"].DefaultValue = kraj;

            adresSqlDataSource.Insert();

            adresGridView.DataBind();

            clearTextBox();
        }
        void clearTextBox()
        {
            txtUlica.Text = null;
            txtNumerDomu.Text = null;
            txtMiasto.Text = null;
            txtKraj.Text = null;
            txtKodPocztowy.Text = null;
        }
    }
}