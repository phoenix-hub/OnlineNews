<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="onlinenews.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Manage Users</h4>
                <br />
                <br />


                <table class="table table-striped">
                    <asp:Repeater ID="RepeaterUsers" runat="server">

                        <HeaderTemplate>

                            <tr>
                                <th>Profile</th>
                                <th>Name</th>
                                <th>DateOfBirth </th>
                                <th>MobileNo </th>
                                <th>Email </th>
                                <th>ActiveStatus </th>
                                <th>Manage</th>
                            </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr>
                                <td class="py-1">
                                    <img src="assets/images/faces-clipart/pic-1.png" />
                                </td>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Eval("DateOfBirth") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblMobileNo" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblActiveStatus" runat="server" Text='<%# Eval("ActiveStatus") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="btnDeleteUser" CssClass="btn btn-gradient-danger btn-sm" OnClick="btnDeleteUser_Click" runat="server" Text="Delete" />
                                    <asp:HyperLink CssClass="btn btn-gradient-success btn-sm" ID="lnkEdit" runat="server" NavigateUrl="#">Edit</asp:HyperLink>
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
