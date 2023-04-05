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
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- ALTERNATIVE COLORS CSS -->
        <link href="#" id="colors" rel="stylesheet">
        
        <script>
            
            function userSignup()
            {
                var username = document.getElementById("username").value;
                var phoneno = document.getElementById("phoneno").value;
                var useremail = document.getElementById("useremail").value;
                var password = document.getElementById("password").value;
                var conpassword = document.getElementById("conpassword").value;
                var address = document.getElementById("address").value;
                var photo = document.getElementById("photo").files[0];

                if (username == "" || phoneno == "" || useremail == "" || password == "" || conpassword == "" || address == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly !'
                    });
                } else if (phoneno.length != 10)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter the Phone Number Properly !'
                    });
                } else if (useremail.indexOf("@") == -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                } else if (document.getElementById("photo").files.length[0])
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select the Display Picture !'
                    });
                } else if (password != conpassword)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Password & Confirm Passowrd must match !'
                    });
                } else
                {
                    //1. Make object of XMLHttpRequest
                    var xhttp = new XMLHttpRequest();

                    //4. Receive XMLHttpResponse from server & use ans

                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            var res = this.responseText;
                            res = res.trim();

                            if (res == "success")
                            {
                                document.getElementById("username").value="";
                                document.getElementById("phoneno").value="";
                                document.getElementById("useremail").value="";
                                document.getElementById("password").value="";
                                document.getElementById("conpassword").value="";
                                document.getElementById("address").value="";
                                document.getElementById("photo").value="";
                                
                                Swal.fire({
                                    icon: 'sucsess',
                                    title: 'Done...',
                                    text: 'Signed in successfull!'
                                });
                            } else
                            {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'User-Email already present!'
                                });
                            }

                        }
                    };
                    //2. Prepare request (Define target --> servlet)
                    xhttp.open("POST", "./UserSignupServlet", true);

                    var formdata = new FormData();
                    formdata.append("username", username);
                    formdata.append("phoneno", phoneno);
                    formdata.append("useremail", useremail);
                    formdata.append("password", password);
                    formdata.append("address", address);
                    formdata.append("photo", photo);

                    //3. Send Request
                    xhttp.send(formdata);
                }
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
                    <a href="index-2.html"><img src="img/logo_sticky.svg" width="155" height="36" alt="" class="logo_sticky"></a>
                </figure>
                <form autocomplete="off">
                    <h2 style="text-align: center">User Signup</h2><br>
                    <div class="form-group">
                        <label>User Name</label>
                        <input class="form-control" id="username" type="text">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group" >
                        <label>Phone number</label>
                        <input class="form-control" id="phoneno" type="text">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input class="form-control" id="address" type="email">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group" >
                        <label>Display Picture</label>
                        <input class="form-control" id="photo" type="file">
                    </div>
                    <div class="form-group">
                        <label>User Email</label>
                        <input class="form-control" id="useremail" type="email">
                        <i class="icon_mail_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Your password</label>
                        <input class="form-control" type="password" id="password">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Confirm password</label>
                        <input class="form-control" type="password" id="conpassword">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div id="pass-info" class="clearfix"></div>
                    <a onclick="userSignup()" class="btn_1 rounded full-width add_top_30">Register Now!</a>
                    <div class="text-center add_top_10">Already have an acccount? <strong><a href="UserLogin.jsp">Login !</a></strong></div>
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