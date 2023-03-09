<%@ Page Title="Bayi Sayfası" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BayiSayfa.aspx.cs" Inherits="SuSiparis.Bayi.BayiSayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="BayiDiv">
        <h3 style="color: #ff6a00; font-family: 'Times New Roman', Times, serif">Admin Panel</h3>
        <asp:ListView ID="listviewBayiSiparisList" runat="server" ItemType="SuSiparis.Models.Order" DataKeyNames="OrderId" SelectMethod="FormView1_GetItem">
            <ItemTemplate>
                <table class="table" style="width: 50%; border: 2px solid rgb(182, 255, 0)">
                    <tr>
                        <td style="vertical-align: top; text-align: left;">
                            <asp:Label ID="lblOrderIdResellerPage" runat="server" Text="<%#:Item.OrderId %>" Visible="false"></asp:Label>
                            Müşteri :<asp:Label ID="lblCustomerNameResellerPage" runat="server" Text="<%#:Item.CustomerName %>"></asp:Label>
                            <br />
                            <b>Müşteri Adres:<%#:Item.CustomerAddress %></b>
                            <br />
                            <b>Müşteri Telefon:<%#:Item.CustomerPhone %></b>
                        </td>
                        <td style="vertical-align: top; text-align: left;">
                            <b><%#:Item.OrderAmount %> adet <%#:Item.ProductName %>
                                <br />
                                <b>Son Durum:<%#:Item.OrderStatus %></b>
                                <br />
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="BayiDropdownList">
                                    <asp:ListItem>Onayla</asp:ListItem>
                                    <asp:ListItem>İptal</asp:ListItem>
                                    <asp:ListItem>Yolda</asp:ListItem>
                                    <asp:ListItem>Teslim Edildi</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button runat="server" ID="btnUpdateOrderStatusReseller" Text="Kaydet" CssClass="btn btn-sm btn-dark" OnClick="DropDownList1_SelectedIndexChanged"/>
                                </td>
                    </tr>
                </table>
            </ItemTemplate>

        </asp:ListView>


    </div>
    <script>
        setTimeout("location.reload(true);", 15000);
    </script>
</asp:Content>
