package moder.service;

import moder.repository.IUserRepository;
import moder.repository.UserRepositoryImpl;
import moder.bean.User;

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
}
