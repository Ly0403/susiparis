<%@ Page Title="Mail Onay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MailConfirm.aspx.cs" Inherits="SuSiparis.Siparis.MailConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <p style="font-size:12px;color:red;">
                Email adresiniz kontrol edilmiştir.             
            </p>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
            <p class="text-danger">
                Hata Oluştu.
            </p>
        </asp:PlaceHolder>
    </div>
</asp:Content>
