
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/5/2021
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
<h2>User List</h2>
<a href="/users?actionClient=create">Create new User</a>
<form action="" method="post">
    <input type="hidden" name="actionClient" value="viewByCountry">
    <p>Tìm tên theo quốc gia</p>
    <input type="text" name="UserCountry" value="">
    <input type="submit" value="Tìm Kiếm">
</form>
<p style="color: blue;">${msg}</p>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="3">Action</th>
    </tr>
    <c:forEach var="User" items="${UserListServlet}" >
        <tr>
            <td><c:out value="${User.id}"></c:out></td>
            <td><c:out value="${User.name}"></c:out></td>
            <td><c:out value="${User.email}"></c:out></td>
            <td><c:out value="${User.country}"></c:out></td>
            <td>
                <a href="/users?actionClient=update&userId=${User.id}">Update</a>
            </td>
            <td>
                <a href="/users?actionClient=delete&userId=${User.id}">Delete</a>
            </td>
            <td>
                <a href="/users?actionClient=view&userId=${User.id}">View</a>
            </td>
        </tr>
    </c:forEach>


</table>
</body>
</html>