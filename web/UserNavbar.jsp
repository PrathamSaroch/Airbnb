
<script>

    function userLogout()
    {
        window.location.href = "UserLogout.jsp";
    }

</script>

<header class="header menu_fixed">
    <div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
    <div id="logo">
        <a href="index-2.html">
            <img src="img/logo.svg" width="150" height="36" alt="" class="logo_normal">
            <img src="img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
        </a>
    </div>
    <ul id="top_menu">
        <li><a href="" class="cart-menu-btn" title="Cart"><strong>4</strong></a></li>
        <li><a href="" id="sign-in" class="login" title="Sign In">Sign In</a></li>
        <li><a href="" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
    </ul>
    <!-- /top_menu -->
    <a href="#menu" class="btn_mobile">
        <div class="hamburger hamburger--spin" id="hamburger">
            <div class="hamburger-box">
                <div class="hamburger-inner"></div>
            </div>
        </div>
    </a>

    <nav id="menu" class="main-menu">
        <ul>

            <%
                String useremail1 = (String) session.getAttribute("useremail");

                if (useremail1 != null) {
            %>

            <li><span><a>Welcome : <%=useremail1%> </a></span></li>
            <li><span><a href="index_1.jsp">Main Page</a></span>
            <li><span><a href="UserViewBookings.jsp">View Your Bookings</a></span></li>
            <li><span><a onclick="userLogout()" >Logout !</a></span></li>
                        <%
                        } else {
                        %>

            <li><span><a href="#0">Home</a></span>
                <ul>
                    <li><a href="UserLogin.jsp">User Login</a></li>
                    <li><a href="UserSignup.jsp">User Signup</a></li>
                    <li><a href="OwnerLogin.jsp">Property Owner Login</a></li>
                    <li><a href="OwnerSignup.jsp">Property Owner Signup</a></li>
                    <li><a href="AdminLogin.jsp">Admin Login</a></li>
                </ul>
            </li>

            <%
                }
            %>

            
                

            </li>

            <!--<li><span><a href="UserViewBookings.jsp">Adventure</a></span></li>-->
        </ul>
    </nav>
</header>