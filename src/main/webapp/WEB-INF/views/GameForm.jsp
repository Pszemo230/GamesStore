<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Przemek_Swiderski
  Date: 2015-07-16
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game Form</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/cssFile.css" />">
</head>
<body>

<div align="left" >
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        Welcome : <b> ${pageContext.request.userPrincipal.name}</b>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </c:if>
</div>

<div align="center">
    <h1>Game Form</h1>
    <table>
        <form:form action="save" method="post" modelAttribute="game">
            <form:hidden path="idGame"/>
            <tr>
                <td>Title:</td>
                <td><input id="title" name="title" type="text"><form:errors path="title" cssClass="error" /></td>
            </tr>
            <tr>
                <td>Studio:</td>
                <td><input id="studio" name="studio" type="text"><form:errors path="studio" cssClass="error" /></td>
            </tr>
            <tr>
                <td>Release Date:</td>
                <td><input id="releaseDate" name="releaseDate" type="date" value="2015-01-01">
                    <form:errors path="releaseDate" cssClass="error"  /></td>
            </tr>
            <tr>
                <td>Left in Store:</td>
                <td><input id="inStore" name="inStore" value="1" type="number" min="1"><form:errors path="inStore" cssClass="error" /></td>
            </tr>

            <tr>
                <td colspan="3" align="center">
                    <input type="submit" value="Save">
                </td>
            </tr>

        </form:form>
    </table>
</div>

<form method="get" action=".">
    <input type="submit" value="Go back to list">
</form>
</body>
</html>

