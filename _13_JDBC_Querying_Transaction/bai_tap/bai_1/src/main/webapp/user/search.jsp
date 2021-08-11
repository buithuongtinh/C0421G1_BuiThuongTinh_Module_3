<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <style>
        h1, h2 {
            text-align: center;
        }
    </style>
</head>
<body>
<h1>Search user</h1>
<h2><a href="/users?actionClient=users">List all users</a></h2>
<div align="center">
    <form method="post">
        <table border="1">
            <caption>
                <h2>
                    Search User
                </h2>
            </caption>
            <tr>
                <th>Country:</th>
                <td>
                    <input type="text" name="country" id="country" size="20"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Search"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>