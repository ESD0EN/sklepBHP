<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="zamowieniaAdmin.aspx.cs" Inherits="sklepBHP.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
            Data zamówienia<asp:TextBox ID="txtDataZamowienia" runat="server" ValidationGroup="AddOrderValidation"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revDataZamowienia" runat="server" ControlToValidate="txtDataZamowienia"
                ErrorMessage="Nieprawidłowy format daty (2023-12-31)" ValidationExpression="^\d{4}-\d{2}-\d{2}$" ValidationGroup="AddOrderValidation"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvDataZamowienia" runat="server" ControlToValidate="txtDataZamowienia"
                ErrorMessage="Data zamówienia jest wymagana" ValidationGroup="AddOrderValidation"></asp:RequiredFieldValidator>
            <br />
            Status zamówienia <asp:DropDownList ID="ddlStatusZamowienia" runat="server" ValidationGroup="AddOrderValidation">
                <asp:ListItem Value="Złożone">Złożone</asp:ListItem>
                <asp:ListItem Value="W trakcie realizacji">W trakcie realizacji</asp:ListItem>
                <asp:ListItem Value="Zrealizowane">Zrealizowane</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvStatusZamowienia" runat="server" ControlToValidate="ddlStatusZamowienia" InitialValue="" ErrorMessage="Wybierz status zamówienia" ValidationGroup="AddOrderValidation"></asp:RequiredFieldValidator>
            <br />
            Klient <asp:DropDownList ID="ddlKlienci" runat="server" ValidationGroup="AddOrderValidation" DataSourceID="zamowienielistSqlDataSource" DataTextField="Klient" DataValueField="ID_klient"></asp:DropDownList>
            <asp:SqlDataSource ID="zamowienielistSqlDataSource" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\sem6\aplikacje_internetowe\_projekt\etap 3\sklepBHP.mdf&quot;;Integrated Security=True;Connect Timeout=30" SelectCommand="SELECT Imie + ' ' + Nazwisko + ', ' + Numer_telefonu AS Klient, ID_klient FROM Klienci" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvKlienci" runat="server" ControlToValidate="ddlKlienci" InitialValue="" ErrorMessage="Wybierz klienta" ValidationGroup="AddOrderValidation"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnDodajZamowienie" runat="server" Text="Dodaj zamówienie" OnClick="btnDodajZamowienie_Click" ValidationGroup="AddOrderValidation" />
            <br />
            <asp:GridView ID="zamowieniaGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_zamowienia" DataSourceID="zamowieniaSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID_zamowienia" HeaderText="ID_zamowienia" InsertVisible="False" ReadOnly="True" SortExpression="ID_zamowienia" />
                    <asp:BoundField DataField="Data_zamowienia" HeaderText="Data_zamowienia" SortExpression="Data_zamowienia" />
                    <asp:BoundField DataField="Status_zamowienia" HeaderText="Status_zamowienia" SortExpression="Status_zamowienia" />
                    <asp:BoundField DataField="ID_klient" HeaderText="ID_klient" SortExpression="ID_klient" />
                    <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" ReadOnly="True" />
                    <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" ReadOnly="True" />
                    <asp:BoundField DataField="Numer_telefonu" HeaderText="Numer_telefonu" SortExpression="Numer_telefonu" ReadOnly="True" />
                    <asp:BoundField DataField="Adres_email" HeaderText="Adres_email" SortExpression="Adres_email" ReadOnly="True" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="zamowieniaSqlDataSource" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=&quot;D:\sem6\aplikacje_internetowe\_projekt\etap 3\sklepBHP.mdf&quot;;Integrated Security=True;Connect Timeout=30" 
                DeleteCommand="DELETE FROM [Zamowienia] WHERE [ID_zamowienia] = @ID_zamowienia" 
                InsertCommand="INSERT INTO [Zamowienia] ([ID_klient], [Data_zamowienia], [Status_zamowienia]) VALUES (@ID_klient, @Data_zamowienia, @Status_zamowienia)" 
                SelectCommand="SELECT Zamowienia.ID_zamowienia, Zamowienia.Data_zamowienia, Zamowienia.Status_zamowienia, Zamowienia.ID_klient, Klienci.Imie, Klienci.Nazwisko, Klienci.Numer_telefonu, Klienci.Adres_email FROM Zamowienia INNER JOIN Klienci ON Zamowienia.ID_klient = Klienci.ID_klient" 
                UpdateCommand="UPDATE [Zamowienia] SET [ID_klient] = @ID_klient, [Data_zamowienia] = @Data_zamowienia, [Status_zamowienia] = @Status_zamowienia WHERE [ID_zamowienia] = @ID_zamowienia" ProviderName="System.Data.SqlClient">
                <DeleteParameters>
                    <asp:Parameter Name="ID_zamowienia" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_klient" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Data_zamowienia" />
                    <asp:Parameter Name="Status_zamowienia" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID_klient" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Data_zamowienia" />
                    <asp:Parameter Name="Status_zamowienia" Type="String" />
                    <asp:Parameter Name="ID_zamowienia" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
