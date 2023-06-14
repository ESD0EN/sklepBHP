<%@ Page Title="" Language="C#" MasterPageFile="~/def.Master" AutoEventWireup="true" CodeBehind="logowanie.aspx.cs" Inherits="sklepBHP.logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
        <h2> Logowanie</h2>
        <label for="email">Adres e-mail:</label>
        <asp:TextBox ID="emailTextBox" runat="server" ValidationGroup="loginValidation"></asp:TextBox>
        <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailTextBox"
            ErrorMessage="Proszę podać adres e-mail." ValidationGroup="loginValidation"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="emailFormatValidator" runat="server" ControlToValidate="emailTextBox"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ErrorMessage="Proszę podać poprawny adres e-mail." ValidationGroup="loginValidation"></asp:RegularExpressionValidator>
        <br />
        <label for="password">Hasło:</label>
        <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password" ValidationGroup="loginValidation"></asp:TextBox>
        <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="passwordTextBox"
            ErrorMessage="Proszę podać hasło." ValidationGroup="loginValidation"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="loginButton" runat="server" Text="Zaloguj" ValidationGroup="loginValidation" OnClick="LoginButton_Click" /> 
        <br />
        <br />
        <a href="rejestracja.aspx">Nie masz konta? Zarejestruj się</a>
        <br />
        <br />
        <asp:ValidationSummary ID="validationSummary" runat="server" ValidationGroup="loginValidation" DisplayMode="BulletList" /> 
        <br />
        <asp:Label ID="loginLabel" runat="server" Text=""></asp:Label>
        <br />
        <asp:SqlDataSource ID="loginSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
            SelectCommand="SELECT COUNT(*) FROM Uzytkownicy WHERE Email = @Email AND Haslo = @Haslo">
            <SelectParameters>
                <asp:ControlParameter ControlID="emailTextBox" PropertyName="Text" Name="Email" />
                <asp:ControlParameter ControlID="passwordTextBox" PropertyName="Text" Name="Haslo" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="rolaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BHPConnectionString %>" 
            SelectCommand="SELECT Rola FROM Uzytkownicy WHERE Email = @Email">
            <SelectParameters>
                <asp:ControlParameter ControlID="emailTextBox" PropertyName="Text" Name="Email" />
            </SelectParameters>
        </asp:SqlDataSource>   
    </div>
</asp:Content>
