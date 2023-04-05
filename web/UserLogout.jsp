<%-- 
    Document   : UserLogout
    Created on : 15-Mar-2023, 5:25:29 pm
    Author     : Pratham Saroch
--%>

<%
    session.removeAttribute("useremail");
    response.sendRedirect("index_1.jsp");
%>
