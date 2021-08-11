package controller;

import model.bean.User;
import model.reponsitory.IUserRepository;
import model.reponsitory.UserRepository;
import model.service.IUserService;
import model.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/users",""})
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");
        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                createUser(request,response);
                break;
            case "update":
                try {
                    editUserStore(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "search":
                searchUser(request,response);
                break;
            case "sort":
                orderBy(request,response);
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");
        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                showCreateUser(request,response);
                break;
            case "update":
                showEditUser(request, response);
                break;
            case "delete":
                try {
                    removeUserStore(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
//                deleteUser(request,response);
                break;
            case "search":
                showSearchUser(request,response);
                break;
            case "permision":
                addUserP(request, response);
                break;
            case "test-without-tran":
                testWithoutTran(request, response);
                break;
            case "test-use-tran":

                testUseTran(request, response);
                break;
            default:
//                showListUser(request, response);
                try {
                    listUserStore(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
        }
    }


    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = this.iUserService.findAll();
        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(name, email, country);
        this.iUserService.insertUserStore(user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreateUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(id, name, email,country);
        this.iUserService.update(user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/update.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("userId"));
        User editUser = this.iUserService.getUserById(id);
        request.setAttribute("user", editUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/update.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("userId"));
        this.iUserService.delete(id);

        List<User> deleteUser = this.iUserService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        request.setAttribute("listUser", deleteUser);

        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showSearchUser (HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/search.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchUser (HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> listU = this.iUserService.search(country);
        request.setAttribute("listUser", listU);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void orderBy(HttpServletRequest request, HttpServletResponse response) {
        List<User> list = this.iUserService.orderBy();
        request.setAttribute("listUser", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void addUserP(HttpServletRequest request, HttpServletResponse response) {

        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");

        int[] permision = {1, 2, 4};

        this.iUserService.addTransaction(user, permision);

    }
    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {

        this.iUserService.insertUpdateWithoutTransaction();

    }
    private void testUseTran(HttpServletRequest request, HttpServletResponse response) {

        this.iUserService.insertUpdateUseTransaction();

    }
    private void removeUserStore(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.iUserService.deleteUserStore(id);

        List<User> listUser = this.iUserService.findAll();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUserStore(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        request.setAttribute("listUser", this.iUserService.displayUserStore());
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }
    private void editUserStore(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User user = new User(id, name, email, country);
        this.iUserService.editUserStore(user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (ServletException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
}