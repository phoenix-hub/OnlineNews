<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="onlinenews.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <!-- Start WOWSlider.com HEAD section -->
    <!-- add to the <head> of your page -->
    <link href="themes/news%20slider/engine1/style.css" rel="stylesheet" />
    <script src="themes/news%20slider/engine1/jquery.js"></script>
    <!-- End WOWSlider.com HEAD section -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Start WOWSlider.com BODY section -->
    <!-- add to the <body> of your page -->
    <div class="featured">
        <h2 class="title">Featured News</h2>
        <div class="buffer">
            <div id="wowslider-container1">

                <div class="ws_images">
                    <ul>
                        <asp:Repeater ID="RepeatInformation" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><a href="<%# Eval("NewsId") %>">
                                    <asp:Image runat="server" ImageUrl='<%# Eval("NewsBanner") %>' alt="slider html" title='<%# Eval("NewsTitle") %>' ID="wows1_1" /></a></li>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <div class="ws_bullets">
                    <div>
                        <asp:Repeater ID="RepeaterBullets" runat="server">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="lnkBullets" href="#" title='<%# Eval("NewsTitle") %>'><span>1</span></asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="ws_script" style="position: absolute; left: -99%"></div>
                <div class="ws_shadow"></div>
            </div>
            <script type="text/javascript" src="themes/news%20slider/engine1/wowslider.js"></script>
            <script type="text/javascript" src="themes/news%20slider/engine1/script.js"></script>
            <!-- End WOWSlider.com BODY section -->

        </div>
    </div>




    <div class="articles">
        <h2 class="title">More Articles</h2>
        <!-- begin post -->


        <asp:Repeater ID="repeaterMoreNews" runat="server">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="post">
                    <div class="details">
                        <p class="l">
                            <span class="category"><a href="#">
                                <%# Eval("NewsCategory") %>
                            </a></span>- Posted by  
                <%# Eval("NewsPostedBy") %>
                        </p>
                        <p class="r">
                            <%# Eval("NewsPostedDate") %>
                        </p>
                    </div>

                    <div class="thumb">
                        <a href="#">
                            <img src='<%# Eval("NewsPoster") %>' alt="" />
                        </a>
                       
                    </div>
                    <h2><a href="#">
                        <%# Eval("morenewstitle") %></a></h2>
                    <p>
                        <%# Eval("NewsDescriptions") %>
                </div>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>

        <!-- end post -->
     
        <div class="break"></div>
    </div>
    <!-- begin post navigation -->
    <div class="postnav">
        <ul>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>
    <!-- end post navigation -->
</asp:Content>
