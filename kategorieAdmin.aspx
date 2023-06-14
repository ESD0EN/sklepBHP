<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="kategorieAdmin.aspx.cs" Inherits="sklepBHP.kategorieAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
        Nazwa kategorii <asp:TextBox ID="txtNazwaKategorii" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNazwaKategorii" runat="server" ControlToValidate="txtNazwaKategorii"
            ErrorMessage="Pole 'Nazwa kategorii' jest wymagane." ValidationGroup="AddCategoryValidation">
        </asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnDodajKategorie" runat="server" Text="Dodaj" OnClick="btnDodajKategorie_Click" CausesValidation="true" ValidationGroup="AddCategoryValidation" />


        <asp:GridView ID="kategorieGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="kategorieSqlDataSource">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="kategorieSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" DeleteCommand="DELETE FROM [Kategorie] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Kategorie] ([Nazwa]) VALUES (@Nazwa)" SelectCommand="SELECT * FROM [Kategorie]" UpdateCommand="UPDATE [Kategorie] SET [Nazwa] = @Nazwa WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
