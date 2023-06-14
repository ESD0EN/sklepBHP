<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="sklepBHP.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post" action="Login.aspx">
        <div>
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
    </form>
</body>
</html>
