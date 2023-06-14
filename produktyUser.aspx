<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="produktyUser.aspx.cs" Inherits="sklepBHP.produktyUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
        <asp:GridView ID="prodGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="prodSqlDataSource" OnRowCommand="prodGridView_RowCommand">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" SortExpression="Kategoria" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                <asp:BoundField DataField="Dostepnosc" HeaderText="Dostępność" SortExpression="Dostepnosc" />
                <asp:TemplateField HeaderText="Akcje">
                    <ItemTemplate>
                        <asp:Button ID="btnDodajDoKoszyka" runat="server" Text="Dodaj do koszyka" CommandName="DodajDoKoszyka" CommandArgument='<%# Eval("ID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="prodSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
            SelectCommand="SELECT p.ID, p.Nazwa, p.Opis, k.Nazwa AS Kategoria, p.Cena, p.Dostepnosc
                       FROM Produkty p
                       INNER JOIN Kategorie k ON p.Kategoria_ID = k.ID">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="koszSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
            DeleteCommand="DELETE FROM [Koszyk] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [Koszyk] ([Uzytkownik_ID], [Produkt_ID], [Ilosc]) VALUES (@Uzytkownik_ID, @Produkt_ID, @Ilosc)" 
            SelectCommand="SELECT * FROM [Koszyk]" 
            UpdateCommand="UPDATE [Koszyk] SET [Uzytkownik_ID] = @Uzytkownik_ID, [Produkt_ID] = @Produkt_ID, [Ilosc] = @Ilosc WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Uzytkownik_ID" Type="Int32" />
                <asp:Parameter Name="Produkt_ID" Type="Int32" />
                <asp:Parameter Name="Ilosc" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Uzytkownik_ID" Type="Int32" />
                <asp:Parameter Name="Produkt_ID" Type="Int32" />
                <asp:Parameter Name="Ilosc" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
