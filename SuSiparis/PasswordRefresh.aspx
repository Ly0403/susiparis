<%@ Page Title="Şifre Yenile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordRefresh.aspx.cs" Inherits="SuSiparis.PasswordRefresh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <div class="divLogin" id="Loginform" runat="server">
                    <asp:UpdatePanel ID="LoginUpdatePanel" runat="server">
                        <ContentTemplate>
                            <div class="loginForm">
                                <h5 style="text-align: center; font-size: 20px; color: white;">Şifremi Unuttum</h5>
                                <p style="text-align: center; font-size: 10px; color: white;">[Kullanıcı Adınızı Giriniz.]</p>
                                <div class="loginInput">
                                    <table style="width: 100%">
                                        <tr>
                                            <td>
                                                <hr style="background-color: #4cff00" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="position: relative">
                                                    <asp:TextBox ID="LoginUser" runat="server" PlaceHolder="Kullanıcı Adı" CssClass="inputText"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Kulllanıcı Adı Giriniz" ValidationGroup="Login" ControlToValidate="LoginUser" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    <i style="position: absolute; top: 5px; right: 5px;" class="glyphicon glyphicon-user"></i>
                                                </div>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr style="background-color: #4cff00" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="ResetPasswordButton" runat="server" ValidationGroup="Login" CssClass="btn-warning" Text="Şifre Yenile" OnClick="ResetPasswordButton_Click" />

                                                <br />
                                                <asp:Label ID="LoginError" runat="server" Text="" ValidationGroup="Login" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr style="background-color: #4cff00" />
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

</asp:Content>
