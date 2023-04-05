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
        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

            <%
                String detailid = request.getParameter("detailid");
            %>
            var detailid = "<%=detailid%>";

            function addPhoto()
            {
                var photo = document.getElementById("photo").files[0];


                if (document.getElementById("photo").files.length == 0)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select City Photo!'
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
                                document.getElementById("photo").value = "";

                                Swal.fire({
                                    icon: 'sucsess',
                                    title: 'Done...',
                                    text: 'Photo successfully added'
                                });
                                showAddedPhotos();
                            } else
                            {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'Error Occured!'
                                });
                            }

                        }
                    };
                    //2. Prepare request (Define target --> servlet)
                    xhttp.open("POST", "./OwnerAddPropertiyPhoto?detailid=" + detailid, true);

                    var formdata = new FormData();
                    formdata.append("photo", photo);

                    //3. Send Request
                    xhttp.send(formdata);
                }
            }


            function showAddedPhotos()
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

                        ans = ans + "<div class=\"row\" >";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"col-sm-3\" style=\"text-align: center; padding: 5px; margin: 1px\" >";
                            ans = ans + "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'" + st.photo + "\' ><br><br>";
                            ans = ans + "<input type=\"button\" value=\"Delete\" class=\"btn btn-success\" onclick=\"deletePhoto('" + st.photoid + "')\" ><br>";
                            ans = ans + "</div>";


                        }
                        ans = ans + "</div>";
                        document.getElementById("showaddedphotos").innerHTML = ans;

                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Post", "./OwnerShowPropertiesPhotosServlet?detailid=" + detailid, true);

                //3. Send Request
                xhttp.send();
            }


            function deletePhoto(photoid)
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
                            Swal.fire({
                                    icon: 'sucsess',
                                    title: 'Done...',
                                    text: 'Photo successfully deleted'
                                });
                            showAddedPhotos();
                        } else
                        {

                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Error While Deleting!'
                            });
                        }
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./DeleteOwnerPropertyPhotoServlet?photoid=" + photoid, true);

                //3. Send Request
                xhttp.send();
            }

        </script>

    </head>

    <body onload="showAddedPhotos()">
        <%@include file="OwnerNavbar.jsp"%><br><br><br>
        <div class="container">
            <div id="login">
                <br>
                <form autocomplete="off">
                    <h2 style="text-align: center"><b>Add Photos of that property</b></h2><br>

                    <div class="form-group">
                        <label>Photo</label><br>
                        <input style="border: 2px solid black; border-radius: 10px" id="photo" type="file" >
                    </div>

                    <div id="pass-info" class="clearfix"></div>
                    <input type="button" value="Add Photo" onclick="addPhoto()" class="btn_1 rounded full-width add_top_30">

                </form>
            </div>
        </div>

        <div class="container" ><hr><br>
            <h2 style="text-align: center" ><b>Added Photos</b></h2>
            <div id="showaddedphotos" style="border: 2px solid black; border-radius: 10px;margin: 40px;background-color: white; padding: 10px" >

            </div>
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