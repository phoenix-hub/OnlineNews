<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="onlinenews.Admin.UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">User Profile</h4>
                    <div class="form-sample">
                        <p class="card-description">Personal info </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">First Name</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Last Name</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtLastName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Mid Name</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtMidName" runat="server" class="form-control" placeholder="Mid Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Date of Birth</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtDateOfBirth" runat="server" class="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <p class="card-description">Contact Details </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Email</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ReadOnly="true" ID="txtEmail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Mobile Number</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtMobileNo" runat="server" class="form-control" placeholder="Mobile Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="card-description">Address </p>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Address</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">City</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCity" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">State</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtState" runat="server" class="form-control" placeholder="State"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Country</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCountry" runat="server" class="form-control" placeholder="Country"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">ActiveStatus</label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="drpActiveStatus" runat="server" class="form-control">
                                            <asp:ListItem Value="Active">Active</asp:ListItem>
                                            <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                            <asp:ListItem Value="Suspended">Suspended</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <asp:Button ID="btnSave" runat="server" Text="Update" OnClick="btnSubmit_Click" class="btn btn-gradient-info btn-fw" />
                            &nbsp;
                            <a href="Index.aspx" class="btn btn-gradient-light btn-fw">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
