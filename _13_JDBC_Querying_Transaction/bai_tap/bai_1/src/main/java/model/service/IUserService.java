package model.service;

import model.bean.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    User findById(int id);
    void create(User user);
    void update(User user);
    void delete(int id);
    List<User> search (String country);
    List<User> orderBy();
    User getUserById(int id);
    void insertUserStore(User user);
    void addTransaction(User user, int[] permision);
    public void insertUpdateWithoutTransaction();
    public void insertUpdateUseTransaction();
    List<User> displayUserStore();

    void editUserStore(User user);

    void deleteUserStore(int id);
}
