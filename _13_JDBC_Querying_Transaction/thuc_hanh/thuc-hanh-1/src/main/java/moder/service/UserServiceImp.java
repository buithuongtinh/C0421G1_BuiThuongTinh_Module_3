package moder.service;

import moder.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserServiceImp {
    public String updateUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public void createUser(User user) throws SQLException;

    public User selectUserByCountry(String country);

    public List<User> viewUserByCountry(String country);

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;
}
