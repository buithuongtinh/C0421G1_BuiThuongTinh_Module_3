package model.service.impl;

import model.bean.Product;
import model.repository.IProductRepository;
import model.repository.impl.ProductRepository;
import model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {

    private IProductRepository service = (IProductRepository) new ProductRepository();
    @Override
    public List<Product> findAll() {
        return service.findAll();
    }

    @Override
    public void save(Product product) {
        service.save(product);

    }

    @Override
    public void remove(int id) {
        service.remove(id);
    }

    @Override
    public Product findById(int id) {
        return service.findById(id);
    }

    @Override
    public Product findByName(String name) {
        return service.findByName(name);
    }

    @Override
    public void update(int id, Product product) {
        service.update(id, product);
    }
}
