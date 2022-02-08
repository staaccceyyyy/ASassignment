<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication.Registration" ValidateRequest="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

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

    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=pwTB.ClientID %>').value;

            if (str.length < 12) {
                document.getElementById("pwstrengthLB").innerHTML = "Password must be at least 12 characters long.";
                document.getElementById("pwstrengthLB").style.color = "Red";
                return ("too short");
            }
            else if (str.search(/[0-9]/) == -3) {
                document.getElementById("pwstrengthLB").innerHTML = "Password must include at least 3 numbers";
                document.getElementById("pwstrengthLB").style.color = "Red";
                return ("no number");
            }
            else if (str.search(/[A-Z]/) == -2) {
                document.getElementById("pwstrengthLB").innerHTML = "Password require at least 2 upper case letter";
                document.getElementById("pwstrengthLB").style.color = "Red";
                return ("no upper case letter");
            }
            else if (str.search(/[a-z]/) == -2) {
                document.getElementById("pwstrengthLB").innerHTML = "Password require at least 2 lower case letter";
                document.getElementById("pwstrengthLB").style.color = "Red";
                return ("no lower case letter");
            }
            else if (str.search(/[^A-Za-z0-9]/) == -1) {
                document.getElementById("pwstrengthLB").innerHTML = "Password require at least 1 special character";
                document.getElementById("pwstrengthLB").style.color = "Red";
                return ("no special character");
            }
            else {
                document.getElementById("pwstrengthLB").innerHTML = "Password is strong";
                document.getElementById("pwstrengthLB").style.color = "Green";
                return ("no special character");
            }
            //document.getElementById("pwstrengthLB").innerHTML = "password is strong."
            //document.getElementById("pwstrengthLB").style.color = "Green";
        }
    </script>
</head>
<body>
<%--    <form id="form1" runat="server">
        <div>
            <asp:Label ID="registerLB" runat="server" Text="Register"></asp:Label>
            <br />
            <br />
            <asp:Label ID="fnameLB" runat="server" Text="First Name: "></asp:Label>
&nbsp;<asp:TextBox ID="fnameTB" runat="server"></asp:TextBox>
&nbsp;
            <br />
            <asp:Label ID="lnameLB" runat="server" Text="Last Name: "></asp:Label>
&nbsp;<asp:TextBox ID="lnameTB" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="emailLB" runat="server" Text="Email Address: "></asp:Label>
&nbsp;<asp:TextBox ID="emailTB" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="pwLB" runat="server" Text="Password: " ></asp:Label>
&nbsp;<asp:TextBox ID="pwTB" runat="server" OnTextChanged="TextBox4_TextChanged" TextMode="Password" onkeyup="javascript:validate()"></asp:TextBox> <%--onkeyup="javascript:validate()"--%> 
           <%-- <asp:Label ID="pwstrengthLB" runat="server" Text="passworrd strength"></asp:Label>
            <br />
            <asp:Label ID="dobLB" runat="server" Text="Date of Birth: "></asp:Label>
            <asp:Calendar ID="dobTB" runat="server"></asp:Calendar>
            <asp:Label ID="ccnoLB" runat="server" Text="Credit Card Number: "></asp:Label>
&nbsp;<asp:TextBox ID="ccnoTB" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="photoLB" runat="server" Text="Photo: "></asp:Label>
&nbsp;<asp:FileUpload ID="photoTB" runat="server" />
            <br />
            <br />
            <asp:Button ID="submitbtn" runat="server" Text="Register" OnClick="submitbtnClick" />
        
        
        
        
            <br />
            <br />
            <asp:Label ID="checkerLB" runat="server" EnableViewState="False" Text="idkerror"></asp:Label>
        
        
        
        
        </div>
    </form>--%>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" id="form2" runat="server">
					<span class="login100-form-title">
						<asp:Label ID="regtitleLB" runat="server" Text="Register"></asp:Label>
					</span>
                    <div class="flex-col-c p-t-0 p-b-40">
						<span class="txt1 p-b-9">
							Have an account?
						</span>
                        <asp:HyperLink ID="regtologin" runat="server" class="txt3" NavigateUrl="~/Login.aspx">Login Instead</asp:HyperLink>
				
					</div>
                    <asp:Label ID="allinputVD" runat="server" Text=" " Visible="False" ForeColor="Red"></asp:Label>
                    <br />

                    <asp:Label ID="fnameLB" runat="server" Text="First Name "></asp:Label> <asp:Label ID="fnameVD" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
					<div class="wrap-input100 validate-input m-b-16" data-validate="Please enter first name">
						<asp:TextBox ID="fnameTB" runat="server" CssClass="input100"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>
                    
					<asp:Label ID="lnameLB" runat="server" Text="Last Name "></asp:Label> <asp:Label ID="lnameVD" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter last name">
                        <asp:TextBox ID="lnameTB" runat="server" CssClass="input100"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

                    <asp:Label ID="emailLB" runat="server" Text="Email Address "></asp:Label> <asp:Label ID="emailVD" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                    <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter email">
                        <asp:TextBox ID="emailTB" runat="server" CssClass="input100"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

                    <asp:Label ID="pwLB" runat="server" Text="Password "></asp:Label> <asp:Label ID="pwVD" runat="server" Visible="True" ForeColor="Red"></asp:Label>
                    <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter password">
                        <asp:TextBox ID="pwTB" runat="server" CssClass="input100" OnTextChanged="TextBox4_TextChanged" TextMode="Password" onkeyup="javascript:validate()"></asp:TextBox> <%--onkeyup="javascript:validate()"--%> 
                        
						<span class="focus-input100"></span>
                        
					</div>   
                    <asp:Label ID="pwstrengthLB" runat="server" Text="passworrd strength"></asp:Label>
            <br /><br />
                    <asp:Label ID="dobLB" runat="server" Text="Date of Birth "></asp:Label>
                    <%--<div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter date of birth">--%>
                        <asp:Calendar ID="dobTB" runat="server"></asp:Calendar>
						<span class="focus-input100"></span>
					<%--</div>--%>

                    <asp:Label ID="ccnoLB" runat="server" Text="Credit Card Number "></asp:Label> <asp:Label ID="ccnoVD" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                    <div class="wrap-input100 validate-input m-b-16" data-validate = "Please enter credit card number">
                        <asp:TextBox ID="ccnoTB" runat="server" CssClass="input100"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

                    <asp:Label ID="photoLB" runat="server" Text="Photo "></asp:Label>
                    <div class="wrap-input100 validate-input m-b-16" data-validate = "Please upload photo">
                        <asp:FileUpload ID="photoTB" runat="server"  CssClass="input100"/>
						<span class="focus-input100"></span>
                        
					</div>

					<div class="text-right p-t-13 p-b-23">
						<span class="txt1">
							Forgot
						</span>

						<a href="#" class="txt2">
							Username / Password?
						</a>
					</div>

					<div class="container-login100-form-btn">
                        <asp:Button ID="submitbtn" runat="server" Text="Register" OnClick="submitbtnClick" CssClass="login100-form-btn" />
					</div>
                    <br />
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>

