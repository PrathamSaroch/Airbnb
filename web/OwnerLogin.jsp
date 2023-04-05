<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from www.ansonika.com/panagea/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:20:38 GMT -->
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

        <!-- BASE CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/vendors.css" rel="stylesheet">

        <!-- ALTERNATIVE COLORS CSS -->
        <link href="#" id="colors" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

            function adminLogin()
            {
                var owneremail = document.getElementById("owneremail").value;
                var password = document.getElementById("password").value;

                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();

                        if (res == "success")
                        {
                            Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Signed in successfull!'
                            }).then(function () {
                                window.location = "OwnerHome.jsp";
                            });
                        } else
                        {
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'User-Email or Password is incorrect !'
                            });
                        }
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./OwnerLoginServlet?owneremail=" + owneremail + "&password=" + password, true);

                //3. Send Request
                xhttp.send();
            }

        </script>

    </head>

    <body id="register_bg">

        <nav id="menu" class="fake_menu"></nav>

        <div id="preloader">
            <div data-loader="circle-side"></div>
        </div>
        <!-- End Preload -->

        <div id="login">
            <aside>
                <figure>
                    <img src="img/logo_sticky.svg" width="155" height="36" alt="" class="logo_sticky">
                </figure>
                <form autocomplete="off">
                    <h2 style="text-align: center">Owner Login</h2><br>
                    <div class="form-group">
                        <label>Owner Email</label>
                        <input class="form-control" id="owneremail" type="text">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input class="form-control" id="password" type="password">
                        <i class="ti-user"></i>
                    </div>

                    <div id="pass-info" class="clearfix"></div>
                    <input type="button" value="Login!" onclick="adminLogin()" class="btn_1 rounded full-width add_top_30">
                    <div class="text-center add_top_10">Already have an acccount? <strong><a href="UserSignup.jsp">Signup !</a></strong></div>
                </form>
                <div class="copy">© Panagea</div>
            </aside>
        </div>
        <!-- /login -->

        <!-- COMMON SCRIPTS -->
        <script src="js/common_scripts.js"></script>
        <script src="js/main.js"></script>
        <script src="phpmailer/validate.js"></script>

        <!-- SPECIFIC SCRIPTS -->
        <script src="js/pw_strenght.js"></script>



    </body>

    <!-- Mirrored from www.ansonika.com/panagea/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:20:39 GMT -->
</html>