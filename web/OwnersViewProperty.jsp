<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from www.ansonika.com/panagea/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:09:24 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
        <meta name="author" content="Ansonika">
        <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>

        <!-- Favicons-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet">

        <!--BASE CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/vendors.css" rel="stylesheet">

        <!-- ALTERNATIVE COLORS CSS -->
        <link href="#" id="colors" rel="stylesheet">

        <script>
            <%
                String city = request.getParameter("cityname");
            %>

            var city = "<%=city%>";

            function showAirbnbs()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();
                //4. Receive XMLHttpResponse from server & use ans
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];
                        var ans = "";
                        ans = ans + "<br>";
                        ans = ans + "<div class=\"row\" >";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"col-sm-4\"  >";
                            ans = ans + "<a href=\"OwnerPropertyDetail.jsp?detailid="+st.detailid+"\" class=\"grid_item\">";
                            ans = ans + "<figure>";
//                            ans = ans + "<div class=\"score\"><strong>8.9</strong></div>";
                            ans = ans + "<img style=\"height: 230px\" src=" + st.photo + " class=\"img-fluid\" >";
                            ans = ans + "<div class=\"info\">";
                            ans = ans + "<div class=\"cat_star\"><i class=\"icon_star\"></i><i class=\"icon_star\"></i><i class=\"icon_star\"></i><i class=\"icon_star\"></i></div>";
                            ans = ans + "<h2 style=\"color: white\" >" + st.propertyname + "</h2>";
                            ans = ans + "<h3 style=\"color: white\" >" + st.airbnbname + "</h3>";
                            ans = ans + "<h3 style=\"color: white\" >Price : <span style=\"text-decoration: line-through\" >" + st.price + "</span></h3>";
                            ans = ans + "<h3 style=\"color: white\" >Offer Price : " + st.offerprice + "</h3>";
                            ans = ans + "</div>";
                            ans = ans + "</figure>";
                            ans = ans + "</a>";
                            ans = ans + "</div>";

                        }
                        ans = ans + "</div>";
                        document.getElementById("showairbnbs").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./UserShowAirbnbsServlet?city=" + city, true);
                //3. Send Request
                xhttp.send();
            }

        </script>

    </head>

    <body class="datepicker_mobile_full" onload="showAirbnbs()" ><!-- Remove this class to disable datepicker full on mobile -->

        <div id="page">

            <%@include file="UserNavbar.jsp"%>
            <!-- /header -->

            <main>
                <section class="hero_in hotels_detail">
                    <div class="wrapper">
                        <div class="container">
                            <h1>All Airbnb's & Accommodation</h1>
                            <p>Expolore top rated Tours and Airbnb around the world</p>
                        </div>
                    </div>
                </section>
                <!-- /hero_single -->

                <div class="container container-custom margin_80_0">
                    <div class="main_title_2">
                        <span><em></em></span>
                        <h2>Popular Airbnb's and Accommodations in <%=city%></h2>
                        <p>Popular cities that have our Airbnb's</p>
                    </div>
                    <div id="showcities" >

                        <!--Show All Cities-->

                    </div>

                </div>
                <!-- /carousel -->
                <hr class="large">
                </div>
                <!-- /container -->

                <div class="container container-custom margin_30_95">
                    <section class="add_bottom_45">

                        <div id="showairbnbs">

                            <!--                                <a href="hotel-detail.html" class="grid_item">
                                                                <figure>
                                                                    <div class="score"><strong>8.9</strong></div>
                                                                    <img src="img/hotel_1.jpg" class="img-fluid" alt="">
                                                                    <div class="info">
                                                                        <div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div>
                                                                        <h3>Mariott Hotel</h3>
                                                                    </div>
                                                                </figure>
                                                            </a>-->

                        </div>

                        <!-- /row -->
                    </section>


                    <!-- /banner -->

                </div>
                <!-- /container -->


                <!-- /bg_color_1 -->

                <div class="call_section">
                    <div class="container clearfix">
                        <div class="col-lg-5 col-md-6 float-end wow position-relative" data-wow-offset="250">
                            <div class="block-reveal">
                                <div class="block-vertical"></div>
                                <div class="box_1">
                                    <h3>Enjoy a GREAT travel with us</h3>
                                    <p>Ius cu tamquam persequeris, eu veniam apeirian platonem qui, id aliquip voluptatibus pri. Ei mea primis ornatus disputationi. Menandri erroribus cu per, duo solet congue ut. </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/call_section-->
            </main>
            <!-- /main -->

            <footer>
                <div class="container margin_60_35">
                    <div class="row">
                        <div class="col-lg-5 col-md-12 pe-5">
                            <p><img src="img/logo.svg" width="150" height="36" alt=""></p>
                            <p>Mea nibh meis philosophia eu. Duis legimus efficiantur ea sea. Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu. Nihil facilisi indoctum an vix, ut delectus expetendis vis.</p>
                            <div class="follow_us">
                                <ul>
                                    <li>Follow us</li>
                                    <li><a href="#0"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#0"><i class="ti-twitter-alt"></i></a></li>
                                    <li><a href="#0"><i class="ti-google"></i></a></li>
                                    <li><a href="#0"><i class="ti-pinterest"></i></a></li>
                                    <li><a href="#0"><i class="ti-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 ms-lg-auto">
                            <h5>Useful links</h5>
                            <ul class="links">
                                <li><a href="about.html">About</a></li>
                                <li><a href="login.html">Login</a></li>
                                <li><a href="register.html">Register</a></li>
                                <li><a href="blog.html">News &amp; Events</a></li>
                                <li><a href="contacts.html">Contacts</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h5>Contact with Us</h5>
                            <ul class="contacts">
                                <li><a href="tel://61280932400"><i class="ti-mobile"></i> + 61 23 8093 3400</a></li>
                                <li><a href="mailto:info@Panagea.com"><i class="ti-email"></i> info@Panagea.com</a></li>
                            </ul>
                            <div id="newsletter">
                                <h6>Newsletter</h6>
                                <div id="message-newsletter"></div>
                                <form method="post" action="http://www.ansonika.com/panagea/phpmailer/newsletter_template_email.php" name="newsletter_form" id="newsletter_form">
                                    <div class="form-group">
                                        <input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
                                        <input type="submit" value="Submit" id="submit-newsletter">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--/row-->
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul id="footer-selector">
                                <li>
                                    <div class="styled-select" id="lang-selector">
                                        <select>
                                            <option value="English" selected>English</option>
                                            <option value="French">French</option>
                                            <option value="Spanish">Spanish</option>
                                            <option value="Russian">Russian</option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <div class="styled-select" id="currency-selector">
                                        <select>
                                            <option value="US Dollars" selected>US Dollars</option>
                                            <option value="Euro">Euro</option>
                                        </select>
                                    </div>
                                </li>
                                <li><img src="img/cards_all.svg" alt=""></li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul id="additional_links">
                                <li><a href="#0">Terms and conditions</a></li>
                                <li><a href="#0">Privacy</a></li>
                                <li><span>© Panagea</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
            <!--/footer-->
        </div>
        <!-- page -->

        <!-- Sign In Popup -->
        <div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
            <div class="small-dialog-header">
                <h3>Sign In</h3>
            </div>
            <form>
                <div class="sign-in-wrapper">
                    <a href="#0" class="social_bt facebook">Login with Facebook</a>
                    <a href="#0" class="social_bt google">Login with Google</a>
                    <div class="divider"><span>Or</span></div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="email" id="email">
                        <i class="icon_mail_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" id="password" value="">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div class="clearfix add_bottom_15">
                        <div class="checkboxes float-start">
                            <label class="container_check">Remember me
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="float-end mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
                    </div>
                    <div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
                    <div class="text-center">
                        Don?t have an account? <a href="register.html">Sign up</a>
                    </div>
                    <div id="forgot_pw">
                        <div class="form-group">
                            <label>Please confirm login email below</label>
                            <input type="email" class="form-control" name="email_forgot" id="email_forgot">
                            <i class="icon_mail_alt"></i>
                        </div>
                        <p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
                        <div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
                    </div>
                </div>
            </form>
            <!--form -->
        </div>
        <!-- /Sign In Popup -->

        <div id="toTop"></div><!-- Back to top button -->

        <!-- COMMON SCRIPTS -->
        <script src="js/common_scripts.js"></script>
        <script src="js/main.js"></script>
        <script src="phpmailer/validate.js"></script>

        <!-- DATEPICKER  -->
        <script>
        $(function () {
            'use strict';
            $('input[name="dates"]').daterangepicker({
                autoUpdateInput: false,
                minDate: new Date(),
                locale: {
                    cancelLabel: 'Clear'
                }
            });
            $('input[name="dates"]').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('MM-DD-YY') + ' > ' + picker.endDate.format('MM-DD-YY'));
            });
            $('input[name="dates"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });
        });
        </script>

        <!-- INPUT QUANTITY  -->
        <script src="js/input_qty.js"></script>


    </body>

    <!-- Mirrored from www.ansonika.com/panagea/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:10:12 GMT -->
</html>