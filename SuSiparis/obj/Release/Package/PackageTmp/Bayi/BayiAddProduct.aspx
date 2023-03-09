<%@ Page Title="Bayi Ürün Ekleme" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BayiAddProduct.aspx.cs" Inherits="SuSiparis.Bayi.BayiAddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <h4>Ürün Ekle</h4>
                <table class="table table-hover table-dark">
                    <tr>
                        <td>Ürün Adı
                        </td>
                        <td>
                            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Stock Adeti
                        </td>
                        <td>
                            <asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ürün Fiyatı
                        </td>
                        <td>
                            <asp:TextBox ID="txtFiyat" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ürün Resmi
                        </td>
                        <td>
                            <asp:FileUpload ID="uplProductImg" runat="server" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button ID="btnAddProduct" runat="server" Text="Ürünü Ekle" CssClass="btn btn-success" OnClick="btnAddProduct_Click" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <asp:Label runat="server" ID="lblAddProductResellerError" Text=""></asp:Label>
                    </tr>

                </table>
            </div>
            <div class="col-lg-1">

            </div>
            <div class="col-lg-7">
                <h4>Eklenen Ürünler</h4>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <asp:ListView ID="listviewAddedPRoducts" DataKeyNames="ProductId" SelectMethod="listviewAddedPRoducts_GetData" runat="server" ItemType="SuSiparis.Models.Product">
                            <ItemTemplate>
                                <ul class="list-group mt-2">
                                    <li class="list-group-item">
                                        <label>Ürün No</label>
                                        <asp:Label ID="lblProductIdUpdate" runat="server" Text="<%#:Item.ProductId %>"></asp:Label>
                                        <asp:Button runat="server" ID="btnProductDelReseller" CssClass="btn btn-danger btn-sm float-end" Text="Ürünü Sil"
                                            OnClick="btnDelete_Click" />
                                    </li>
                                    <li class="list-group-item">
                                        <asp:TextBox ID="txtProductNameUpdate" runat="server" Text="<%#:Item.ProductName.ToUpper() %>"></asp:TextBox>
                                    </li>
                                    <li class="list-group-item">
                                        <asp:TextBox ID="txtProductAmountUpdate" runat="server" Text="<%#:Item.Stock %>"></asp:TextBox>
                                    </li>
                                    <li class="list-group-item">
                                        <asp:TextBox ID="txtProductPriceUpdate" runat="server" Text="<%#:Item.Price %>"></asp:TextBox>
                                    </li>
                                    <li class="list-group-item">
                                        <img src="/UserManager/photo/<%#:Item.ProductImgFilename %>" style="width: 100px; height: 150px" />
                                        <asp:FileUpload ID="uploadProductImgUpdate" runat="server" />
                                        <asp:Button runat="server" ID="btnProductUpdateReseller"
                                            CssClass="btn btn-warning btn-sm float-end" Text="Ürünü Güncelle" OnClick="updateStock_Click" CommandArgument="<%#:Item.ProductImgFilename %>"/>
                                    </li>
                                    <li class="list-group-item">
                                        <asp:Label runat="server" ID="lblUpdateProductResellerError" Text=""></asp:Label>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:ListView>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
