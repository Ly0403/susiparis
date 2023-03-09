<%@ Page Title="Kayıt/Giriş" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SuSiparis.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="loginWrapper">
        <ul class="tabs">
            <li class="active">Login</li>
            <li>Register</li>
        </ul>
        <ul class="tab__content">
            <li class="active">
                <div class="content__wrapper">
                    <ul class="list-group bg-body">
                        <li class="list-group-item">
                            <asp:TextBox ID="tbxUsername" runat="server" CssClass="inputText" PlaceHolder="Kullanıcı Adı"></asp:TextBox>

                        </li>
                        <li class="list-group-item">
                            <asp:TextBox ID="tbxPassword" runat="server" CssClass="inputText" PlaceHolder="Şifre" TextMode="Password"></asp:TextBox>
                        </li>
                        <li class="list-group-item">
                            <asp:Button ID="btnLogin" runat="server" Text="Giriş" OnClick="LoginButton_Click" CssClass="LoginButton" />
                        </li>
                        <li class="list-group-item"><a href="/PasswordRefresh.aspx">Şifremi Unuttum</a>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="lblLoginError" runat="server" Text="" CssClass="errorMessage"></asp:Label></li>
                    </ul>
                </div>
            </li>

            <li>
                <div class="content__wrapper">
                    <asp:UpdatePanel ID="registerForm" runat="server">
                        <ContentTemplate>
                            <ul class="list-group bg-body">
                                <li class="list-group-item">
                                    <asp:TextBox ID="tbxUsernameRegister" runat="server" PlaceHolder="Kullanıcı Adı" CssClass="inputText"></asp:TextBox>
                                </li>
                                <li class="list-group-item">
                                    <asp:TextBox ID="tbxEmailRegister" runat="server" CssClass="inputText" PlaceHolder="Email" TextMode="Email"></asp:TextBox>
                                </li>
                                <li class="list-group-item">
                                    <asp:TextBox ID="tbxPasswordRegister" runat="server" PlaceHolder="Şifre" CssClass="inputText" TextMode="Password"></asp:TextBox>
                                </li>
                                <li class="list-group-item">
                                    <asp:TextBox ID="tbxPhoneRegister" runat="server" CssClass="inputText" PlaceHolder="Cep Telefonu" TextMode="Phone"></asp:TextBox>
                                </li>
                                <li class="list-group-item">
                                    <asp:TextBox ID="tbxAddressRegister" runat="server" PlaceHolder="Adres" CssClass="inputTextArea" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </li>
                                <li class="list-group-item">
                                    <asp:Button ID="btnRegisterButton" runat="server" Text="Kaydet" CssClass="RegisterButton" OnClick="RegisterButton_Click" />
                                </li>
                                <li class="list-group-item">
                                    <asp:Label ID="lblRegisterError" runat="server" Text="" CssClass="errorMessage"></asp:Label>
                                </li>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </li>
        </ul>
    </section>
    <script>
        var clickedTab = $(".tabs > .active");
        var tabWrapper = $(".tab__content");
        var activeTab = tabWrapper.find(".active");
        var activeTabHeight = activeTab.outerHeight();
        activeTab.show();
        tabWrapper.height(activeTabHeight);
        $(".tabs > li").on("click", function () {
            $(".tabs > li").removeClass("active");
            $(this).addClass("active");
            clickedTab = $(".tabs .active");
            activeTab.fadeOut(250, function () {
                $(".tab__content > li").removeClass("active");
                var clickedTabIndex = clickedTab.index();
                $(".tab__content > li").eq(clickedTabIndex).addClass("active");
                activeTab = $(".tab__content > .active");
                activeTabHeight = activeTab.outerHeight();
                tabWrapper.stop().delay(50).animate({
                    height: activeTabHeight
                }, 500, function () {
                    activeTab.delay(50).fadeIn(250);
                });
            });
        });
    </script>
</asp:Content>

