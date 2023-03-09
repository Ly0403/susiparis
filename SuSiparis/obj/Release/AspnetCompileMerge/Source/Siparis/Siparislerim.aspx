<%@ Page Title="Siparişlerim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Siparislerim.aspx.cs" Inherits="SuSiparis.Siparis.Siparislerim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
        <div class="siparisDetay">
            <h3 style="color:#ff6a00;font-family:'Times New Roman', Times, serif;margin-left:30px;">Siparişlerim</h3>
            <asp:ListView ID="ListView1" runat="server" ItemType="SuSiparis.Models.IdentityModels+ApplicationUser" DataKeyNames="UserName" SelectMethod="ListView1_GetData">
                <EmptyItemTemplate>
                    <h6>Siparisiniz Bulunamamktadır.</h6>
                </EmptyItemTemplate>
                <ItemTemplate>
                    <ul>
                        <li style="opacity:1;color:darkred">
                            <b><%#:Item.miktar %> ADET DAMACANA VE <%#:Item.miktarPompa %> ADET POMPA SİPARİŞİNİZ BULUNMAKTADIR.</b>
                        </li>                  

                    </ul>
                    
                </ItemTemplate>
            </asp:ListView> 
            <asp:Label ID="Label1" runat="server" Text="ALINDI" CssClass="siparisLabel" Width="100"></asp:Label>
             <asp:Label ID="Label2" runat="server" Text="ONAYLANDI" CssClass="siparisLabel" Width="100"></asp:Label>
             <asp:Label ID="Label3" runat="server" Text="YOLDA" CssClass="siparisLabel" Width="100"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="IPTAL" CssClass="siparisLabel" Width="100" OnClick="Button1_Click" />    
        </div>


    <script>
        setTimeout("location.reload(true);", 5000);
    </script>
</asp:Content>
