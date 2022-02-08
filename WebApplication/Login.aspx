<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Login </title>

	 <script src="https://www.google.com/recaptcha/api.js?render=6Ld8Y2EeAAAAAM8223VrL69_d3wweR4MzXtjQHXh"></script>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

</head>
<body>
    <%--    <form id="form1" runat="server">
        <div>
        </div>

    </form>--%>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" id="form1" runat="server">
					<span class="login100-form-title">
						<asp:Label ID="logintitleLB" runat="server" Text="Login"></asp:Label>
					</span>

					<div class="flex-col-c p-t-0 p-b-40">
						<span class="txt1 p-b-9">
							Don’t have an account?
						</span>
						<asp:HyperLink ID="logintoreg" class="txt3" runat="server" NavigateUrl="~/Registration.aspx">Register Now</asp:HyperLink>
					</div>

					<asp:Label ID="usernameLGLB" runat="server" Text="Email"></asp:Label>
					<div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
						<asp:TextBox ID="emailLOGTB" runat="server" CssClass="input100"></asp:TextBox>
						<%--<asp:TextBox ID="emailLGTB" runat="server" CssClass="input100"></asp:TextBox>--%>
                        <%--<input class="input100" type="text" name="username" placeholder="Username">--%>
						<span class="focus-input100"></span>
					</div>

					<asp:Label ID="passwordLGLB" runat="server" Text="Password"></asp:Label>
					<div class="wrap-input100 validate-input" data-validate = "Please enter password">
						<asp:TextBox ID="passwordLOGTB" runat="server" CssClass="input100" TextMode="Password"></asp:TextBox>
						<%--<asp:TextBox ID="passwordLGTB" runat="server" CssClass="input100" TextMode="Password"></asp:TextBox>--%>
                        <%--<input class="input100" type="password" name="pass" placeholder="Password">--%>
						<span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
						<span class="txt1">Forgot</span><a href="#" class="txt2">Username / Password?</a>
					</div>
					<asp:Label ID="errorLOB" runat="server" EnableViewState="False"></asp:Label>

					<div class="container-login100-form-btn">
						<asp:Button ID="logininbtn" runat="server" Text="Login"  CssClass="login100-form-btn" OnClick="loginclick" EnableViewState="False" />
					</div>	
					<br />
					
					<input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
				</form>

				<script>
                    grecaptcha.ready(function () {
                        grecaptcha.execute('6Ld8Y2EeAAAAAM8223VrL69_d3wweR4MzXtjQHXh', { action: 'Login' }).then(function (token) {
                            document.getElementById("g-recaptcha-response").value = token;
                        });
                    });
                </script>
			</div>
		</div>
	</div>
</body>
</html>
