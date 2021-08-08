package moder.repository;

import moder.bean.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public String updateUser(User user) throws SQLException {
        int row = 0;
        PreparedStatement preparedStatement
                = this.baseRepository.getConnection().prepareStatement
                ("update `users`\n " +
                        "set `name` = ?,email =?,country =?" +
                        "where id = ?");
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        preparedStatement.setString(4,user.getId()+"");
        row = preparedStatement.executeUpdate();
        return row > 0? "success" : "fail";
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            PreparedStatement preparedStatement
                    = this.baseRepository.getConnection().prepareStatement
                    ("select id,name,email,country from `users` where id = ?");
            preparedStatement.setString(1,id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement
                    = this.baseRepository.getConnection().prepareStatement("select id,name,email,country from `users`");
            ResultSet resultSet = preparedStatement.executeQuery();
            User user = null;
            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        PreparedStatement preparedStatement
                = this.baseRepository.getConnection().prepareStatement("delete from  `users` where id = ?;");
        preparedStatement.setString(1,id+"");
        rowDeleted=preparedStatement.executeUpdate()>0;
        return rowDeleted;
    }

    @Override
    public void createUser(User user) throws SQLException {
        PreparedStatement preparedStatement
                = this.baseRepository.getConnection().prepareStatement("INSERT INTO users  (id,name, email, country) VALUES (?,?, ?, ?)");
        preparedStatement.setString(1,user.getId()+"");
        preparedStatement.setString(2,user.getName());
        preparedStatement.setString(3,user.getEmail());
        preparedStatement.setString(4,user.getCountry());
        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();
    }

    @Override
    public User selectUserByCountry(String country) {
        User user = null;
        try {
            PreparedStatement preparedStatement
                    = this.baseRepository.getConnection().prepareStatement
                    ("select id,name,email,country from `users` where country = ?");
            preparedStatement.setString(1,country);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> viewUserByCountry(String country) {
        List<User> userListByCountry = new ArrayList<>();
        try {
            PreparedStatement preparedStatement
                    = this.baseRepository.getConnection().prepareStatement("select id,name,email,country from `users` where country = ?");
            ResultSet resultSet = preparedStatement.executeQuery();
            User user = null;
            while (resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userListByCountry.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userListByCountry;
    }
}
