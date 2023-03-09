<%@ Page Title="Ana Sayfa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SuSiparis._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="anaSayfaDiv1">
        <h3>Hoşgeldiniz</h3>
        <p>
            Online Damacana Sipariş Sitesite Hoşgeldiniz.  
        </p>
        <p>
            Hızlı ve güvenli 
                        damacana su, litrelik su ve diğer yan ürünlerin siparişini
                        sitemizden kolaylık ile verebilirsiniz.
        </p>
    </div>
    <div class="anaSayfaDiv1" style="background-color: lavenderblush; text-align: center">
        <img src="Images/damacana.png" width="100" />
        <p>Damacana[7Lt]</p>
        <p>50,00 &#8378;</p>

    </div>
    <div class="anaSayfaDiv1" style="background-color: lavenderblush; text-align: center">
        <img src="Images/supompasi.png" width="200" />
        <p>Damacana Pompası</p>
        <p>20,00 &#8378;</p>
    </div>
    <div id="MyCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="MyCarousel" data-slide-to="0" class="active"></li>
            <li data-target="MyCarousel" data-slide-to="1"></li>
            <li data-target="MyCarousel" data-slide-to="2"></li>
            <li data-target="MyCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="anaSayfaDiv1 item active" style="background-color: azure">
                <h3>Kayıt ve Giriş</h3>
                <p>
                    Kayıt Bölümünden kendinize yeni bir hesap oluşturup
                        siparişlerinizi oluşturmaya başlayabilirsiniz.
                </p>
                <p>
                    Tek yapmanız gereken kendiniz ile ilgili bilgileri doldurup
                    mail adresinize gelen onay link ile hesabınızı aktifleştirebilirsiniz.
                </p>
                <p>
                    Aynı zamanda oluşturmuş olduğunuz hesap ile daha sonraki bölümde
                    açıklanacak şekilde siparişinizi takip edebilirsiniz.
                </p>
            </div>
            <div class="anaSayfaDiv1 item">
                <h3>Siparişlerim</h3>
                <p>
                    Siparişlerim bölümü kullanıcı hesabınız ile giriş yapınca aktif
                        olacaktır.
                </p>
                <p>
                    Siparişlerim bölümünden vermiş olduğunuz siparişi bayi tarafından
                    onaylanmadığı sürece iptal edebilirsiniz. 
                </p>
                <p>
                    Bayi Onayından itibaren siparişinizin yola çıkma ve teslim durumunu
                    kontrol edebilirsiniz.
                </p>
            </div>
            <div class="anaSayfaDiv1 item" style="background-color: azure">
                <h3>Profil</h3>
                <p>
                    Profil Sayfanızda oluşturmuş olduğunuz hesap ilgili
                        detaylara ulaşabilirsiniz.
                </p>
                <p>
                    Hesabınızı oluşturduğunuz zaman profil sayfasından profil resmi yükleyebilir,
                    adresinizi veya şifrenizi güncelleyebilirsiniz.
                </p>

            </div>
            <div class="anaSayfaDiv1 item">
                <h3>Bayi</h3>
                <p>
                    Bayi Sayfamıza sadece su dağıtımı yapan firma yetkilileri ulaşabilir.
                </p>
                <p>
                    Bu sayfa içerisinden bayi yetkilisi siparişleri görüntüleyebilir,
                    ve her aşama ile ilgili detayları müşterilerin ulaşması için 
                    paylaşabilir.
                </p>
            </div>
        </div>
        <a class="left carousel-control" href="#MyCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Önceki</span>
        </a>
        <a class="right carousel-control" href="#MyCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Sonraki</span>
        </a>

    </div>
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <div style="background-color: aliceblue; height: auto; padding:20px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <h3>Site Yorumları</h3>
                        <asp:ListView ID="YorumlarListview" DataKeyNames="UserName" SelectMethod="YorumlarListview_GetData" runat="server" ItemType="SuSiparis.Models.YorumModel+Yorumlar">

                            <ItemTemplate>
                                <p style="font-size: 20px;">
                                    <b><%#:Item.Yorum %></b>
                                </p>
                                <p>
                                    <i>Yorum <%#:Item.UserName %> tarafından yazılmıştır.</i>
                                </p>
                                <hr style="background-color: #b6ff00" />
                            </ItemTemplate>
                        </asp:ListView>
                        <div class="PagerYorum">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="YorumlarListview" PageSize="3">
                                <Fields>
                                    <asp:NumericPagerField ButtonType="Button" NextPageText="Sonraki" PreviousPageText="Önceki" CurrentPageLabelCssClass="btn-danger" NextPreviousButtonCssClass="btn-primary" NumericButtonCssClass="bg-success" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                        <hr style="background-color: #b6ff00" />
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:TextBox ID="YorumUserName" PlaceHolder="Adınız Soyadınız" CssClass="inputText" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="YorumText" PlaceHolder="Yorumunuz" runat="server" TextMode="MultiLine" Rows="10" CssClass="inputTextArea"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="YorumButton" runat="server" Text="Yorum Yap" CssClass="btn-success" OnClick="YorumButton_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="YorumError" runat="server" Text="" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>



</asp:Content>
