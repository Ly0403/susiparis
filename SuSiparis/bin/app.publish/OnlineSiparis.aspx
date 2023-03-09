<%@ Page Title="Online Sipariş" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OnlineSiparis.aspx.cs" Inherits="SuSiparis.OnlineSiparis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="modal-body">
                    <img src="Images/siparisPic.png" style="width: 200px; border-radius: 50px; margin-left: 25%; margin-top: 30px;" />
                    <div class="siparisForm" runat="server" id="siparisOffline">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <p style="font-size: 10px; text-align: center; color: black">[Telefon Numarınızı Girip Kaydettikten Sonra Siparişiniz Şubemize İletilecektir.]</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <hr style="background-color: black;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="SiparisTel" runat="server" CssClass="inputText" PlaceHolder="Telefon Numarası" TextMode="Phone"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ValidationGroup="Siparis" ID="RequiredFieldValidator9" ControlToValidate="SiparisTel" runat="server" ErrorMessage="Telinizi giriniz" Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ValidationGroup="Siparis" ID="SiparisTelRegular" runat="server" ControlToValidate="SiparisTel" ErrorMessage="11 haneli telinizi giriniz(0555 555 55 55)" Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[0-9]{11,11}$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="SiparisSifre" runat="server" CssClass="inputText" PlaceHolder="Parola" TextMode="Password"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ValidationGroup="Siparis" ID="RequiredFieldValidator8" ControlToValidate="SiparisSifre" runat="server" ErrorMessage="Şifrenizi Giriniz..." Font-Size="XX-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ValidationGroup="Siparis" ID="siparissifreregular" runat="server" ControlToValidate="SiparisSifre" ErrorMessage="En Az 6 karakterli şifre belirleyiniz.." Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ListView ID="orderListView" DataKeyNames="ProductId" runat="server" SelectMethod="orderListView_GetData" ItemType="SuSiparis.Models.Product">
                                                <ItemTemplate>
                                                    <img src="UserManager/photo/<%#:Item.ProductImgFilename %>" width="50" />
                                                    <asp:Label ID="lblProductNameOfflineSale" runat="server" Text="<%#:Item.ProductName %>"></asp:Label>
                                                    <asp:DropDownList ID="dropdownOrderAmount" runat="server" CssClass="DamacanaMiktar" ValidationGroup="Siparis">
                                                        <asp:ListItem>0</asp:ListItem>
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                        <asp:ListItem>6</asp:ListItem>
                                                        <asp:ListItem>7</asp:ListItem>
                                                        <asp:ListItem>8</asp:ListItem>
                                                        <asp:ListItem>9</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <hr style="background-color: #b6ff00" />
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <p></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="SiparisButton" ValidationGroup="Siparis" runat="server" Text="Sipariş Ver" CssClass="btn btn-warning" OnClick="SiparisButton_Click" />
                                            <br />
                                            <asp:Label ID="SiparisError" runat="server" Text="" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <hr style="background-color: black;" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="siparisForm" runat="server" id="siparisOnline">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:ListView ID="onlineOrderListView" DataKeyNames="ProductId" runat="server" SelectMethod="orderListView_GetData" ItemType="SuSiparis.Models.Product">
                                                <ItemTemplate>
                                                    <img src="UserManager/photo/<%#:Item.ProductImgFilename %>" width="50" />
                                                    <asp:Label ID="lblProductNameOnlineSale" runat="server" Text="<%#:Item.ProductName %>"></asp:Label>
                                                    <asp:DropDownList ID="dropdownOrderAmountOnline" runat="server" CssClass="DamacanaMiktar" ValidationGroup="Siparis">
                                                        <asp:ListItem>0</asp:ListItem>
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                        <asp:ListItem>6</asp:ListItem>
                                                        <asp:ListItem>7</asp:ListItem>
                                                        <asp:ListItem>8</asp:ListItem>
                                                        <asp:ListItem>9</asp:ListItem>
                                                        <asp:ListItem>0</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <hr style="background-color: #b6ff00" />
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="OnlineSiparisButton" runat="server" Text="Siparis Ver" CssClass="btn btn-warning" OnClick="OnlineSiparisButton_Click" />
                                            <br />
                                            <asp:Label ID="OnlineSiparisError" runat="server" Text="" Font-Size="XX-Small" ForeColor="Red"></asp:Label>

                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>


</asp:Content>
