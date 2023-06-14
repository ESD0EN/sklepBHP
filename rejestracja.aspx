<%@ Page Title="" Language="C#" MasterPageFile="~/def.Master" AutoEventWireup="true" CodeBehind="rejestracja.aspx.cs" Inherits="sklepBHP.rejestracja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
        <h2> Rejestracja</h2>
        <label for="txtImie">Imię </label>
        <asp:TextBox ID="txtImie" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvImie" runat="server" ControlToValidate="txtImie"
            ErrorMessage="Imię jest wymagane"></asp:RequiredFieldValidator>
        <br />
        <label for="txtNazwisko">Nazwisko </label>
        <asp:TextBox ID="txtNazwisko" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNazwisko" runat="server" ControlToValidate="txtNazwisko"
            ErrorMessage="Nazwisko jest wymagane"></asp:RequiredFieldValidator>
        <br />
        <label for="txtEmail">Email </label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Email jest wymagany"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Niepoprawny format emaila" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
        <br />
        <label for="txtHaslo">Hasło </label>
        <asp:TextBox ID="txtHaslo" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvHaslo" runat="server" ControlToValidate="txtHaslo"
            ErrorMessage="Hasło jest wymagane"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnRejestracja" runat="server" Text="Zarejestruj" OnClick="btnRejestracja_Click" ValidationGroup="RegistrationValidation" />
        <br />
        <br />
        <a href="logowanie.aspx">Masz już konto? Zaloguj się</a>
        <asp:SqlDataSource ID="rejSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
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
