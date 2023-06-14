<%@ Page Title="" Language="C#" MasterPageFile="~/masterPageAdmin.Master" AutoEventWireup="true" CodeBehind="klientAdmin.aspx.cs" Inherits="sklepBHP.klient" %>
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
            Adres E-mail <asp:TextBox ID="txtAdresEmail" runat="server" ValidationGroup="AddClientValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAdresEmail" runat="server" ControlToValidate="txtAdresEmail"
                ErrorMessage="Adres e-mail jest wymagany" ValidationGroup="AddClientValidation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revAdresEmail" runat="server" ControlToValidate="txtAdresEmail"
                ErrorMessage="Podaj poprawny adres e-mail" ValidationGroup="AddClientValidation"
                ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>
            <br />
            Hasło <asp:TextBox ID="txtHaslo" runat="server" ValidationGroup="AddClientValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvHaslo" runat="server" ControlToValidate="txtHaslo"
                ErrorMessage="Pole 'Hasło' jest wymagane." ValidationGroup="AddClientValidation">
            </asp:RequiredFieldValidator>

            <br />
            Rola
            <asp:DropDownList ID="rolaDropDownList" runat="server">
                <asp:ListItem>user</asp:ListItem>
                <asp:ListItem>admin</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnDodajKlienta" runat="server" Text="Dodaj klienta" OnClick="btnDodajKlienta_Click" ValidationGroup="AddClientValidation" />
            <br />
            <asp:GridView ID="klientGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="klientSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                    <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Haslo" HeaderText="Haslo" SortExpression="Haslo" />
                    <asp:BoundField DataField="Rola" HeaderText="Rola" SortExpression="Rola" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="klientSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
                DeleteCommand="DELETE FROM [Uzytkownicy] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Uzytkownicy] ([Imie], [Nazwisko], [Email], [Haslo], [Rola]) VALUES (@Imie, @Nazwisko, @Email, @Haslo, @Rola)" 
                SelectCommand="SELECT * FROM [Uzytkownicy]" 
                UpdateCommand="UPDATE [Uzytkownicy] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Haslo] = @Haslo, [Rola] = @Rola WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Haslo" Type="String" />
                    <asp:Parameter Name="Rola" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Haslo" Type="String" />
                    <asp:Parameter Name="Rola" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
