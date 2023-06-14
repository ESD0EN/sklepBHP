using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = emailTextBox.Text;
            string password = passwordTextBox.Text;

            string query = "SELECT COUNT(*) FROM Uzytkownicy WHERE Email = @Email AND Haslo = @Haslo";

            loginSqlDataSource.SelectCommand = query;
            loginSqlDataSource.SelectParameters.Clear();
            loginSqlDataSource.SelectParameters.Add("Email", email);
            loginSqlDataSource.SelectParameters.Add("Haslo", password);

            DataView dv = (DataView)loginSqlDataSource.Select(DataSourceSelectArguments.Empty);
            int userCount = Convert.ToInt32(dv.Table.Rows[0][0]);

            if (userCount > 0)
            {
                DataView roleDataView = (DataView)rolaSqlDataSource.Select(DataSourceSelectArguments.Empty);
                string role = roleDataView.Table.Rows[0]["Rola"].ToString();
                if (role == "admin")
                {
                    Response.Redirect("produktyAdmin.aspx");
                }
                else
                {
                    loginLabel.Text = "todo";
                }
                clearTextBox();
            }
            else
            {
                loginLabel.Text = "Nie ma takiego użytkownika";
                clearTextBox();
            }
        }
        protected void clearTextBox()
        {
            emailTextBox.Text = null;
            passwordTextBox.Text = null;
        }
    }
}