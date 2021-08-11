package controller;

import moder.bean.User;
import moder.service.UserService;
import moder.service.UserServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet",urlPatterns =  {"","/users"})
public class UserServlet extends HttpServlet {
    private UserServiceImp userServiceImp = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");
        if (actionClient == null) {
            actionClient = "";
        }
        switch (actionClient) {
            case "update":
                Integer id = Integer.parseInt(request.getParameter("UserId"));
                String name = request.getParameter("UserName");
                String email = request.getParameter("UserEmail");
                String country = request.getParameter("UserCountry");
                User user = new User();

                user.setId(id);
                user.setName(name);
                user.setEmail(email);
                user.setCountry(country);

                try {
                    if (this.userServiceImp.updateUser(user).equals("success")) {
                        request.setAttribute("msg", "Update Successful ");
                        request.setAttribute("UserListServlet", this.userServiceImp.selectAllUsers());
                        request.getRequestDispatcher("list.jsp").forward(request, response);
                    } else {
                        request.setAttribute("msg", "Update Failed ");
                        request.setAttribute("User", user);
                        request.getRequestDispatcher("update.jsp").forward(request, response);
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            case "create":
                try {
                    insertUser(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            case "viewByCountry":
                viewUserByCountry(request, response);
                break;

            case "delete":
                deleteUser(request, response);
                break;
            default:
                request.setAttribute("UserListServlet", this.userServiceImp.selectAllUsers());
                request.getRequestDispatcher("list.jsp").forward(request, response);
                break;
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("userId"));
        try {
            userServiceImp.deleteUser(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        List<User> listUser = userServiceImp.selectAllUsers();
        request.setAttribute("listUser", listUser);
        request.setAttribute("UserListServlet", this.userServiceImp.selectAllUsers());
        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewUserByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = (request.getParameter("UserCountry"));
        User user = this.userServiceImp.selectUserByCountry(country);
        RequestDispatcher dispatcher;
        if (user == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("user", user);
            dispatcher = request.getRequestDispatcher("view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
              throws SQLException, IOException, ServletException {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String country = request.getParameter("country");
            User newUser = new User(id, name, email, country);
            userServiceImp.createUser(newUser);
            List<User> listUser = userServiceImp.selectAllUsers();
            request.setAttribute("listUser", listUser);
            request.setAttribute("UserListServlet", this.userServiceImp.selectAllUsers());
            try {
                request.getRequestDispatcher("list.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");
        if (actionClient == null) {
            actionClient = "";
        }
        switch (actionClient) {
            case "update":
                Integer id = Integer.parseInt(request.getParameter("userId"));
                request.setAttribute("User", this.userServiceImp.selectUser(id));
                request.getRequestDispatcher("update.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("userId"));
                request.setAttribute("User", this.userServiceImp.selectUser(id));
                request.getRequestDispatcher("delete.jsp").forward(request, response);
//                deleteUser(request,response);
                break;
            case "create":
                showNewForm(request, response);
                break;
            case "view":
                viewUser(request, response);
                break;
            case "permision":

                addUserPermision(request, response);

                break;

            default:
                request.setAttribute("UserListServlet", this.userServiceImp.selectAllUsers());
                request.getRequestDispatcher("list.jsp").forward(request, response);
                break;
        }
    }

    private void viewUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("userId"));
        User user = this.userServiceImp.selectUser(id);
        RequestDispatcher dispatcher;
        if (user == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("user", user);
            dispatcher = request.getRequestDispatcher("view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
            request.getRequestDispatcher("create.jsp").forward(request, response);
    }
}
