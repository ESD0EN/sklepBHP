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
            Klient <asp:DropDownList ID="ddlKlienci" runat="server" ValidationGroup="AddOrderValidation" DataSourceID="zamowienielistSqlDataSource" DataTextField="Klient" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource ID="zamowienielistSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" SelectCommand="SELECT [ID], [Imie] +' '+ [Nazwisko] as Klient FROM [Uzytkownicy]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="btnDodajZamowienie" runat="server" Text="Dodaj zamówienie" OnClick="btnDodajZamowienie_Click" ValidationGroup="AddOrderValidation" />
            <br />
            <asp:GridView ID="zamowieniaGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="zamowieniaSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="Uzytkownik_ID" HeaderText="Uzytkownik_ID" SortExpression="Uzytkownik_ID" />
                    <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" ReadOnly="True" />
                    <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" ReadOnly="True" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="zamowieniaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
                DeleteCommand="DELETE FROM [Zamowienia] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Zamowienia] ([Uzytkownik_ID], [Data], [Status]) VALUES (@Uzytkownik_ID, @Data, @Status)" 
                SelectCommand="SELECT Zamowienia.ID, Zamowienia.Data, Zamowienia.Status, Zamowienia.Uzytkownik_ID, Uzytkownicy.Imie, Uzytkownicy.Nazwisko, Uzytkownicy.Email FROM Zamowienia INNER JOIN Uzytkownicy ON Zamowienia.Uzytkownik_ID = Uzytkownicy.ID" 
                UpdateCommand="UPDATE [Zamowienia] SET [Uzytkownik_ID] = @Uzytkownik_ID, [Data] = @Data, [Status] = @Status WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Uzytkownik_ID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Data" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Uzytkownik_ID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Data" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
