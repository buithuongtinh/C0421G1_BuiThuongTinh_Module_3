<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 8/3/2021
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Customers list</title>
  </head>
  <body>
  <h2>Customers list</h2>
  <table border="1">
    <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Dịa chỉ</th>
      <th>ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" >
      <tr>
          <td><c:out value="${customer.name}"/></td>
          <td><c:out value="${customer.ngaySinh}"/></td>
          <td><c:out value="${customer.diaChi}"/></td>
          <td><img  src="${customer.img}" width="250px" height="300px"/></td>

      </tr>
    </c:forEach>
  </table>

  </body>
</html>
