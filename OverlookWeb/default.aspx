﻿<%@ Page Title="dsdsxs" Language="C#" MasterPageFile="~/Overlook.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="OverlookWeb._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style>
        #contenedorDefault{
            background-image: url(http://www.hdwallpaper.nu/wp-content/uploads/2016/05/u7GYupt.png );
            background-size: 152vh 100vh;
            background-repeat:no-repeat;
            min-width:100vh;
            min-height:100vh;
        }
        #heroes{
            min-width:100vh;
            min-height:100vh;
        }
        .imgAtributo{
            width:100px;
        }
        .atributos{
            float:left;
            padding:11.1vh;
        }
        button{
            border-radius:2vh;
            background-color:black;
            color:white;
        }
        button:hover {
            background-color: #FCBD49;
        }
        .imagenCss{
            height:100px;
        }
        img{
            object-fit:cover;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
      $(function () {
          // run the currently selected effect
          function runEffect(datalist) {

              var options = {};

              $("#" + datalist).show("fade", options, 500, callback);
          };

          //callback function to bring a hidden box back
          function callback() {
              setTimeout(function () {
                  $("#effect:visible")
              }, 0);
          };

          // Set effect from select menu value
          $(".Mbutton").on("click", function (e) {
              e.preventDefault();
              var datalist = $(this).attr("data-datalistid");
              runEffect(datalist);
          });

          $("#ataque, #defensa, #tank, #healer").hide();
      });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contenedorDefault">
        <header class="headMenu">Heroes</header>
        <div id="heroes">
            <div class="atributos">
                <button class="Mbutton"><img class="imgAtributo" src="http://owinfinity.com/wp-content/themes/overwatch-theme/assets/images/icons/skill-common/flip-attack-large.png" />
                <p>Ataque</p></button>
                
                
            </div>
            <div class="atributos">
                <button class="Mbutton"><img class="imgAtributo" src="http://owinfinity.com/wp-content/themes/overwatch-theme/assets/images/icons/skill-common/flip-defense-large.png" />
                <p>Defensa</p></button>
            </div>
            <div class="atributos">
                <button class="Mbutton"><img class="imgAtributo" src="http://owinfinity.com/wp-content/themes/overwatch-theme/assets/images/icons/skill-common/flip-tank-large.png" />
                <p>Tank</p></button>
            </div>
            <div class="atributos">
                <button class="Mbutton"><img class="imgAtributo" src="http://www.overwatchgg.com/wp-content/uploads/2016/06/flip-support-large.png" />
                <p>Healer</p></button>
            </div>
            <asp:DataList RepeatColumns="7" ID="ataque" runat="server" DataKeyField="ID_Heroe" DataSourceID="sdsAtaque">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                        <img class="imagenCss" src="<%#Eval ("Imagen") %>" /><br />
                    </ItemTemplate>
            </asp:DataList>
            <asp:DataList RepeatColumns="6" ID="defensa" runat="server" DataKeyField="ID_Heroe" DataSourceID="sdsDefensa">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                    <img class="imagenCss" src="<%# Eval("Imagen") %>"/><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:DataList RepeatColumns="5" ID="tank" runat="server" DataKeyField="ID_Heroe" DataSourceID="sdsTank">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                    <img class="imagenCss" src="<%# Eval("Imagen") %>"/><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:DataList RepeatColumns="5" ID="healer" runat="server" DataKeyField="ID_Heroe" DataSourceID="sdsHealer">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                    <img class="imagenCss" src="<%# Eval("Imagen") %>"/><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource runat="server" ID="sdsHealer" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT [ID_Heroe], [Nombre], [Rol], [Imagen] FROM [Heroe] WHERE ([Rol] = @Rol)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Rol" DefaultValue="Healer" Name="Rol" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="sdsTank" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT [ID_Heroe], [Nombre], [Rol], [Imagen] FROM [Heroe] WHERE ([Rol] = @Rol)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Rol" DefaultValue="Tank" Name="Rol" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="sdsDefensa" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT [ID_Heroe], [Nombre], [Rol], [Imagen] FROM [Heroe] WHERE ([Rol] = @Rol)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Rol" DefaultValue="Defensa" Name="Rol" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="sdsAtaque" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT [ID_Heroe], [Rol], [Nombre], [Imagen] FROM [Heroe] WHERE ([Rol] = @Rol)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="Rol" DefaultValue="Ataque" Name="Rol" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>