<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="klient.aspx.cs" Inherits="sklepBHP.klient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
            Imię <asp:TextBox ID="txtImie" runat="server" ValidationGroup="AddClientValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvImie" runat="server" ControlToValidate="txtImie" ErrorMessage="Imię jest wymagane" ValidationGroup="AddClientValidation"></asp:RequiredFieldValidator>
            <br />
            Nazwisko <asp:TextBox ID="txtNazwisko" runat="server" ValidationGroup="AddClientValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNazwisko" runat="server" ControlToValidate="txtNazwisko" ErrorMessage="Nazwisko jest wymagane" ValidationGroup="AddClientValidation"></asp:RequiredFieldValidator>
            <br />
            Numer telefonu <asp:TextBox ID="txtNumerTelefonu" runat="server" ValidationGroup="AddClientValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNumerTelefonu" runat="server" ControlToValidate="txtNumerTelefonu"
                ErrorMessage="Numer telefonu jest wymagany" ValidationGroup="AddClientValidation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revNumerTelefonu" runat="server" ControlToValidate="txtNumerTelefonu"
                ErrorMessage="Podaj poprawny numer telefonu (9 cyfr)" ValidationGroup="AddClientValidation"
                ValidationExpression="^\d{9}$"></asp:RegularExpressionValidator>
            <br />
            Adres E-mail<asp:TextBox ID="txtAdresEmail" runat="server" ValidationGroup="AddClientValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAdresEmail" runat="server" ControlToValidate="txtAdresEmail"
                ErrorMessage="Adres e-mail jest wymagany" ValidationGroup="AddClientValidation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revAdresEmail" runat="server" ControlToValidate="txtAdresEmail"
                ErrorMessage="Podaj poprawny adres e-mail" ValidationGroup="AddClientValidation"
                ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
            <br />
            Adres <asp:DropDownList ID="ddlAdresy" runat="server" DataSourceID="klientListSqlDataSource" DataTextField="Adres" DataValueField="ID_adres"></asp:DropDownList>
            <asp:SqlDataSource ID="klientListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sklepBHPConnectionString %>" SelectCommand="SELECT Ulica + ' /' + Numer_domu_mieszkania + ',' + Miasto + ' ' + Kod_pocztowy + ', ' + Kraj AS Adres, ID_adres FROM Adresy_klientow"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvAdresy" runat="server" ControlToValidate="ddlAdresy" ErrorMessage="Wybierz adres" ValidationGroup="AddClientValidation"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnDodajKlienta" runat="server" Text="Dodaj klienta" OnClick="btnDodajKlienta_Click" ValidationGroup="AddClientValidation" />
            <br />
            <asp:GridView ID="klientGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_klient" DataSourceID="klientSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID_klient" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_klient" />
                    <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                    <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                    <asp:BoundField DataField="Numer_telefonu" HeaderText="Numer telefonu" SortExpression="Numer_telefonu" />
                    <asp:BoundField DataField="Adres_email" HeaderText="Adres email" SortExpression="Adres_email" />
                    <asp:BoundField DataField="ID_adres_klienta" HeaderText="Adres ID" SortExpression="ID_adres_klienta" />
                    <asp:BoundField DataField="Ulica" HeaderText="Ulica" SortExpression="Ulica" />
                    <asp:BoundField DataField="Numer_domu_mieszkania" HeaderText="Numer domu/mieszkania" SortExpression="Numer_domu_mieszkania" />
                    <asp:BoundField DataField="Kod_pocztowy" HeaderText="Kod pocztowy" SortExpression="Kod_pocztowy" />
                    <asp:BoundField DataField="Miasto" HeaderText="Miasto" SortExpression="Miasto" />
                    <asp:BoundField DataField="Kraj" HeaderText="Kraj" SortExpression="Kraj" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="klientSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sklepBHPConnectionString %>" 
                DeleteCommand="DELETE FROM Klienci FROM Klienci INNER JOIN Adresy_klientow ON Klienci.ID_adres_klienta = Adresy_klientow.ID_adres WHERE (Klienci.ID_klient = @ID_klient)" 
                InsertCommand="INSERT INTO Klienci(ID_adres_klienta, Imie, Nazwisko, Numer_telefonu, Adres_email) VALUES (@ID_adres_klienta, @Imie, @Nazwisko, @Numer_telefonu, @Adres_email)" 
                SelectCommand="SELECT Klienci.ID_klient, Klienci.Imie, Klienci.Nazwisko, Klienci.Numer_telefonu, Klienci.Adres_email, Adresy_klientow.Ulica, Adresy_klientow.Numer_domu_mieszkania, Adresy_klientow.Kod_pocztowy, Adresy_klientow.Miasto, Adresy_klientow.Kraj, Klienci.ID_adres_klienta FROM Klienci INNER JOIN Adresy_klientow ON Klienci.ID_adres_klienta = Adresy_klientow.ID_adres" 
                UpdateCommand="UPDATE Klienci SET ID_adres_klienta = @ID_adres_klienta, Imie = @Imie, Nazwisko = @Nazwisko, Numer_telefonu = @Numer_telefonu, Adres_email = @Adres_email FROM Klienci INNER JOIN Adresy_klientow ON Klienci.ID_adres_klienta = Adresy_klientow.ID_adres WHERE (Klienci.ID_klient = @ID_klient)">
                <DeleteParameters>
                    <asp:Parameter Name="ID_klient" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_adres_klienta" Type="Int32" />
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Numer_telefonu" Type="String" />
                    <asp:Parameter Name="Adres_email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID_adres_klienta" Type="Int32" />
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Numer_telefonu" Type="String" />
                    <asp:Parameter Name="Adres_email" Type="String" />
                    <asp:Parameter Name="ID_klient" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
