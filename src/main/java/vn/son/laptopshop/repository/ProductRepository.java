package vn.son.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.son.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {

    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification<Product> spec, Pageable page);

    List<Product> findByNameContainingIgnoreCase(String name);
    // Tìm các sản phẩm có cùng thương hiệu (factory)

    List<Product> findByFactory(String factory);

    // Tìm các sản phẩm theo mục đích sử dụng (target)
    List<Product> findByTarget(String target);

    public List<Product> findByTargetAndFactory(String target, String factory);

    @Query("SELECT DISTINCT p.factory FROM Product p")
    List<String> findDistinctFactories();

}
