<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="pozycjeZamowieniaAdmin.aspx.cs" Inherits="sklepBHP.position" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-placeholder">
            Ilość <asp:TextBox ID="txtIloscZamowionych" runat="server" ValidationGroup="vgDodawanie"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtIloscZamowionych"
                ErrorMessage="Podaj ilość zamówionych produktów." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIloscZamowionych"
                ErrorMessage="Wprowadź poprawną liczbę." ValidationGroup="vgDodawanie"
                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <br />
            Produkt <asp:DropDownList ID="ddlProdukt" runat="server" ValidationGroup="vgDodawanie" DataSourceID="produktPozycjaSqlDataSource" DataTextField="Produkt" DataValueField="ID_produkt">
            </asp:DropDownList>
            <asp:SqlDataSource ID="produktPozycjaSqlDataSource" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\sem6\aplikacje_internetowe\_projekt\etap 3\sklepBHP.mdf&quot;;Integrated Security=True;Connect Timeout=30" SelectCommand="SELECT Nazwa + ', ' + CAST(Cena AS NVARCHAR(10)) AS Produkt, ID_produkt FROM Produkty" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvProdukt" runat="server" ControlToValidate="ddlProdukt"
                ErrorMessage="Wybierz produkt." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <br />
            Zamówienie <asp:DropDownList ID="ddlZamowienie" runat="server" ValidationGroup="vgDodawanie" DataSourceID="zamowieniepozycjaSqlDataSource" DataTextField="Zamowienie" DataValueField="ID_zamowienia">
            </asp:DropDownList>
            <asp:SqlDataSource ID="zamowieniepozycjaSqlDataSource" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\sem6\aplikacje_internetowe\_projekt\etap 3\sklepBHP.mdf&quot;;Integrated Security=True;Connect Timeout=30" SelectCommand="SELECT CONVERT (NVARCHAR(10), Zamowienia.Data_zamowienia, 103) + ' - ' + Klienci.Imie + ' ' + Klienci.Nazwisko + ', ' + Klienci.Numer_telefonu AS Zamowienie, Zamowienia.ID_zamowienia FROM Zamowienia INNER JOIN Klienci ON Zamowienia.ID_klient = Klienci.ID_klient" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvZamowienie" runat="server" ControlToValidate="ddlZamowienie"
                ErrorMessage="Wybierz zamówienie." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnDodajPozycje" runat="server" Text="Dodaj" OnClick="btnDodajPozycje_Click"
                ValidationGroup="vgDodawanie" />
            <asp:RequiredFieldValidator ID="rfvIloscZamowionych" runat="server" ControlToValidate="txtIloscZamowionych"
                ErrorMessage="Podaj ilość zamówionych produktów." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <br />
            <asp:GridView ID="pozycjeGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_pozycji" DataSourceID="pozycjeSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID_pozycji" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_pozycji" />
                    <asp:BoundField DataField="ID_zamowienia" HeaderText="Zamówienie ID" SortExpression="ID_zamowienia" />
                    <asp:BoundField DataField="ID_produkt" HeaderText="Produkt ID" SortExpression="ID_produkt" />
                    <asp:BoundField DataField="Produkt" HeaderText="Produkt" SortExpression="Produkt" ReadOnly="True" />
                    <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" ReadOnly="True" />
                    <asp:BoundField DataField="Ilosc_zamowionych_produktow" HeaderText="Ilość" SortExpression="Ilosc_zamowionych_produktow" />
                    <asp:BoundField DataField="Data_zamowienia" HeaderText="Data zamówienia" SortExpression="Data_zamowienia" ReadOnly="True" />
                    <asp:BoundField DataField="Cena_Calkowita" HeaderText="Cena całkowita" ReadOnly="True" SortExpression="Cena całkowita" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="pozycjeSqlDataSource" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\sem6\aplikacje_internetowe\_projekt\etap 3\sklepBHP.mdf&quot;;Integrated Security=True;Connect Timeout=30" 
                DeleteCommand="DELETE FROM [Pozycje_zamowienia] WHERE [ID_pozycji] = @ID_pozycji" 
                InsertCommand="INSERT INTO [Pozycje_zamowienia] ([ID_zamowienia], [ID_produkt], [Ilosc_zamowionych_produktow]) VALUES (@ID_zamowienia, @ID_produkt, @Ilosc_zamowionych_produktow)" 
                SelectCommand="SELECT Pozycje_zamowienia.ID_pozycji, Pozycje_zamowienia.ID_zamowienia, Pozycje_zamowienia.ID_produkt, Pozycje_zamowienia.Ilosc_zamowionych_produktow, Produkty.Nazwa AS Produkt, Zamowienia.Data_zamowienia, SUM(Pozycje_zamowienia.Ilosc_zamowionych_produktow * Produkty.Cena) AS Cena_Calkowita, Produkty.Cena FROM Pozycje_zamowienia INNER JOIN Produkty ON Pozycje_zamowienia.ID_produkt = Produkty.ID_produkt INNER JOIN Zamowienia ON Pozycje_zamowienia.ID_zamowienia = Zamowienia.ID_zamowienia GROUP BY Pozycje_zamowienia.ID_pozycji, Pozycje_zamowienia.ID_zamowienia, Pozycje_zamowienia.ID_produkt, Pozycje_zamowienia.Ilosc_zamowionych_produktow, Produkty.Nazwa, Zamowienia.Data_zamowienia, Produkty.Cena" 
                UpdateCommand="UPDATE [Pozycje_zamowienia] SET [ID_zamowienia] = @ID_zamowienia, [ID_produkt] = @ID_produkt, [Ilosc_zamowionych_produktow] = @Ilosc_zamowionych_produktow WHERE [ID_pozycji] = @ID_pozycji" ProviderName="System.Data.SqlClient">
                <DeleteParameters>
                    <asp:Parameter Name="ID_pozycji" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_zamowienia" Type="Int32" />
                    <asp:Parameter Name="ID_produkt" Type="Int32" />
                    <asp:Parameter Name="Ilosc_zamowionych_produktow" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID_zamowienia" Type="Int32" />
                    <asp:Parameter Name="ID_produkt" Type="Int32" />
                    <asp:Parameter Name="Ilosc_zamowionych_produktow" Type="Int32" />
                    <asp:Parameter Name="ID_pozycji" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
