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
            Produkt <asp:DropDownList ID="ddlProdukt" runat="server" ValidationGroup="vgDodawanie" DataSourceID="produktPozycjaSqlDataSource" DataTextField="Produkt" DataValueField="ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="produktPozycjaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" SelectCommand="SELECT ID, Nazwa + ', ' + CONVERT (varchar, Cena) AS Produkt FROM Produkty"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvProdukt" runat="server" ControlToValidate="ddlProdukt"
                ErrorMessage="Wybierz produkt." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <br />
            Zamówienie <asp:DropDownList ID="ddlZamowienie" runat="server" ValidationGroup="vgDodawanie" DataSourceID="zamowieniepozycjaSqlDataSource" DataTextField="Zamowienie" DataValueField="ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="zamowieniepozycjaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" SelectCommand="SELECT Zamowienia.ID, CONVERT (varchar, Zamowienia.Data) + ', ' + Uzytkownicy.Imie + ' ' + Uzytkownicy.Nazwisko AS Zamowienie FROM Zamowienia INNER JOIN Uzytkownicy ON Zamowienia.Uzytkownik_ID = Uzytkownicy.ID"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvZamowienie" runat="server" ControlToValidate="ddlZamowienie"
                ErrorMessage="Wybierz zamówienie." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnDodajPozycje" runat="server" Text="Dodaj" OnClick="btnDodajPozycje_Click"
                ValidationGroup="vgDodawanie" />
            <asp:RequiredFieldValidator ID="rfvIloscZamowionych" runat="server" ControlToValidate="txtIloscZamowionych"
                ErrorMessage="Podaj ilość zamówionych produktów." ValidationGroup="vgDodawanie"></asp:RequiredFieldValidator>
            <br />
            <asp:GridView ID="pozycjeGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="pozycjeSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Data" HeaderText="Data" ReadOnly="True" SortExpression="Data" />
                    <asp:BoundField DataField="Zamowienie_ID" HeaderText="Zamówienie ID" SortExpression="Zamowienie_ID" />
                    <asp:BoundField DataField="Produkt_ID" HeaderText="Produkt ID" SortExpression="Produkt_ID" />
                    <asp:BoundField DataField="Ilosc" HeaderText="Ilość" SortExpression="Ilosc" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa produktu" ReadOnly="True" SortExpression="Nazwa" />
                    <asp:BoundField DataField="Cena" HeaderText="Cena" ReadOnly="True" SortExpression="Cena" />
                    <asp:BoundField DataField="Cena_cal" HeaderText="Cena całkowita" ReadOnly="True" SortExpression="Cena całkowita" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="pozycjeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
                DeleteCommand="DELETE FROM [Pozycje_zamowienia] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Pozycje_zamowienia] ([Zamowienie_ID], [Produkt_ID], [Ilosc]) VALUES (@Zamowienie_ID, @Produkt_ID, @Ilosc)" 
                SelectCommand="SELECT Pozycje_zamowienia.ID, Zamowienia.Data, Pozycje_zamowienia.Zamowienie_ID, Pozycje_zamowienia.Produkt_ID, Pozycje_zamowienia.Ilosc, Produkty.Nazwa, Produkty.Cena, Pozycje_zamowienia.Ilosc * Produkty.Cena AS Cena_cal FROM Pozycje_zamowienia INNER JOIN Produkty ON Pozycje_zamowienia.Produkt_ID = Produkty.ID INNER JOIN Zamowienia ON Pozycje_zamowienia.Zamowienie_ID = Zamowienia.ID" 
                UpdateCommand="UPDATE [Pozycje_zamowienia] SET [Zamowienie_ID] = @Zamowienie_ID, [Produkt_ID] = @Produkt_ID, [Ilosc] = @Ilosc WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Zamowienie_ID" Type="Int32" />
                    <asp:Parameter Name="Produkt_ID" Type="Int32" />
                    <asp:Parameter Name="Ilosc" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Zamowienie_ID" Type="Int32" />
                    <asp:Parameter Name="Produkt_ID" Type="Int32" />
                    <asp:Parameter Name="Ilosc" Type="Int32" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
