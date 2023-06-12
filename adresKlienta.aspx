<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="adresKlienta.aspx.cs" Inherits="sklepBHP.adress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-placeholder">
            <label for="txtUlica">Ulica:</label>
            <asp:TextBox ID="txtUlica" runat="server" ValidationGroup="AddressValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUlica" runat="server" ControlToValidate="txtUlica" ErrorMessage="Pole 'Ulica' jest wymagane." ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            <br />
            <label for="txtNumerDomu">Numer domu/mieszkania:</label>
            <asp:TextBox ID="txtNumerDomu" runat="server" ValidationGroup="AddressValidation"></asp:TextBox>
            <br />
            <label for="txtKodPocztowy">Kod pocztowy:</label>
            <asp:TextBox ID="txtKodPocztowy" runat="server" ValidationGroup="AddressValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvKodPocztowy" runat="server" ControlToValidate="txtKodPocztowy" ErrorMessage="Pole 'Kod pocztowy' jest wymagane." ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revKodPocztowy" runat="server" ControlToValidate="txtKodPocztowy"
                ErrorMessage="Podaj poprawny kod pocztowy (np. 00-000)" ValidationGroup="AddressValidation"
                ValidationExpression="\d{2}-\d{3}"></asp:RegularExpressionValidator>
            <br />
            <label for="txtMiasto">Miasto:</label>
            <asp:TextBox ID="txtMiasto" runat="server" ValidationGroup="AddressValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMiasto" runat="server" ControlToValidate="txtMiasto" ErrorMessage="Pole 'Miasto' jest wymagane." ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            <br />
            <label for="txtKraj">Kraj:</label>
            <asp:TextBox ID="txtKraj" runat="server" ValidationGroup="AddressValidation"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvKraj" runat="server" ControlToValidate="txtKraj" ErrorMessage="Pole 'Kraj' jest wymagane." ValidationGroup="AddressValidation"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnDodajAdres" runat="server" Text="Dodaj Adres" OnClick="btnDodajAdres_Click" ValidationGroup="AddressValidation" />

            <asp:GridView ID="adresGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_adres" DataSourceID="adresSqlDataSource">
                <Columns>
                    <asp:BoundField DataField="ID_adres" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID_adres" />
                    <asp:BoundField DataField="Ulica" HeaderText="Ulica" SortExpression="Ulica" />
                    <asp:BoundField DataField="Numer_domu_mieszkania" HeaderText="Numer domu/mieszkania" SortExpression="Numer_domu_mieszkania" />
                    <asp:BoundField DataField="Kod_pocztowy" HeaderText="Kod pocztowy" SortExpression="Kod_pocztowy" />
                    <asp:BoundField DataField="Miasto" HeaderText="Miasto" SortExpression="Miasto" />
                    <asp:BoundField DataField="Kraj" HeaderText="Kraj" SortExpression="Kraj" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="adresSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sklepBHPConnectionString %>" DeleteCommand="DELETE FROM [Adresy_klientow] WHERE [ID_adres] = @ID_adres" InsertCommand="INSERT INTO [Adresy_klientow] ([Ulica], [Numer_domu_mieszkania], [Kod_pocztowy], [Miasto], [Kraj]) VALUES (@Ulica, @Numer_domu_mieszkania, @Kod_pocztowy, @Miasto, @Kraj)" SelectCommand="SELECT * FROM [Adresy_klientow]" UpdateCommand="UPDATE [Adresy_klientow] SET [Ulica] = @Ulica, [Numer_domu_mieszkania] = @Numer_domu_mieszkania, [Kod_pocztowy] = @Kod_pocztowy, [Miasto] = @Miasto, [Kraj] = @Kraj WHERE [ID_adres] = @ID_adres">
                <DeleteParameters>
                    <asp:Parameter Name="ID_adres" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Ulica" Type="String" />
                    <asp:Parameter Name="Numer_domu_mieszkania" Type="String" />
                    <asp:Parameter Name="Kod_pocztowy" Type="String" />
                    <asp:Parameter Name="Miasto" Type="String" />
                    <asp:Parameter Name="Kraj" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ulica" Type="String" />
                    <asp:Parameter Name="Numer_domu_mieszkania" Type="String" />
                    <asp:Parameter Name="Kod_pocztowy" Type="String" />
                    <asp:Parameter Name="Miasto" Type="String" />
                    <asp:Parameter Name="Kraj" Type="String" />
                    <asp:Parameter Name="ID_adres" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
</asp:Content>
