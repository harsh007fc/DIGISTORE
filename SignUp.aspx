<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA_Compatible" content="chrome" >
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
               <div class="container">
                   <div class="navbar-header">
                       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                           <span class="sr-only">Toggle Navigation</span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                       </button>
                       <a class="navbar-brand"  href="Default.aspx"><span><img  src="icons/logo1.png" alt="DIGI-STORE" height="40" /></span>DIGI-STORE</a>
                   </div>
                   <div class="navbar-collapse collapse">
                       <ul class="nav navbar-nav navbar-right">
                           <li> <a href="Default.aspx">Home</a></li>
                           <li> <a href="#">About</a></li>
                            <li> <a href="#">Contact-Us</a></li>
                            <li> <a href="#">Blog</a></li>
                           <li class="dropdown">
                               <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                               <ul class="dropdown-menu">
                                    <li class="dropdown-header"> LED/LCD/Smart-TV</li>
                                   <li role="separator" class="divider"></li>
                                   <li><a href="#">MI</a></li>
                                   <li><a href="#">SAMSUNG</a></li>
                                   <li><a href="#">LG</a></li>
                                   <li><a href="#">PANASONIC</a></li>
                                   <li role="separator" class="divider"></li>
                                    <li class="dropdown-header"> Smart-Phones</li>
                                   <li role="separator" class="divider"></li>
                                   <li><a href="#">MI</a></li>
                                   <li><a href="#">SAMSUNG</a></li>
                                   <li><a href="#">REALME</a></li>
                                   <li><a href="#">ASUS</a></li>
                                   <li role="separator" class="divider"></li>
                                    <li class="dropdown-header"> Laptops</li>
                                   <li role="separator" class="divider"></li>
                                   <li><a href="#">DELL</a></li>
                                   <li><a href="#">HP</a></li>
                                   <li><a href="#">ASUS</a></li>
                                   <li><a href="#">LENOVO</a></li>
                                   <li role="separator" class="divider"></li>
                                    <li class="dropdown-header"> Accessories</li>
                                   <li role="separator" class="divider"></li>
                                   <li><a href="#">ADAPTERS</a></li>
                                   <li><a href="#">USB/MEMORYCARDS</a></li>
                                   <li><a href="#">CABLES</a></li>
                                   <li><a href="#">COVERS/STANDS</a></li>
                               </ul>
                           </li>
                            <li  class="active"><a href="SignUp.aspx">SignUp</a></li>
                           <li><a href="SignIn.aspx">SignIn</a></li>

                       </ul>
                   </div>

               </div>

           </div>
        </div>
        <!--SIGNUP_FORM_START-->
        <br />
        <br />
        <br />
        <h1 align="center">Sign Up On Digi-Store</h1>
            <hr />

        <div class="center-page">
            <label class="col-xs-11">Username:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtUname" runat="server" CssClass="form-control" placeholder="Enter Your Name" ></asp:TextBox>
                <br />
        </div>


            <label class="col-xs-11">Email:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Email" TextMode="Email" ></asp:TextBox>
                <br />
        </div>

            <label class="col-xs-11">Full Name:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Full Name" ></asp:TextBox>
                <br />
        </div>


            <label class="col-xs-11">Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Enter Your Password" TextMode="Password" ></asp:TextBox>
                <br />
        </div>

            <label class="col-xs-11">Confirm Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="TxtCPass" runat="server" CssClass="form-control" placeholder="Enter Your Password Again" TextMode="Password" ></asp:TextBox>
                <br />
        </div>

            <label class="col-xs-11" ></label>
            <div class="col-xs-11">  
               <asp:Button ID="txtsignup"  runat="server"  class="btn btn-success" Text="Signup" OnClick="txtsignup_Click" />
                <asp:Label ID="Label1" runat="server" Text="Msg"></asp:Label>
            </div>
         </div>
        <!--SIGNUP_FORM_END-->
        <!-- footer Content Starts Here-->

        <!-- footer Content Ends Here-->
    </form>
</body>
</html>
