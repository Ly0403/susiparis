<%@ Page Title="Bayi Sayfası" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BayiSayfa.aspx.cs" Inherits="SuSiparis.Bayi.BayiSayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="BayiDiv">
        <h3 style="color:#ff6a00;font-family:'Times New Roman', Times, serif">Admin Panel</h3>
        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" ItemType="SuSiparis.Models.IdentityModels+ApplicationUser" DataKeyNames="UserName" SelectMethod="FormView1_GetItem">
            <ItemTemplate>
                
                <table class="table" style="width:50%;border:2px solid rgb(182, 255, 0)">
                    <tr>
                        <td style="vertical-align: top; text-align:left;">
                            <b>Tel:<%#:Item.PhoneNumber %></b>
                            <br />
                            <b>Adres:<%#:Item.UserAdres %></b>
                        </td>
                        <td style="vertical-align: top; text-align:left;">
                            <b><%#:Item.miktar %> adet damacana <br /> <%#:Item.miktarPompa %> adet pompa</b>
                            <br />
                            <b>Son Durum:<%#:Item.Durum %></b>
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="BayiDropdownList">
                                <asp:ListItem>Onayla</asp:ListItem>
                                <asp:ListItem>İptal</asp:ListItem>
                                <asp:ListItem>Yolda</asp:ListItem>
                                <asp:ListItem>Teslim Edildi</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Kaydet" CssClass="BayiDivButton" CommandName="GetData" CommandArgument="<%#:Item.UserName %>"/>
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
