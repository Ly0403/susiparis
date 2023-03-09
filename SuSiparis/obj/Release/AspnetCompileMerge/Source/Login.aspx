<%@ Page Title="Kayıt/Giriş" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SuSiparis.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <table>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-info btn-lg" data-toggle="collapse" data-target="#login" aria-expanded="false" aria-controls="login">Login</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr style="background-color: #4cff00" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-warn btn-lg" data-toggle="collapse" data-target="#register" aria-expanded="false" aria-controls="register">Register</button>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="col-md-4 collapse" id="login" style="background-color: brown; padding: 20px">
                <h5 style="text-align: center; font-size: 20px; color: white;">Giriş</h5>
                <p style="text-align: center; font-size: 10px; color: white;">[Kullanıcı Adı ve Şifrenizi Giriniz]</p>
                <table class="loginForm">
                    <tr>
                        <td>
                            <hr style="background-color: #4cff00" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="LoginUser" runat="server" PlaceHolder="Kullanıcı Adı" CssClass="inputText"></asp:TextBox>
                        </td>
                        <td>
                            <i class="glyphicon glyphicon-user"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Kulllanıcı Adı Giriniz" ValidationGroup="Login" ControlToValidate="LoginUser" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <hr style="background-color: #4cff00" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="LoginPassword" runat="server" PlaceHolder="Şifre" CssClass="inputText" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <i class="glyphicon glyphicon-asterisk"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Şifre Giriniz" ControlToValidate="LoginPassword" ValidationGroup="Login" ForeColor="Red" Font-Size="XX-Small"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr style="background-color: #4cff00" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="LoginButton" runat="server" ValidationGroup="Login" Text="Giriş" CssClass="btn-primary RegisterButton" OnClick="LoginButton_Click" />
                            <br />
                            <br />
                            <a href="/PasswordRefresh.aspx" class="btn-warning" style="font-size: 12px;">Şifremi Unuttum</a>
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
            <div class="col-md-4 collapse" id="register" style="background-color: coral; padding: 20px">
                <h5 style="text-align: center; font-size: 20px; color: white;">Register</h5>
                <p style="text-align: center; font-size: 10px; color: white;">[Alanları doldurunuz]</p>
                <table class="loginForm">
                    <tr>
                        <td>
                            <hr style="background-color: aquamarine" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div style="position: relative">
                                <asp:TextBox ID="RegisterName" runat="server" PlaceHolder="Kullanıcı Adı" CssClass="inputText"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Register" ControlToValidate="RegisterName" runat="server" ErrorMessage="Kullanıcı Adı Giriniz" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                <i style="position: absolute; top: 5px; right: 5px;" class="glyphicon glyphicon-user"></i>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div style="position: relative">
                                <asp:TextBox ID="RegisterMail" runat="server" CssClass="inputText" PlaceHolder="Email" TextMode="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ValidationGroup="Register" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Geçersiz Mail Adresi" ControlToValidate="RegisterMail" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ValidationGroup="Register" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mail Adresinizi Giriniz..." ControlToValidate="RegisterMail" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                <i style="position: absolute; top: 5px; right: 5px;" class="glyphicon glyphicon-envelope"></i>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="position: relative">
                                <asp:TextBox ID="RegisterPassword" runat="server" PlaceHolder="Şifre" CssClass="inputText" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="Register" ID="RequiredFieldValidator3" ControlToValidate="RegisterPassword" runat="server" ErrorMessage="Şifrenizi Giriniz..." Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ValidationGroup="Register" ID="RegularExpressionValidator2" runat="server" ControlToValidate="RegisterPassword" ErrorMessage="En Az 6 karakterli şifre belirleyiniz.." Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
                                <i style="position: absolute; top: 5px; right: 5px;" class="glyphicon glyphicon-asterisk"></i>
                            </div>

                        </td>
                        <tr>
                            <td>
                                <div style="position: relative">
                                    <asp:TextBox ID="RegisterTel" runat="server" CssClass="inputText" PlaceHolder="Cep Telefonu" TextMode="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="Register" ID="RequiredFieldValidator4" ControlToValidate="RegisterTel" runat="server" ErrorMessage="Telinizi giriniz" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ValidationGroup="Register" ID="RegularExpressionValidator3" runat="server" ControlToValidate="RegisterTel" ErrorMessage="11 haneli telinizi giriniz(0555 555 55 55)" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[0-9]{11,11}$"></asp:RegularExpressionValidator>
                                    <i style="position: absolute; top: 5px; right: 5px;" class="glyphicon glyphicon-phone"></i>
                                </div>


                            </td>
                        </tr>
                    <tr>
                        <td>
                            <div style="position: relative">
                                <asp:TextBox ID="RegisterAdres" runat="server" PlaceHolder="Adres" CssClass="inputTextArea" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="Register" ID="RequiredFieldValidator5" ControlToValidate="RegisterAdres" runat="server" ErrorMessage="Adres giriniz.." Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>


                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:Button ID="RegisterButton" ValidationGroup="Register" runat="server" Text="Kaydet" CssClass="btn-warning RegisterButton" OnClick="RegisterButton_Click" />
                            <br />
                            <asp:Label ID="RegisterErrorMsg" ValidationGroup="Register" runat="server" Text="" ForeColor="Red" Font-Size="XX-Small"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span style="color: red; text-align: center; font-size: 10px; display: none;" id="HataAlani">***Lütfen Tüm Alanları Doldurunuz....</span>
                        </td>

                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
