<%@ Page Title="Ana Sayfa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SuSiparis._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="MyCarousel" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
            <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
            <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="3" aria-label="Slide 3" class=""></button>
            <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="4" aria-label="Slide 3" class=""></button>
        </div>
        <div class="carousel-inner">
            <div class="anaSayfaDiv1 carousel-item item active">
                <h3>Hoşgeldiniz</h3>
                <p>
                    Online Su Sipariş Sitemize Hoşgeldiniz.  
                </p>
                <p>
                    Hızlı ve güvenli 
                        damacana su, litrelik su ve diğer yan ürünlerin siparişini
                        sitemizden kolaylık ile verebilirsiniz.
                </p>
            </div>
            <div class="anaSayfaDiv1 item carousel-item" style="background-color: azure">
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
            <div class="anaSayfaDiv1 item carousel-item">
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
            <div class="anaSayfaDiv1 item carousel-item" style="background-color: azure">
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
            <div class="anaSayfaDiv1 item carousel-item">
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
        <button class="carousel-control-prev" type="button" data-bs-target="#MyCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Önceki</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#MyCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Sonraki</span>
        </button>

    </div>

    <!-- end of carousel-->
    <div class="container">
        <div class="row">
            <div class="col2">
                <ul class="list-inline">
                    <asp:ListView ID="listviewProducts" DataKeyNames="ProductId" SelectMethod="listviewProducts_GetData" runat="server" ItemType="SuSiparis.Models.Product">
                        <ItemTemplate>
                            <li class="list-inline-item floatLeftList mx-2 p-3">
                                <ul class="list-group list-inline">
                                    <li class="list-group-item">
                                        <img src="UserManager/photo/<%#:Item.ProductImgFilename %>" style="width: 100px; height: 150px" />
                                    </li>
                                    <li class="list-group-item">
                                        <p class="h6 text-primary"><%#:Item.ProductName.ToUpper() %></p>
                                    </li>
                                    <li class="list-group-item">
                                        <p class="errorMessage">Fiyatı: <%#:Item.Price %> &#x20BA;</p>
                                    </li>
                                    <li class="list-group-item">
                                        <p class="errorMessage">Stok Adeti: <%#:Item.Stock %></p>
                                    </li>
                                </ul>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </div>
        <div class="row">
            <asp:DataPager ID="DataPager2" runat="server" PagedControlID="listviewProducts" PageSize="200">
                <Fields>
                    <asp:NumericPagerField ButtonType="Button" NextPageText="Sonraki" PreviousPageText="Önceki" CurrentPageLabelCssClass="btn-danger" NextPreviousButtonCssClass="btn-primary" NumericButtonCssClass="bg-success" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <div style="background-color: cadetblue; height: auto; padding: 20px">
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
                                    <asp:Button ID="YorumButton" runat="server" Text="Yorum Yap" CssClass="btn btn-sm btn-success" OnClick="YorumButton_Click" />
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
