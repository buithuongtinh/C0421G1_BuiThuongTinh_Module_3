package model.service;

import model.bean.User;
import model.reponsitory.IUserRepository;
import model.reponsitory.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return this.iUserRepository.findAll();
    }

    @Override
    public User findById(int id) {
        return this.iUserRepository.findById(id);
    }

    @Override
    public void create(User user) {
        this.iUserRepository.create(user);
    }

    @Override
    public void update(User user) {
        this.iUserRepository.update(user);
    }

    @Override
    public void delete(int id) {
        this.iUserRepository.delete(id);
    }

    @Override
    public List<User> search(String country) {
        return this.iUserRepository.search(country);
    }

    @Override
    public List<User> orderBy() {
        return this.iUserRepository.orderBy();
    }

    @Override
    public User getUserById(int id) {
        return this.iUserRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) {
        this.iUserRepository.insertUserStore(user);
    }

    @Override
    public void addTransaction(User user, int[] permision) {
        this.iUserRepository.addTransaction(user, permision);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        this.iUserRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        this.iUserRepository.insertUpdateUseTransaction();
    }

    @Override
    public List<User> displayUserStore() {
        return this.iUserRepository.displayUserStore();
    }

    @Override
    public void editUserStore(User user) {
        this.iUserRepository.editUserStore(user);
    }

    @Override
    public void deleteUserStore(int id) {
        this.iUserRepository.deleteUserStore(id);
    }
}