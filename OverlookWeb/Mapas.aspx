﻿ <%@ Page Title="" Language="C#" MasterPageFile="~/Overlook.Master" AutoEventWireup="true" CodeBehind="Mapas.aspx.cs" Inherits="OverlookWeb.Mapas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/resources/demos/style.css"/>
<style>
    #total{
        width:100%;
        margin:0;
        text-align:center
    }
    #menu #linkM{
        color:red;
    }
    table{
        margin:0 auto;
    }
    #total > h1,h2{
        color: black;
        font-size: 42px;
    }
    .probamela{
        object-fit: cover;
        height: 400px;
        width: 150px;
    }
    button{
        font-family:BigNoodle;
        width:60%;
        margin: 0 auto;
    }
    .Mbutton {
        background-color:black;
        font-family:BigNoodle;
        border:none;
        color:white;
        padding: 5px;
        font-weight:bold;
        font-size:5em;
        font-style:italic;
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
              runEffect(datalist)
              $(".Mbutton").on("click", function () {
                  $('#' + datalist).hide();
              });
          });

          $("#asaltos, #escoltas, #MapasControl, #MapasHibrido").hide();
      });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="total">
        <br />
        <button class="Mbutton" data-datalistid="asaltos" >Asalto</button>
        <asp:DataList RepeatColumns="3" ClientIDMode="Static" ID="asaltos" runat="server"  DataSourceID="AsaltoFuente">
            <ItemTemplate>
                <a href="ver_mapas.aspx?MID=<%#Eval ("ID_Mapa")%>"><img class="probamela" src="<%# Eval("Imagen")%>"/></a>
            </ItemTemplate>
        </asp:DataList>
        <br /><br />
        <button class="Mbutton" data-datalistid="escoltas" >Escolta</button>
        <asp:DataList RepeatColumns="3" ID="escoltas" ClientIDMode="Static" runat="server" DataSourceID="EscoltaFuente">
            <ItemTemplate>
                 <a href="ver_mapas.aspx?MID=<%# Eval("ID_Mapa") %>"> <img class="probamela" src="<%# Eval("Imagen") %>"/> </a>
            </ItemTemplate>
        </asp:DataList>
        <br /><br />
        <button class="Mbutton" data-datalistid="MapasControl" >Control</button>
        <asp:DataList RepeatColumns="3" ClientIDMode="Static" ID="MapasControl" runat="server" DataSourceID="ControlFuente">
            <ItemTemplate>
                <a href="ver_mapas.aspx?MID=<%#Eval ("ID_Mapa")%>" ><img class="probamela" src="<%# Eval("Imagen") %>" /></a> 
            </ItemTemplate>
        </asp:DataList>
        <br /><br />
        <button class="Mbutton" data-datalistid="MapasHibrido" >Hibrido</button>
        <asp:DataList RepeatColumns="4" ClientIDMode="Static" ID="MapasHibrido" runat="server" DataSourceID="HibridoFuente">
            <ItemTemplate>
                 <a href="ver_mapas.aspx?MID=<%#Eval ("ID_Mapa")%>"><img class="probamela" src="<%# Eval("Imagen") %>"/></a>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:SqlDataSource ID="AsaltoFuente" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [Mapa] WHERE ([Tipo] = @Tipo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Asalto" Name="Tipo" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="EscoltaFuente" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [Mapa] WHERE ([Tipo] = @Tipo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Escolta" Name="Tipo" Type="String"></asp:Parameter>


        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ControlFuente" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [Mapa] WHERE ([Tipo] = @Tipo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Control" Name="Tipo" Type="String"></asp:Parameter>


        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="HibridoFuente" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [Mapa] WHERE ([Tipo] = @Tipo)">
        <SelectParameters>
            <asp:Parameter DefaultValue="Asalto/Escolta" Name="Tipo" Type="String"></asp:Parameter>


        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>