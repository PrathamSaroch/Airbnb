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

        <!-- BASE CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/vendors.css" rel="stylesheet">

        <!-- ALTERNATIVE COLORS CSS -->
        <link href="#" id="colors" rel="stylesheet">
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

            <%
                String detailid = request.getParameter("detailid");
            %>
            var detailid = "<%=detailid%>";

            function viewProperty()
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

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            document.getElementById("desc").value = st.desc;
                            document.getElementById("address").value = st.address;
                            document.getElementById("price").value = st.price;
                            document.getElementById("offerprice").value = st.offerprice;
                        }

                    }

                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./OwnerShowEditPerPropertyServlet?detailid=" + detailid, true);

                //3. Send Request
                xhttp.send();
            }

            function editProperty()
            {
                var desc = document.getElementById("desc").value;
                var address = document.getElementById("address").value;
                var price = document.getElementById("price").value;
                var offerprice = document.getElementById("offerprice").value;

                var formdata = new FormData();
                formdata.append("desc", desc);
                formdata.append("address", address);
                formdata.append("price", price);
                formdata.append("offerprice", offerprice);
                formdata.append("detailid", detailid);

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
                                    icon: 'success',
                                    title: 'Done...',
                                    text: 'Edit Successful'
                                });
                        } else
                        {
                            alert("Error Occured");
                        }

                    }

                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./OwnerEditPerPropertyServlet", true);

                //3. Send Request
                xhttp.send(formdata);

            }


        </script>


    </head>

    <body class="datepicker_mobile_full" onload="viewProperty()" ><!-- Remove this class to disable datepicker full on mobile -->

        <div id="page">

            <%@include file="OwnerNavbar.jsp"%>
            <!-- /header -->

            <main>
                <!-- /hero_single -->

                <div class="container container-custom margin_80_0">
                    <div class="main_title_2">
                        <span><em></em></span>
                        <h2>Edit Property </h2>
                    </div>

                </div>

                <div class="container container-custom margin_30_95">
                    <section class="add_bottom_45">

                        <div id="login">
                            <br>
                            <form autocomplete="off">
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea style="height: 200px; border: 2px solid black; border-radius: 10px" class="form-control" id="desc" type=""></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Address :</label>
                                    <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="address" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Price :</label>
                                    <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="price" type="text">
                                </div>
                                <div class="form-group">
                                    <label>Offer Price :</label>
                                    <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="offerprice" type="text">
                                </div>

                                <div id="pass-info" class="clearfix"></div>
                                <input type="button" value="Edit" onclick="editProperty()" class="btn_1 rounded full-width add_top_30">

                            </form>
                        </div>

                        <!-- /row -->
                    </section>


                    <!-- /banner -->

                </div>

            </main>
            <!-- /main -->

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