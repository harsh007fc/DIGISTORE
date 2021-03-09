<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoveryPass.aspx.cs" Inherits="RecoveryPass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">                                                
    <title>Password Recovery</title>
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
                           <li > <a href="Default.aspx">Home</a></li>
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
                            
                           <li ><a href="SignIn.aspx">SignIn</a></li>
                       </ul>
                   </div>

               </div>
               </div>
        </div>

          <div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <br />
                <h2>Reset Password</h2>
                <hr />
                <h3></h3>

                <div class="form-group">
                     <asp:Label ID="lblmsg" CssClass="col-md-2 control-label" runat="server"  Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblNewPass" CssClass="col-md-2 control-label" runat="server" Text=" Enter Your New Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtNewPass" CssClass="form-control" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPass" runat="server" ErrorMessage="Enter your New Password" ControlToValidate="txtNewPass" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblConfPass" CssClass="col-md-2 control-label" runat="server" Text="Confirm New Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtConfPass" CssClass="form-control" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfPass" runat="server" ErrorMessage="Again Enter your New Password" ControlToValidate="txtConfPass" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="Passwords Doesn't Match" ControlToCompare="txtNewPass" ControlToValidate="txtConfPass" ></asp:CompareValidator>
                    </div>
                </div>




                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnResetPass"  runat="server" Text="Reset" CssClass="btn btn-default"  Visible="False" OnClick="btnResetPass_Click"  />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>


    </form>
    <!-- footer Content Starts Here-->
        <hr />
        <footer>
            <div class="container">
            <p class="pull-right"><a href="#">Back To Top</a></p>
            <p>&copy; All Rights Reserved</p>
                </div>
        </footer>
        <!-- fotter Content Ends Here-->

</body>
</html>
