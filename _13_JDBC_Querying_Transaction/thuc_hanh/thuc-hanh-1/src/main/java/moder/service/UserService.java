package moder.service;

import moder.repository.IUserRepository;
import moder.repository.UserRepositoryImpl;
import moder.bean.User;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserService implements UserServiceImp {
    IUserRepository iUserRepository = new UserRepositoryImpl();
    @Override
    public String updateUser(User user) throws SQLException {
        String msg = null;
        if (user.getName().matches("[A-Za-z ]+")
                &&user.getEmail().matches("^[A-Za-z0-9+_.-]+@(.+)$")
                &&user.getCountry().matches("[A-Za-z ]+")) {
            msg = iUserRepository.updateUser(user);
        }else {
            msg = "failed";
        }
        return msg;
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public void createUser(User user) throws SQLException {
        iUserRepository.createUser(user);
    }

    @Override
    public User selectUserByCountry(String country) {
        return iUserRepository.selectUserByCountry(country);
    }

    @Override
    public List<User> viewUserByCountry(String country) {
        return iUserRepository.viewUserByCountry(country);
    }

    @Override
    public User getUserById(int id) {
        User user = null;

        String query = "{CALL get_user_by_id(?)}";

        // Step 1: Establishing a Connection

        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object

             CallableStatement callableStatement = connection.prepareCall(query);) {

            callableStatement.setInt(1, id);

            // Step 3: Execute the query or update query

            ResultSet rs = callableStatement.executeQuery();

            // Step 4: Process the ResultSet object.

            while (rs.next()) {

                String name = rs.getString("name");

                String email = rs.getString("email");

                String country = rs.getString("country");

                user = new User(id, name, email, country);

            }

        } catch (SQLException e) {

            printSQLException(e);

        }

        return user;
    }

    private void printSQLException(SQLException e) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        String query = "{CALL insert_user(?,?,?)}";

        // try-with-resource statement will auto close the connection.

        try (Connection connection = getConnection();

             CallableStatement callableStatement = connection.prepareCall(query);) {

            callableStatement.setString(1, user.getName());

            callableStatement.setString(2, user.getEmail());

            callableStatement.setString(3, user.getCountry());

            System.out.println(callableStatement);

            callableStatement.executeUpdate();

        } catch (SQLException e) {

            printSQLException(e);

        }
    }
}
