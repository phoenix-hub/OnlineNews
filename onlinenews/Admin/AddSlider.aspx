<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddSlider.aspx.cs" Inherits="onlinenews.Admin.AddSlider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">

        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">News Slider</h4>
                    <div class="form-sample">
                        <p class="card-description">Slider info </p>

                        <div class="alert alert-success" id="sucessDiv" runat="server">
                            <asp:Label ID="lblErrorGreen" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="alert alert-danger" id="dangerDiv" runat="server">
                            <asp:Label ID="lblErrorRed" runat="server" Text=""></asp:Label>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">News Title</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtNewsTitle" runat="server" class="form-control" placeholder="News Title"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Img Title</label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtImgTitle" runat="server" class="form-control" placeholder="Img Title"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label for="exampleTextarea1">Description</label></div>
                            <div class="col-md-10">
                                <asp:TextBox ID="txtDescription" runat="server" class="form-control" placeholder="Description" Style="width: 800px; height: 400px; margin: 10px 0 10px 0;"></asp:TextBox>
                                <ajax:HtmlEditorExtender ID="htmlExtender_Description" runat="server" BehaviorID="htmlExtender_Description" TargetControlID="txtDescription" EnableSanitization="false"></ajax:HtmlEditorExtender>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">NewsDateTime</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtNewsDateTime" runat="server" class="form-control" placeholder="DD/MM/YYYY HH:mm tt"></asp:TextBox>
                                    <br />
                                    <span style="font-size: 14px; color: red;">Please enter in given formate "DD/MM/YYYY HH:mm tt". &nbsp;
                                    </span>
                                    <br />
                                    <span style="font-size: 12px; color: red;">e.g.: 14/11/1992 11:23 AM
                                    </span>

                                </div>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">News Banner</label>
                                <div class="col-sm-9">
                                    <asp:FileUpload ID="flNewsBanner" runat="server" class="form-control" />

                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="card-description">Address </p>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Country</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtNewsCountry" runat="server" class="form-control" placeholder="Country"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">State</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtNewsState" runat="server" class="form-control" placeholder="State"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">City</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtNewsCity" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">District</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtNewsDistrict" runat="server" class="form-control" placeholder="District"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <%if (this.IsAdmin)
                            { %>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Is Active</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="drpIsActive" runat="server" class="form-control">
                                        <asp:ListItem Value="Active">Active</asp:ListItem>
                                        <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <div class="col-md-6">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">News Category</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="drpNewsCategory" runat="server" class="form-control">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="National">National</asp:ListItem>
                                        <asp:ListItem Value="International">International</asp:ListItem>
                                        <asp:ListItem Value="Regional">Regional</asp:ListItem>
                                        <asp:ListItem Value="BusinessAndFin">Business & Fin</asp:ListItem>
                                        <asp:ListItem Value="EconomicNews">Economic news</asp:ListItem>
                                        <asp:ListItem Value="EntsAndCeleb">Ents & Celeb</asp:ListItem>
                                        <asp:ListItem Value="HealthAndEducation">Health & Education</asp:ListItem>
                                        <asp:ListItem Value="ArtsAndCulture">Arts & Culture</asp:ListItem>
                                        <asp:ListItem Value="SportsNews">Sports news</asp:ListItem>
                                        <asp:ListItem Value="Politics">Politics</asp:ListItem>
                                        <asp:ListItem Value="ScienceAndTech">Science & Tech</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    </div>
                    <div class="row">
                        <asp:Button ID="btnSave" runat="server" Text="Add Slider" OnClick="btnSubmit_Click" class="btn btn-gradient-info btn-fw" />
                        &nbsp;
                            <a href="Index.aspx" class="btn btn-gradient-light btn-fw">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
