<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="koszykUser.aspx.cs" Inherits="sklepBHP.koszykUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder"> 
        <asp:GridView ID="koszGridView" runat="server" AutoGenerateColumns="False" DataSourceID="koszSqlDataSource" DataKeyNames="ID">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" ReadOnly="True" />
                <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" ReadOnly="True" />
                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" ReadOnly="True" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" ReadOnly="True" />
                <asp:BoundField DataField="Ilosc" HeaderText="Ilość" SortExpression="Ilosc" />
                <asp:BoundField DataField="Cena_cal" HeaderText="Cena całkowita" ReadOnly="True" SortExpression="Cena_cal" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="koszSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
            SelectCommand="SELECT Uzytkownicy.Imie, Uzytkownicy.Nazwisko, Produkty.Nazwa, Produkty.Cena, Koszyk.Ilosc, Koszyk.Ilosc * Produkty.Cena AS Cena_cal, Koszyk.ID FROM Koszyk INNER JOIN Uzytkownicy ON Koszyk.Uzytkownik_ID = Uzytkownicy.ID INNER JOIN Produkty ON Koszyk.Produkt_ID = Produkty.ID" 
            DeleteCommand="DELETE FROM [Koszyk] WHERE [ID] = @ID" 
            UpdateCommand="UPDATE [Koszyk] SET [Ilosc] = @Ilosc WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ilosc" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
