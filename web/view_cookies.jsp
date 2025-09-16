<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.*" %>

<%
    // Lấy tất cả cookies từ request
    Cookie[] cookies = request.getCookies();
    List<Cookie> cookieList = new ArrayList<>();
    if (cookies != null) {
        for (Cookie c : cookies) {
            cookieList.add(c);
        }
    }
    request.setAttribute("cookieList", cookieList);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>Cookies</h1>

<p>Here's a table with all of the cookies that this browser is sending to the current server.</p>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Name</th>
        <th>Value</th>
        <th>Max Age (seconds)</th>
    </tr>
    <c:forEach var="c" items="${cookieList}">
        <tr>
            <td>${c.name}</td>
            <td>${c.value}</td>
            <td>
                <c:choose>
                    <c:when test="${c.maxAge == -1}">Session Cookie</c:when>
                    <c:otherwise>${c.maxAge}</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>

<p><a href="download?action=viewAlbums">View list of albums</a></p>
<p><a href="download?action=deleteCookies">Delete all persistent cookies</a></p>

</body>
</html>
