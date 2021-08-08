<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View user</title>
</head>
<body>
<h1>User details</h1>
<p>
    <a href="/users">Back to user list</a>
</p>
<table><tr>
    <td>Id: </td>
    <td>${requestScope["user"].getId()}</td>
</tr>
    <tr>
        <td>Name: </td>
        <td>${requestScope["user"].getName()}</td>
    </tr>
    <tr>
        <td>Email: </td>
        <td>${requestScope["user"].getEmail()}</td>
    </tr>
    <tr>
        <td>Country: </td>
        <td>${requestScope["user"].getCountry()}</td>
    </tr>
</table>
</body>
</html>
