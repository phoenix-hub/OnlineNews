<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageMoreNews.aspx.cs" Inherits="onlinenews.Admin.ManageMoreNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Manage More News</h4>

                <div class="alert alert-success" id="sucessDiv" runat="server">
                    <asp:Label ID="lblErrorGreen" runat="server" Text=""></asp:Label>
                </div>
                <div class="alert alert-danger" id="dangerDiv" runat="server">
                    <asp:Label ID="lblErrorRed" runat="server" Text=""></asp:Label>
                </div>

                <a href="#" class="btn btn-info btn-fw" style="float: right; margin-bottom: 10px;">Add New
                </a>

                <br />
                <br />

                <table class="table table-striped">
                    <asp:Repeater ID="RepeaterMoreNews" runat="server">

                        <HeaderTemplate>

                            <tr>
                                <th>News Title</th>
                                <th>News Banner</th>
                                <th>News Description</th>
                                <th>News Location </th>
                                <th>IsActive </th>
                                <th>Created By</th>
                                <th>Created On</th>
                                <th>Manage</th>
                            </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("NewsTitle") %>'></asp:Label>
                                    <asp:Label ID="lblNewsId" runat="server" Text='<%# Eval("NewsId") %>' Enabled="false" Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <a href='<%# Eval("NewsBanner") %>' target="_blank">
                                        <asp:Image ImageUrl='<%# Eval("NewsBanner") %>' ID="imgBannerImage" runat="server" />
                                    </a>
                                </td>
                                <td>
                                    <asp:Label ID="lblNewsDescription" runat="server" Text='<%# Eval("NewsDescription") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("NewsLocation") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblActiveStatus" runat="server" Text='<%# Eval("CreatedBy") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblCreatedOn" runat="server" Text='<%# Eval("CreatedOn") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnDeleteSlider" CssClass="btn btn-gradient-danger btn-sm" OnClick="btnDeleteSlider_Click" runat="server" Text="Delete" />
                                    <a class="btn btn-gradient-success btn-sm" href="UpdateSlider.aspx?id=<%# Eval("NewsId") %>">Edit</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
