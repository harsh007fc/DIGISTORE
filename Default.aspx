<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DIGI-STORE</title>
    <script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA_Compatible" content="chrome" >
    <link href="css/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script>

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/Cart.aspx";
            });
        });

    </script>
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
                           <li class="active"> <a href="Default.aspx">Home</a></li>
                           <li> <a href="#">About</a></li>
                            <li> <a href="#">Contact-Us</a></li>
                            <li> <a href="#">Blog</a></li>
                           <li class="dropdown">
                               <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                               <ul class="dropdown-menu">
                                   <li><a href="Products.aspx">All Products</a></li>
                                    <li role="separator" class="divider"></li>
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
                           <li>
                               <button  id="btnCart" class="btn btn-primary navbar-btn" type="button">Cart<span class="badge" id="pCount" runat="server">6</span>

                               </button>

                           </li>
                            <li id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a></li>
                           <li id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a></li>
                           <li>
                               <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn" runat="server" Text="Sign Out" OnClick="btnlogout_Click" />
                           </li>
                       </ul>
                   </div>

               </div>

           </div>
            </div>

            <!-- IMAGE_SLIDER_START-->
            <div class="container">
                <h2>Carousel Example</h2>  
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="imgslider/3.png" alt="Los Angeles" style="width:100%; height: 450px;">
                            <div class="carousel-caption">
                                <h3>Lod Angeles</h3>
                                <p>LA is always so much fun!</p>
                                <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy Now</a></p>
                            </div>


                        </div>
                        <div class="item">
                            <img src="imgslider/banner_03.jpg" alt="Chicago" style="width:100%; height: 450px;">
                            <div class="carousel-caption">
                                <h3>Los Angeles</h3>
                                <p>LA is always so much fun!</p>
                            </div>

                        </div>
                        <div class="item">
                            <img src="imgslider/Electronics-Barnd-Slider-.jpg" alt="Chicago" style="width:100%; height: 450px;">
                            <div class="carousel-caption">
                                <h3>Los Angeles</h3>
                                <p>LA is always so much fun!</p>
                            </div>

                        </div>
                        <div class="item">
                            <img src="imgslider/great eastern-banner002.jpg" alt="Chicago" style="width:100%; height: 450px;">
                            <div class="carousel-caption">
                                <h3>Los Angeles</h3>
                                <p>LA is always so much fun!</p>
                            </div>

                        </div>
                        <div class="item">
                            <img src="imgslider/slide1.jpg" alt="Chicago" style="width:100%; height: 450px;">
                            <div class="carousel-caption">
                                <h3>Los Angeles</h3>
                                <p>LA is always so much fun!</p>
                            </div>

                        </div>
                        <div class="item">
                            <img src="imgslider/slider-4.png" alt="New york" style="width:100%; height: 450px;">
                            <div class="carousel-caption">
                                <h3>Los Angeles</h3>
                                <p>LA is always so much fun!</p>
                            </div>

                        </div>
                    </div>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev" >
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next" >
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
             <!-- IMAGE_SLIDER_END -->
        <!-- Middle Content Starts Here-->
        <hr />
        <br />
        <div class="container center">
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-rectangle"  src="Mobile/realme-6i-rmx2002-original-imaftnfyhwxdruv2.jpeg" alt="thumbnail" width="145" height="312"/>
                    <h3>Realme 6i (Eclipse Black, 64 GB)  (6 GB RAM)</h3>
                    <p>6 GB RAM | 64 GB ROM | Expandable Upto 256 GB
                        16.51 cm (6.5 inch) Full HD+ Display
                        48MP + 8MP + 2MP + 2MP | 16MP Front Camera
                        4300 mAh Battery
                        MediaTek Helio G90T Processor
                        The realme 6i features a large 16.5 cm (6.5) FHD+ display and a refresh rate of 90 Hz that provide visuals much
                        smoother than a standard display, ensuring an immersive entertainment experience.With the combination of a 
                        powerful CPU and GPU, the realme 6i provides you with a smooth and seamless multitasking experience.
                    </p>
                    <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-rectangle"  src="Mobile/asus-na-thin-and-light-laptop-original-imafs92tpthajprz.jpeg" alt="thumbnail"
                        width="350" height="312"/>
                    <h3>Asus VivoBook 14 Ryzen 5 Quad Core 2nd Gen - (8 GB/512 GB SSD/Windows 10 Home) X412DA-EK501T Thin and 
                        Light Laptop  (14 inch, Transparent Silver, 1.5 kg)</h3>
                    <p>Enjoy a hassle-free computing experience when you have the ASUS VivoBook 14 laptop. It features the trendy NanoEdge 
                        Display, the ErgoLift hinge, and a full-size backlit keyboard for effortless computing. Oh, and not to forget, it
                        features the ASUS SonicMaster technology for an enthralling aural experience.</p>
                    <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-rectangle"  src="Mobile/mi-l43m5-an-original-imafrjtbdbnczaxk.jpeg" alt="thumbnail" width="370" height="312"/>
                    <h3>Mi 4A Pro 108 cm (43) Full HD LED Smart Android TV With Google Data Saver4.45,05,559 Ratings & 53,856 Reviews</h3>
                    <p>There is no fun in watching your favourite movie or show on a TV where the display quality is poor. Now, boost 
                        the fun and watch them all in good and clear-quality on this 108 cm (43) Mi smart TV. Its Full HD display can 
                        accentuate your viewing experience and make it better. You can even access video streaming apps on it and never 
                        run out of quality-content to watch and enjoy. It comes with speakers which that deliver powerful audio which lets 
                        you experience the environment of a cinema hall right in your bedroom or living room.</p>
                    <p><a class="btn btn-default" href="#" role="button">View More &raquo;</a></p>
                </div>
            </div>
        </div>
        <!-- Middle Content Ends Here-->
        <!-- footer Content Starts Here-->
        <hr />
        <footer>
            <div class="container">
            <p class="pull-right"><a href="#">Back To Top</a></p>
            <p>&copy; All Rights Reserved</p>
                </div>
        </footer>
        <!-- fotter Content Ends Here-->
    </form>
</body>
</html>
