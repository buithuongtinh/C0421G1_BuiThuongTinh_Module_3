<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
<form action="" method="post">
    <input type="hidden" name="actionClient" value="viewByCountry1">
</form>
<h2>User List By Country</h2>
<p style="color: blue;">${msg}</p>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach var="User" items="${UserListServletByCountry}" >
        <tr>
            <td><c:out value="${User.id}"></c:out></td>
            <td><c:out value="${User.name}"></c:out></td>
            <td><c:out value="${User.email}"></c:out></td>
            <td><c:out value="${User.country}"></c:out></td>
        </tr>
    </c:forEach>


</table>
</body>
</html>
