<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="onlinenews.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- begin more articles -->
    <div class="articles">
      <!-- begin post -->
      <div class="single">
        <h2>Contact Us</h2>
        <p>Idnec nulla fuscinia ridictus nunc et morbi at morbi senean tincidunt. Antsempus morbi quis in sempus convallis dui vestie eu phasellentesquet nam. Pulvinareipsum sit nibh id nas eu magnisse alique id nam curabitur. Etenim consequam nec ant senean leo morbi urna velit rutrum consectum. Sedpretium nulla vel ero liberos facilis dis cursus adipiscing lacus intesque.</p>
      </div>
      <!-- end post -->
      <div id="comments">
        <div id="respond">
          <div class="formcss" action="#" method="post" id="commentform">
            <p>
              <input type="text" name="author" id="author" value="" size="22" tabindex="1" />
              <label for="author"><small>Name (required)</small></label>
            </p>
            <p>
              <input type="text" name="email" id="email" value="" size="22" tabindex="2" />
              <label for="email"><small>Mail (required)</small></label>
            </p>
            <p>
              <input type="text" name="url" id="url" value="" size="22" tabindex="3" />
              <label for="url"><small>Website</small></label>
            </p>
            <p>
              <textarea name="comment" id="comment" cols="100%" rows="10" tabindex="4"></textarea>
            </p>
            <p>
              <button name="submit" type="submit" id="submit">Submit</button>
            </p>
          </div>
        </div>
      </div>
      <div class="break"></div>
    </div>
    <!-- end more articles -->
</asp:Content>
