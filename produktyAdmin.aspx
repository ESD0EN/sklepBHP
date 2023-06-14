<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="produktyAdmin.aspx.cs" Inherits="sklepBHP.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div class="content-placeholder">
            Nazwa <asp:TextBox ID="txtNazwa" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNazwa" runat="server" ControlToValidate="txtNazwa"
                ErrorMessage="Podaj nazwę produktu" ValidationGroup="ValidationGroup1"></asp:RequiredFieldValidator>
            <br />
            Opis <asp:TextBox ID="txtOpis" runat="server"></asp:TextBox>
            <br />
            Kategoria <asp:DropDownList ID="katDropDownList" runat="server" DataSourceID="katSqlDataSource" DataTextField="Nazwa" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource ID="katSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" SelectCommand="SELECT [ID], [Nazwa] FROM [Kategorie]"></asp:SqlDataSource>
            <br />
            Cena <asp:TextBox ID="txtCena" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCena" runat="server" ControlToValidate="txtCena"
                ErrorMessage="Podaj cenę produktu" ValidationGroup="ValidationGroup1"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revCena" runat="server" ControlToValidate="txtCena"
                ErrorMessage="Podaj poprawny format ceny (np. 12,34)" ValidationGroup="ValidationGroup1"
                ValidationExpression="^\d+(\,\d{1,2})?$"></asp:RegularExpressionValidator>
            <br />
            Stan magazynowy <asp:TextBox ID="txtStanMagazynowy" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvStanMagazynowy" runat="server" ControlToValidate="txtStanMagazynowy"
                ErrorMessage="Podaj stan magazynowy" ValidationGroup="ValidationGroup1"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revStanMagazynowy" runat="server" ControlToValidate="txtStanMagazynowy"
                ErrorMessage="Podaj poprawny stan magazynowy (tylko liczby)" ValidationGroup="ValidationGroup1"
                ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="dodajButton" runat="server" Text="Dodaj" OnClick="dodajButton_Click" ValidationGroup="ValidationGroup1"/>
            <br />
            <asp:GridView ID="produktyGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="produktySqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                    <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                    <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                    <asp:BoundField DataField="Dostepnosc" HeaderText="Dostępność" SortExpression="Dostepnosc" />
                    <asp:BoundField DataField="Kategoria_ID" HeaderText="Kategoria_ID" SortExpression="Kategoria_ID" />
                    <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" ReadOnly="True" SortExpression="Kategoria" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="produktySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" DeleteCommand="DELETE FROM [Produkty] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Produkty] ([Nazwa], [Opis], [Cena], [Dostepnosc], [Kategoria_ID]) VALUES (@Nazwa, @Opis, @Cena, @Dostepnosc, @Kategoria_ID)" SelectCommand="SELECT Produkty.ID, Produkty.Nazwa, Produkty.Opis, Produkty.Cena, Produkty.Dostepnosc, Produkty.Kategoria_ID, Kategorie.Nazwa AS Kategoria FROM Produkty INNER JOIN Kategorie ON Produkty.Kategoria_ID = Kategorie.ID" UpdateCommand="UPDATE [Produkty] SET [Nazwa] = @Nazwa, [Opis] = @Opis, [Cena] = @Cena, [Dostepnosc] = @Dostepnosc, [Kategoria_ID] = @Kategoria_ID WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="Opis" Type="String" />
                    <asp:Parameter Name="Cena" Type="Decimal" />
                    <asp:Parameter Name="Dostepnosc" Type="Int32" />
                    <asp:Parameter Name="Kategoria_ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="Opis" Type="String" />
                    <asp:Parameter Name="Cena" Type="Decimal" />
                    <asp:Parameter Name="Dostepnosc" Type="Int32" />
                    <asp:Parameter Name="Kategoria_ID" Type="Int32" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
   
</asp:Content>
