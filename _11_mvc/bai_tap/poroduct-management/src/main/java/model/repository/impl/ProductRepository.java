package model.repository.impl;

import model.bean.Product;
import model.repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> products = new HashMap<>();

    static {
        products.put(1,new Product(1,"Sony M1",300,"phone","Sony"));
        products.put(2,new Product(2,"Iphone 11",1100,"phone","Apple"));
        products.put(3,new Product(3,"Samsung S20",1200,"phone","Samsung"));
        products.put(4,new Product(4,"Xiaomi Mi11",900,"phone","Xiaomi"));
        products.put(5,new Product(5,"Oppo Reno 5",500,"phone","Oppo"));
        products.put(6,new Product(6,"RealMe 8Pro",400,"phone","RealMe"));
    }
    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public Product findByName(String name) {
        List<Product> list =findAll();
        for(Product product : list){
            if(name.equals(product.getName())){
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }
}
