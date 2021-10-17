<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="manage-video.aspx.cs" Inherits="onlinenews.Admin.manage_video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Set Deshboard Video</h4>
                <p class="card-description">set youtube video for news portal in home page </p>
                <div class="forms-sample">
                    <div class="form-group">
                        <label>Copy and paste youtube link here</label>
                        <asp:TextBox ID="txtYoutubeLink" runat="server" class="form-control" placeholder="Paste link here"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Update" OnClick="btnSubmit_Click" class="btn btn-gradient-info btn-fw" />
                    &nbsp;
                    <a href="Index.aspx" class="btn btn-gradient-light btn-fw">Cancel</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
