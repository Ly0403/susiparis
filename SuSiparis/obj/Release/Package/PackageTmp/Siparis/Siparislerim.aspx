<%@ Page Title="Siparişlerim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Siparislerim.aspx.cs" Inherits="SuSiparis.Siparis.Siparislerim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
        <div class="siparisDetay">
            <h3 style="color:#ff6a00;font-family:'Times New Roman', Times, serif;margin-left:30px;">Siparişlerim</h3>
            <asp:ListView ID="listviewCustomerOrders" runat="server" ItemType="SuSiparis.Models.Order" DataKeyNames="OrderId" SelectMethod="ListView1_GetData">
                <EmptyItemTemplate>
                    <h6>Siparisiniz Bulunamamktadır.</h6>
                </EmptyItemTemplate>
                <ItemTemplate>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b><%#:Item.OrderAmount %> ADET <%#:Item.ProductName.ToUpper() %> SİPARİŞİNİZ BULUNMAKTADIR.</b>
                        </li> 
                        <li class="list-group-item">
                            <b>Siparişiniz <%#:Item.OrderStatus %></b>
                        </li>
                        <li class="list-group-item">
                            <asp:Button runat="server" Text="İptal" ID="btnCancelOrderCustomer" CssClass="btn btn-danger" OnClick="btnCancelOrderCustomer_Click" CommandArgument="<%#:Item.OrderId %>"/>
                        </li>
                    </ul>
                </ItemTemplate>
            </asp:ListView>    
        </div>


    <script>
        setTimeout("location.reload(true);", 5000);
    </script>
</asp:Content>
