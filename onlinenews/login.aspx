<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="login.aspx.cs" Inherits="onlinenews.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="Admin/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="Admin/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="Admin/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="Admin/assets/images/favicon.ico" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth">
                    <div class="row flex-grow">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-light text-left p-5">
                                <div class="brand-logo"> 
                                   <a href="Default"> <img src="themes/images/logo.png" /></a>
                                </div>
                                <h4>Hello! let's get started</h4>
                                <h6 class="font-weight-light">Sign in to continue.</h6>
                                <form class="pt-3">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" placeholder="password" class="form-control form-control-lg"></asp:TextBox>
                                        <span id="messagePassword"></span>
                                    </div>
                                    <div class="mt-3">
                                        <asp:Button ID="btnLogin" runat="server" Text="SIGN IN" OnClick="btnLogin_Click" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" />
                                    </div>
                                    <div class="my-2 d-flex justify-content-between align-items-center">
                                        <div class="form-check">
                                            <label class="form-check-label text-muted">
                                                <input type="checkbox" class="form-check-input">
                                                Keep me signed in
                                            </label>
                                        </div>
                                        <a href="#" class="auth-link text-black">Forgot password?</a>
                                    </div>
                                    <div class="mb-2">
                                        <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                                            <i class="mdi mdi-facebook mr-2"></i>Connect using facebook
                                        </button>
                                    </div>
                                    <div class="text-center mt-4 font-weight-light">
                                        Don't have an account? <a href="register" class="text-primary">Create</a>
                                    </div>
                                    <script type="text/javascript"> 

                                        $('#btnLogin').click(function () {
                                            debugger;
                                            var countError = 0;

                                            var emailaddressVal = $("#txtEmail").val();
                                            if (emailaddressVal == '') {
                                                $('#messageTxtEmail').html('Please enter your email address.').css('color', 'red');
                                                countError = countError + 1;
                                            }
                                            else {
                                                $('#messageTxtEmail').html('email address is valid').css('color', 'green');
                                            }


                                            var charLength = $('#txtpassword').val().length;
                                            if (charLength < 8) {
                                                $('#messagePassword').html('Length is short, minimum ' + 8 + ' required.').css('color', 'red');
                                                countError = countError + 1;
                                            }
                                            if (countError > 0) { return false; }
                                            else {
                                                return true;
                                            }

                                        });
                                    </script>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="../../assets/js/off-canvas.js"></script>
        <script src="../../assets/js/hoverable-collapse.js"></script>
        <script src="../../assets/js/misc.js"></script>
        <!-- endinject -->
    </form>
</body>
</html>
