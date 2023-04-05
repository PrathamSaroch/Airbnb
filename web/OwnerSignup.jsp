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

            function showCities()
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

                        ans = ans + "<div class=\"dropdown form-group\">";
                        ans = ans + "<label>Choose City of your Airbnb's</label><br>";
                        ans = ans + "<select id=\"cityname\" class=\"form-control\" style=\"width: 100%\" >";
                        ans = ans + "<option></option><br>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<option value=\'" + st.cityname +"\'  >" + st.cityname + "</option><br>";

                        }
                        ans = ans + "</select>";
                        ans = ans + "</div>";

                        document.getElementById("showcities").innerHTML = ans;

                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./OwnerShowCitiesServlet", true);

                //3. Send Request
                xhttp.send();
            }

            function ownerSignup()
            {
                var name = document.getElementById("name").value;
                var airbnbname = document.getElementById("airbnbname").value;
                var phoneno = document.getElementById("phoneno").value;
                var owneremail = document.getElementById("owneremail").value;
                var password = document.getElementById("password").value;
                var compassword = document.getElementById("compassword").value;
                var cityname = document.getElementById("cityname").value;
                var photo = document.getElementById("photo").files[0];
                alert(cityname);
                if (name == "" || phoneno == "" || owneremail == "" || password == "" || compassword == "" || cityname == "" || airbnbname == "")
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
                } else if (owneremail.indexOf("@") == -1)
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
                } else if (password != compassword)
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
                                document.getElementById("name").value="";
                                document.getElementById("airbnbname").value="";
                                document.getElementById("phoneno").value="";
                                document.getElementById("owneremail").value="";
                                document.getElementById("password").value="";
                                document.getElementById("compassword").value="";
                                document.getElementById("cityname").value="";
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
                    xhttp.open("POST", "./OwnerSignupServlet", true);

                    var formdata = new FormData();
                    formdata.append("name", name);
                    formdata.append("airbnbname", airbnbname);
                    formdata.append("phoneno", phoneno);
                    formdata.append("owneremail", owneremail);
                    formdata.append("password", password);
                    formdata.append("cityname", cityname);
                    formdata.append("photo", photo);

                    //3. Send Request
                    xhttp.send(formdata);
                }
            }

        </script>

    </head>

    <body id="register_bg" onload="showCities()" >

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
                    <h2 style="text-align: center">Owner Signup</h2><br>
                    <div class="form-group">
                        <label>Owner Name</label>
                        <input class="form-control" id="name" type="text">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group" >
                        <label>Phone number</label>
                        <input class="form-control" id="phoneno" type="text">
                        <i class="ti-user"></i>
                    </div>
                    <div class="form-group" >
                        <label>Airbnb Name</label>
                        <input class="form-control" id="airbnbname" type="text">
                        <i class="ti-user"></i>
                    </div>
                    <div id="showcities" >

                        <!--Cities Show Here-->

                    </div>
                    <div class="form-group" >
                        <label>Display Picture</label>
                        <input class="form-control" id="photo" type="file">
                    </div>
                    <div class="form-group">
                        <label>Owner Email</label>
                        <input class="form-control" id="owneremail" type="email">
                        <i class="icon_mail_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Your password</label>
                        <input class="form-control" type="password" id="password">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div class="form-group">
                        <label>Confirm password</label>
                        <input class="form-control" type="password" id="compassword">
                        <i class="icon_lock_alt"></i>
                    </div>
                    <div id="pass-info" class="clearfix"></div>
                    <a onclick="ownerSignup()" class="btn_1 rounded full-width add_top_30">Register Now!</a>
                    <div class="text-center add_top_10">Already have an acccount? <strong><a href="OwnerLogin.jsp">Sign In</a></strong></div>
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