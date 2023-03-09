<%@ Page Title="Kullanıcı Detay ve Sipariş" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kullanici.aspx.cs" Inherits="SuSiparis.Siparis.Kullanici" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdateProgress ID="LoadingProcess" runat="server">
        <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
            <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 30%; top: 30%;border-radius:25px;">
                <img src="../Images/loading.gif" width="100" />
            </span>
        </div>
    </ProgressTemplate>
    </asp:UpdateProgress>
    <div style="position:relative;margin:20px;">
        <div style="left:100px;top:150px;background-color:antiquewhite;padding:50px;box-shadow: 0 14px 18px 0 rgba(61, 11, 127, 0.2), 0 16px 20px 0 rgba(61, 11, 127, 0.2);border-radius:5px;">
                <asp:FormView ID="FormView1" runat="server" ItemType="SuSiparis.Models.IdentityModels+ApplicationUser" DataKeyNames="UserName" SelectMethod="FormView1_GetItem">
                    <ItemTemplate>
                        <img src="../Images/<%#:Item.UserImg%>" style="width:100px;box-shadow: 0 4px 8px 0 rgba(255, 99, 71, 0.5), 0 6px 20px 0 rgba(255, 99, 71, 0.5);"/>                                  
                         <h3 style=""><%#:Item.UserName.ToUpper() %></h3>
                         <p class="kullaniciInfo">Mail:<%#:Item.Email %></p>
                        <p class="kullaniciInfo">Adres:<%#:Item.UserAdres %></p>
                        <p class="kullaniciInfo">Tel:<%#:Item.PhoneNumber %></p>
                       <p class="kullaniciInfo"><a href="#EditPanel">Profil Düzenle</a></p>
                    </ItemTemplate>
            </asp:FormView>
        </div>
        
    </div> 
    <div style="box-shadow: 0 4px 8px 0 rgba(255, 99, 71, 0.5), 0 6px 20px 0 rgba(255, 99, 71, 0.5);margin:10px;padding:10px;width:300px;background-color:aliceblue" id="EditPanel">
       <h4 style="text-align:center;">Profil Detayları</h4>
        <div style="padding:10px;margin-left:100px;">
            <asp:FormView ID="FormView2" runat="server" ItemType="SuSiparis.Models.IdentityModels+ApplicationUser" DataKeyNames="UserName" SelectMethod="FormView1_GetItem">
                <ItemTemplate>
                    <img src="../Images/<%#:Item.UserImg%>" style="margin:20px;width:100px;box-shadow: 0 4px 8px 0 rgba(255, 99, 71, 0.5), 0 6px 20px 0 rgba(255, 99, 71, 0.5);" />
               </ItemTemplate>
            </asp:FormView>
            <asp:FileUpload ID="FileUpload1" runat="server" Width="151px" />
            <br /> 
            <asp:Button ID="ResimYukle" runat="server" Text="Yükle" CssClass="yukleButon" OnClick="Upload" /><br />
         </div>
         <div style="padding:50px;">
                     <div>
                         <div>
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                                 <table  style="width:100%;">  
                                     <tr>
                                         <td>
                                             <asp:TextBox ID="UpdatePassword" PlaceHolder="Yeni Şifre" runat="server" CssClass="inputText" TextMode="Password"></asp:TextBox>
                                             <br />
                                            <asp:RegularExpressionValidator ValidationGroup="Update" ID="RegularExpressionValidator2" runat="server" ControlToValidate="UpdatePassword" ErrorMessage="En Az 6 karakterli şifre belirleyiniz.." Font-Size="XX-Small" ForeColor="Red" ValidationExpression="^[\s\S]{6,}$"></asp:RegularExpressionValidator>
                                            
                                         </td>
                                     </tr>
                                   <tr>
                                          <td>
                                              <asp:TextBox ID="UpdateAdres" ValidationGroup="Update" PlaceHolder="Yeni Adres" runat="server" TextMode="MultiLine" Rows="10" CssClass="inputTextArea"></asp:TextBox>
                                          </td>
                                          </tr>
                                   <tr><td><p> </p></td></tr>
                                           <tr>
                                            <td>
                                           <asp:Button ID="UpdateButton" ValidationGroup="Update" runat="server" Text="Güncelle" CssClass="btn-primary" Font-Size="XX-Small" OnClick="UpdateButton_Click"/>
                                           <asp:Label ID="UpdateLabelError" runat ="server" Text="" Font-Size="XX-Small" ForeColor="Red"></asp:Label>
                                       </td>
                                    </tr>
                                </table>
                             </ContentTemplate>

                             </asp:UpdatePanel> 
                         </div>
                          

                     </div> 
           </div>
   </div>
</asp:Content>
