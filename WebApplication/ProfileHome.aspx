<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileHome.aspx.cs" Inherits="WebApplication.ProfileHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Login </title>
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
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" id="homeform" runat="server">

					<span class="login100-form-title">
						<asp:Label ID="hometitle" runat="server" Text="Home Page"></asp:Label>
					</span>

					<asp:Label ID="messageTV" runat="server" Text="" EnableViewState="false"></asp:Label>
					
					<div class="container-login100-form-btn">
						<asp:Button ID="logout" runat="server"  CssClass="login100-form-btn" OnClick="logoutofacct"  Text="Logout"/>
					</div>

					<br />
				</form>
			</div>
		</div>
	</div>
</body>
</html>
