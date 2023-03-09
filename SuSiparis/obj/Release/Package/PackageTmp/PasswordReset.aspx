<%@ Page Title="Şifre Yenile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="SuSiparis.PasswordReset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width:250px; margin:30px;padding:20px;border:1px solid #000000;border-radius:10px;background-color:cornflowerblue;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
        <h4>Şifreni Yenile</h4>
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="ResetUser" runat="server" PlaceHolder="UserName" CssClass="inputText"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kullanıcı Adı Giriniz" ValidationGroup="Reset" ControlToValidate="ResetUser" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="ResetSifre" runat="server" PlaceHolder="Şifre" CssClass="inputText" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Şifre Giriniz" ValidationGroup="Reset" ControlToValidate="ResetSifre" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ValidationGroup="Reset" ID="RegularExpressionValidator2" runat="server" ControlToValidate="ResetSifre" ErrorMessage="En Az 6 karakterli şifre belirleyiniz.." Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ResetButton" runat="server" Text="Gönder" ValidationGroup="Reset" CssClass="btn-danger" OnClick="ResetButton_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="ResetErrorLabel" ForeColor="Red" Font-Size="XX-Small" runat="server" Text="" ValidationGroup="Reset"></asp:Label>
                </td>
            </tr>
        </table>
    </div>



</asp:Content>
