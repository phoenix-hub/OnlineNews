<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewsExpose.aspx.cs" Inherits="onlinenews.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:TextBox ID="txtEditor" runat="server" Width="100%" Height="500px" />
    <ajax:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server"  EnableSanitization="false" TargetControlID="txtEditor">
    </ajax:HtmlEditorExtender>
    <br />
    <asp:Button Text="Submit" runat="server" OnClick="Submit" />
    <br />
    <asp:Label ID="lblContents" runat="server" />
</asp:Content>
