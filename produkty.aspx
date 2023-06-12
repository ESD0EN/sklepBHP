<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="produkty.aspx.cs" Inherits="sklepBHP.products" %>
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
            Marka <asp:TextBox ID="txtMarka" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMarka" runat="server" ControlToValidate="txtMarka"
                ErrorMessage="Podaj markę produktu" ValidationGroup="ValidationGroup1"></asp:RequiredFieldValidator>
            <br />
            Kategoria <asp:TextBox ID="txtKategoria" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvKategoria" runat="server" ControlToValidate="txtKategoria"
                ErrorMessage="Podaj kategorię produktu" ValidationGroup="ValidationGroup1"></asp:RequiredFieldValidator>
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
            <asp:GridView ID="produktyGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_produkt" DataSourceID="produktySqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID_produkt" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_produkt" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                    <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
                    <asp:BoundField DataField="Marka" HeaderText="Marka" SortExpression="Marka" />
                    <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" SortExpression="Kategoria" />
                    <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
                    <asp:BoundField DataField="Stan_magazynowy" HeaderText="Stan magazynowy" SortExpression="Stan_magazynowy" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="produktySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sklepBHPConnectionString %>" DeleteCommand="DELETE FROM [Produkty] WHERE [ID_produkt] = @ID_produkt" InsertCommand="INSERT INTO [Produkty] ([Nazwa], [Opis], [Marka], [Kategoria], [Cena], [Stan_magazynowy]) VALUES (@Nazwa, @Opis, @Marka, @Kategoria, @Cena, @Stan_magazynowy)" SelectCommand="SELECT * FROM [Produkty]" UpdateCommand="UPDATE [Produkty] SET [Nazwa] = @Nazwa, [Opis] = @Opis, [Marka] = @Marka, [Kategoria] = @Kategoria, [Cena] = @Cena, [Stan_magazynowy] = @Stan_magazynowy WHERE [ID_produkt] = @ID_produkt">
                <DeleteParameters>
                    <asp:Parameter Name="ID_produkt" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="Opis" Type="String" />
                    <asp:Parameter Name="Marka" Type="String" />
                    <asp:Parameter Name="Kategoria" Type="String" />
                    <asp:Parameter Name="Cena" Type="Decimal" />
                    <asp:Parameter Name="Stan_magazynowy" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="Opis" Type="String" />
                    <asp:Parameter Name="Marka" Type="String" />
                    <asp:Parameter Name="Kategoria" Type="String" />
                    <asp:Parameter Name="Cena" Type="Decimal" />
                    <asp:Parameter Name="Stan_magazynowy" Type="Int32" />
                    <asp:Parameter Name="ID_produkt" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
   
</asp:Content>
