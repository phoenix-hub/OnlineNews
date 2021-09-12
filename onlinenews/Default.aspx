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

            <%--<div id="wowslider-container1">
                <div class="ws_images">
                    <ul>
                        <li>
                            <img src="themes/news%20slider/data1/images/img1.jpg" alt="img1" title="img1" id="wows1_0" /></li>
                        <li><a href="http://wowslider.net">
                            <img src="themes/news%20slider/data1/images/img2.jpg" alt="slider html" title="img2" id="wows1_1" /></a></li>
                        <li>
                            <img src="themes/news%20slider/data1/images/img3.jpg" alt="img3" title="img3" id="wows1_2" /></li>
                    </ul>
                </div>
                <div class="ws_bullets">
                    <div>
                        <a href="#" title="img1"><span>
                            1</span></a>
                        <a href="#" title="img2"><span>
                            2</span></a>
                        <a href="#" title="img3"><span>
                           3</span></a>
                    </div>
                </div>--%>

            <div id="wowslider-container1">
                <asp:Repeater ID="RepeatInformation" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="ws_images">
                            <ul>

                                <li><a href="http://wowslider.net">
                                    <asp:Image runat="server" ImageUrl='<%# Eval("") %>' alt="slider html" title='<%# Eval("") %>' id="wows1_1" /></a></li>

                            </ul>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="ws_bullets">
                            <div>
                                <asp:HyperLink runat="server" ID="lnkBullets" href="#" title='<%# Eval("") %>'><span>1</span></asp:HyperLink>

                            </div>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
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
        <div class="post">
            <div class="details">
                <p class="l"><span class="category"><a href="#">Advertising</a></span> - Posted by <a href="#">Chiq Montes</a> on April 20, 2009 </p>
                <p class="r"><a href="#">21 Comments</a> </p>
            </div>
            <div class="thumb">
                <a href="#">
                    <img src="themes/images/_thumb1.jpg" alt="" /></a>
            </div>
            <h2><a href="#">Lorem Ipsum Dolor Sit Amet Libera Sequitor</a></h2>
            <p>Sed auctor, purus et elementum gravida, felis augue faucibus velit, nec aliquet leo tellus eget purus. Sed est metus, placerat at, commodo ut, ultrices cursus, mauris. Cum sociis natoque penatibus</p>
        </div>
        <!-- end post -->
        <!-- begin post -->
        <div class="post">
            <div class="details">
                <p class="l"><span class="category"><a href="#">Advertising</a></span> - Posted by <a href="#">Chiq Montes</a> on April 20, 2009 </p>
                <p class="r"><a href="#">21 Comments</a> </p>
            </div>
            <div class="thumb">
                <a href="#">
                    <img src="themes/images/_thumb2.jpg" alt="" /></a>
            </div>
            <h2><a href="#">Lorem Ipsum Dolor Sit Amet Libera Sequitor</a></h2>
            <p>Sed auctor, purus et elementum gravida, felis augue faucibus velit, nec aliquet leo tellus eget purus. Sed est metus, placerat at, commodo ut, ultrices cursus, mauris. Cum sociis natoque penatibus</p>
        </div>
        <!-- end post -->
        <!-- begin post -->
        <div class="post">
            <div class="details">
                <p class="l"><span class="category"><a href="#">Advertising</a></span> - Posted by <a href="#">Chiq Montes</a> on April 20, 2009 </p>
                <p class="r"><a href="#">21 Comments</a> </p>
            </div>
            <div class="thumb">
                <a href="#">
                    <img src="themes/images/_thumb3.jpg" alt="" /></a>
            </div>
            <h2><a href="#">Lorem Ipsum Dolor Sit Amet Libera Sequitor</a></h2>
            <p>Sed auctor, purus et elementum gravida, felis augue faucibus velit, nec aliquet leo tellus eget purus. Sed est metus, placerat at, commodo ut, ultrices cursus, mauris. Cum sociis natoque penatibus</p>
        </div>
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
