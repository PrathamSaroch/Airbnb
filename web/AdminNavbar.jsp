<header class="header menu_fixed" style="background-color: black">
                <div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
                <div id="logo">
                    <a href="">
                        <img src="img/logo.svg" width="150" height="36" alt="" class="logo_normal">
                        <img src="img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
                    </a>
                </div>
                <!-- /top_menu -->
                <a href="#menu" class="btn_mobile">
                    <div class="hamburger hamburger--spin" id="hamburger">
                        <div class="hamburger-box">
                            <div class="hamburger-inner"></div>
                        </div>
                    </div>
                </a>
                
                <%
                    String adminemail = (String) session.getAttribute("adminemail");
                    
                    if(adminemail != null)
                    {
                %>
                
                <nav id="menu" class="main-menu">
                    <ul>
                        <li><span>Welcome : <%=adminemail%></span>
                            
                        </li>
                        <li><span><a href="AdminLogout.jsp">Logout !</a></span>
                        
                        </li>
                        
                        <li><span><a href="#0">Hotels</a></span>
                            
                        </li>
                        
                        <li><span><a href="adventure.html">Adventure</a></span></li>
                    </ul>
                    <%
                    
                        }
                    %>
                </nav>
            </header>