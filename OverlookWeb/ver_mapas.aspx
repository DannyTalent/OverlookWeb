﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Overlook.Master" AutoEventWireup="true" CodeBehind="ver_mapas.aspx.cs" Inherits="OverlookWeb.ver_mapas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="DataList1" runat="server" DataSourceID="MapasSource">
        <ItemTemplate>
           <style>
               .Form{
                   box-sizing: border-box;
               }
               #cph{
                   overflow:hidden;
               }
               .fondo{
                    background-image:url("<%# Eval("Imagen") %>");
                    background-size: cover;
                    display:block;
                    filter: blur(5px);
                    min-height: 800px;
                    left: 0;
                    right: 0;
                    z-index: 1;
                    position:inherit;
                }
                #centro{
                    z-index: 2;
                    height:50%;
                    border-radius: 3px;
                    border: solid black 1.5px;
                    background: rgba(255, 255, 255, 0.70);
                    margin: 3%;
                    padding: 10px;
                    position: absolute;
                    max-height:90%;
                    overflow:auto;
                    top: 33%;
                    width:82%;
                }
                #centro  h1{
                    font-size: 35px;
                    border-bottom: solid black 1px;
                }
                #descripcion{
                    font-family: Arial;
                    font-size: 18px;
                    float: left;
                    width: 74%; 
                }
                #CuadroDer{
                    border: solid black 1.5px;
                    border-radius: 3.5px;
                    margin-left: 74%;
                    max-width: 25%;                    
                }
                #imagen{
                    padding: 5px;
                    max-width: 500px;
                    max-height: 400px;
                }
                #CuadroTop{
                    border-top: none;
                    border-bottom: solid black 1px;
                    text-align: center;
                    color: black;
                    background-color: #FCBD49;
                    margin:0;
                }
                .Cseccion{
                    border-top: solid black 1px;
                    border-bottom: solid black 1px;
                    padding-left: 3px;
                    text-align: center;
                    font-size:24px;
                    color: black;
                    background-color: #FCBD49;
                    margin:0;
                }
                #tipo{
                    font-size: 20px;
                    text-align: left;
                    padding-left:7px;
                }

            </style>
            
            <div class="fondo"></div>

            <div id="centro">

                <h1><%#Eval("Nombre") %></h1>
                <div id="descripcion"><%# Eval("Descripcion") %></div>
                
                <div id="CuadroDer">
                    <h2 id="CuadroTop"><%#Eval ("Nombre") %></h2>
                    <div id="imagen"> 
                        <img width="100%" src="<%# Eval("imagen")%>" />
                    </div>
                    <h2 class="Cseccion">Tipo</h2>
                    <a id="tipo"><%#Eval("Tipo") %></a>
                    <h2 class="Cseccion">Mejores Héroes</h2>
                    <a>Ataque: </a>
                    <p id="HAtaque">
                        <asp:Repeater ID="FormView2" runat="server" DataSourceID="HeroesSource">
                            <ItemTemplate>
                                <img src="<%#Eval("ImagenH") %>" height="100"/>
                            </ItemTemplate>
                        </asp:Repeater>
                    </p>
                    <a>Defensa: </a>
                    <p id="HDefensa">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="HeroesDSource">
                            <ItemTemplate>
                                <img src="<%#Eval("ImagenH") %>" height="100" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </p>
                </div>
                <h1>Callouts</h1>
                <p style="font-size:18px">Actualmente los "Callouts" o zonas de cada mapa se estan formando por la comunidad del juego, por lo que es probable que en algunos mapas aún no se hayan establecido los Callouts. La página con los Callouts más oficiales del juego es <a href="http://52.208.252.11/" >Kings Row</a></p>
                <asp:DataList RepeatColumns="2" ID="Callouts" runat="server" DataSourceID="CalloutsSource">
                    <ItemTemplate>
                        <img style="height:300px; width:500px"  src="<%#Eval("ImagenC") %>" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="MapasSource" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [Mapa] WHERE ([ID_Mapa] = @ID_Mapa)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="MID" Name="ID_Mapa" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="HeroesSource" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [MapaXHeroeA] WHERE ([ID_Maopa] = @ID_Maopa)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="MID" Name="ID_Maopa" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="HeroesDSource" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [MapaXHeroeD] WHERE ([ID_Maopa] = @ID_Maopa)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="MID" Name="ID_Maopa" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CalloutsSource" runat="server" ConnectionString='<%$ ConnectionStrings:OverlookConnectionString %>' SelectCommand="SELECT * FROM [MapaXCallout] WHERE ([ID_Mapa] = @ID_Mapa)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="MID" Name="ID_Mapa" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
