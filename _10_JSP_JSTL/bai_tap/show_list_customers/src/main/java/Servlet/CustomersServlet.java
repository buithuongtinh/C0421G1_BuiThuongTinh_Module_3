package Servlet;

import Custommer.Customers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Servlet.CustomersServlet" ,urlPatterns = {""})
public class CustomersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       List<Customers> customersList = new ArrayList<>();
       customersList.add(new Customers("Mai Văn Hoàn ","1983-08-03","HN","https://vtv1.mediacdn.vn/thumb_w/650/2020/4/20/one-piece-anime-hiatus-15873776419971960853722.jpg"));
       customersList.add(new Customers("Nguyễn Văn Nam","1991-08-08","Sg","https://images.pexels.com/photos/7725311/pexels-photo-7725311.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"));
       customersList.add(new Customers("Hoàng Hồng Hạnh ","1999-09-03","Dn","https://images.pexels.com/photos/8107303/pexels-photo-8107303.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"));
       customersList.add(new Customers("Nguyễn Thanh Toán","2000-12-12","Sg","https://images.pexels.com/photos/8899328/pexels-photo-8899328.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"));


       request.setAttribute("customerList",customersList);
       request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
