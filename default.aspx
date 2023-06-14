<%@ Page Title="" Language="C#" MasterPageFile="~/def.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="sklepBHP._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
        <asp:GridView ID="defaultGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="defaultSqlDataSource" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" SortExpression="Kategoria" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                <asp:BoundField DataField="Dostepnosc" HeaderText="Dostępność" SortExpression="Dostepnosc" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="defaultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" SelectCommand="SELECT Produkty.ID, Produkty.Nazwa, Produkty.Opis, Kategorie.Nazwa AS Kategoria, Produkty.Cena, Produkty.Dostepnosc FROM Produkty INNER JOIN Kategorie ON Produkty.Kategoria_ID = Kategorie.ID"></asp:SqlDataSource>
    </div>
</asp:Content>
