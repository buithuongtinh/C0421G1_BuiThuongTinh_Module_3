package model.service;

import model.bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    void remove(int id);
    Product findById(int id);
    Product findByName(String name);
    void update(int id,Product product);
}
