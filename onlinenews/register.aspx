<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="register.aspx.cs" Inherits="onlinenews.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
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
                                <h4>New here?</h4>
                                <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
                                <form class="pt-3">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" class="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" class="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" class="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="form-control form-control-lg"></asp:TextBox>
                                        <span id="messageTxtEmail"></span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" placeholder="password" class="form-control form-control-lg"></asp:TextBox>
                                        <span id="messagePassword"></span>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="ConfirmP Password" class="form-control form-control-lg"></asp:TextBox>
                                        <span id="messageConfirmPassword"></span>
                                    </div>
                                    <div class="mb-4">
                                        <div class="form-check">
                                            <label class="form-check-label text-muted">
                                                <input id="chkPolicy" type="checkbox" class="form-check-input">
                                                I agree to all Terms & Conditions
                                            </label>
                                            <span id="messageChkPolicy"></span>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn" />
                                    </div>
                                    <div class="text-center mt-4 font-weight-light">
                                        Already have an account? <a href="login" class="text-primary">Login</a>
                                    </div>

                                    <script type="text/javascript">
                                        $('#txtpassword').on('keyup', function () {
                                            var char = $('#txtpassword').val();
                                            var charLength = $('#txtpassword').val().length;
                                            if (charLength < 8) {
                                                $('#messagePassword').html('Length is short, minimum ' + 8 + ' required.').css('color', 'red');
                                            } else if (charLength > 40) {
                                                $('#messagePassword').html('Length is not valid, maximum ' + 40 + ' allowed.').css('color', 'red');
                                                $(this).val(char.substring(0, maxLength));
                                            } else {
                                                $('#messagePassword').html('Password is valid').css('color', 'green');
                                            }
                                        });

                                        $('#txtpassword, #txtConfirmPassword').on('keyup', function () {

                                            if ($('#txtpassword').val() == $('#txtConfirmPassword').val()) {
                                                $('#messageConfirmPassword').html('Matching').css('color', 'green');
                                            } else
                                                $('#messageConfirmPassword').html('Not Matching').css('color', 'red');
                                        });

                                        $('#btnRegister').click(function () {
                                            debugger;
                                            var countError = 0;


                                            if (!($('#chkPolicy').prop('checked'))) {
                                                $("#messageChkPolicy").html("please follow the terms and conditions.").css('color', 'red');
                                                countError = countError + 1;
                                            }
                                            else {
                                                $("#messageChkPolicy").html("I do accepts the Terms and conditions").css('color', 'green');
                                            }

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
                                            if (charLength > 0) {
                                                if ($('#txtpassword').val() == $('#txtConfirmPassword').val()) {
                                                    $('#messageConfirmPassword').html('Matching').css('color', 'green');
                                                }
                                                else {
                                                    $('#messageConfirmPassword').html('Not Matching').css('color', 'red');
                                                    countError = countError + 1;
                                                }
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
        <script src="Admin/assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="Admin/assets/js/off-canvas.js"></script>
        <script src="Admin/assets/js/hoverable-collapse.js"></script>
        <script src="Admin/assets/js/misc.js"></script>
        <!-- endinject -->
    </form>
</body>
</html>
