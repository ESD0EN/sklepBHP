using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sklepBHP
{
    public partial class produktyUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void prodGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DodajDoKoszyka")
            {
                int produktID = Convert.ToInt32(e.CommandArgument);

                DodajProduktDoKoszyka(produktID);
            }
        }
        protected void DodajProduktDoKoszyka(int produktID)
        {
            int uzytkownikID = GetUzytkownikID();

            string connectionString = ConfigurationManager.ConnectionStrings["BHPConnectionString"].ConnectionString;
            string selectQuery = "SELECT COUNT(*) FROM Koszyk WHERE Uzytkownik_ID = @UzytkownikID AND Produkt_ID = @ProduktID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                selectCommand.Parameters.AddWithValue("@UzytkownikID", uzytkownikID);
                selectCommand.Parameters.AddWithValue("@ProduktID", produktID);

                int existingCount = (int)selectCommand.ExecuteScalar();

                if (existingCount > 0)
                {
                    string updateQuery = "UPDATE Koszyk SET Ilosc = Ilosc + 1 WHERE Uzytkownik_ID = @UzytkownikID AND Produkt_ID = @ProduktID";
                    SqlCommand updateCommand = new SqlCommand(updateQuery, connection);
                    updateCommand.Parameters.AddWithValue("@UzytkownikID", uzytkownikID);
                    updateCommand.Parameters.AddWithValue("@ProduktID", produktID);
                    updateCommand.ExecuteNonQuery();
                }
                else
                {
                    string insertQuery = "INSERT INTO Koszyk (Uzytkownik_ID, Produkt_ID, Ilosc) VALUES (@UzytkownikID, @ProduktID, 1)";
                    SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
                    insertCommand.Parameters.AddWithValue("@UzytkownikID", uzytkownikID);
                    insertCommand.Parameters.AddWithValue("@ProduktID", produktID);
                    insertCommand.ExecuteNonQuery();
                }
            }
        }

        protected int GetUzytkownikID()
        {
            if (Session["UzytkownikID"] != null)
            {
                return Convert.ToInt32(Session["UzytkownikID"]);
            }
            throw new Exception("Błąd podczas pobierania ID użytkownika.");
        }
    }
}