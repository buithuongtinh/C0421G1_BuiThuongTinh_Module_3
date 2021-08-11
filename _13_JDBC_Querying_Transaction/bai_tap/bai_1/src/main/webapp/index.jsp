
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>List user</title>
  <style>
    .center {
      text-align: center;
    }
  </style>
</head>
<body>
<div align="center">
  <h1>List user</h1>
  <p><a href="/users?actionClient=create">Create new user</a></p>
  <p><a href="/users?actionClient=search&userId=${user.getId()}">Search user</a></p>
  <table>
    <tr>
      <td>
        <form action="/users?actionClient=sort" method="post">
          <input type="submit" id="submit" value="Sort">
        </form>
      </td>
      <td>
        <form action="/users">
          <input type="submit" id="submit1" value="Back">
        </form>
      </td>
    </tr>
  </table>
</div>
</div>
<table border="1" align="center">
  <tr>
    <td>Id</td>
    <td>Name</td>
    <td>Email</td>
    <td>Country</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach var="user" items="${listUser}">
    <tr>
      <td><c:out value="${user.id}"/></td>
      <td><c:out value="${user.name}"/></td>
      <td><c:out value="${user.email}"/></td>
      <td><c:out value="${user.country}"/></td>
      <td><a href="/users?actionClient=update&userId=${user.getId()}">edit</a></td>
      <td><a href="/users?actionClient=delete&userId=${user.getId()}">delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>