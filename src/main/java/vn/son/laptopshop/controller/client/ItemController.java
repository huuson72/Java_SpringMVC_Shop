package vn.son.laptopshop.controller.client;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.apache.tomcat.util.http.fileupload.ThresholdingOutputStream;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.son.laptopshop.domain.Cart;
import vn.son.laptopshop.domain.CartDetail;
import vn.son.laptopshop.domain.Product;
import vn.son.laptopshop.domain.Product_;
import vn.son.laptopshop.domain.User;
import vn.son.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.son.laptopshop.service.ProductService;
import vn.son.laptopshop.service.VNPayService;

@Controller
public class ItemController {

    private final ProductService productService;
    private final VNPayService vNPayService;

    public ItemController(ProductService productService, VNPayService vNPayService) {
        this.productService = productService;
        this.vNPayService = vNPayService;
    }

    // @GetMapping("/product/{id}")
    // public String getProductPage(Model model, @PathVariable long id) {
    //     Product pr = this.productService.fetchProductById(id).get();
    //     model.addAttribute("product", pr);
    //     model.addAttribute("id", id);
    //     return "client/product/detail";
    // }
    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        // Lấy sản phẩm theo id
        Product pr = this.productService.fetchProductById(id).get();

        // Lấy danh sách sản phẩm liên quan
        List<Product> relatedProducts = this.productService.fetchRelatedProducts(pr);

        // Thêm sản phẩm và sản phẩm liên quan vào model
        model.addAttribute("product", pr);
        model.addAttribute("relatedProducts", relatedProducts);

        return "client/product/detail";  // Trả về view chi tiết sản phẩm
    }

    @GetMapping("/category/{factory}")
    public String getProductsByFactory(Model model, @PathVariable String factory) {
        List<Product> products = productService.findProductsByFactory(factory); // Lấy danh sách sản phẩm
        List<String> factories = productService.findAllFactories(); // Lấy danh sách danh mục
        model.addAttribute("factories", factories); // Truyền danh mục vào model    
        model.addAttribute("products", products); // Truyền danh sách sản phẩm vào model
        model.addAttribute("categoryName", factory); // Truyền tên danh mục để hiển thị trên giao diện
        return "client/product/category"; // Tên file JSP
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session, 1);

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice) throws UnsupportedEncodingException {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        final String uuid = UUID.randomUUID().toString().replace("-", "");

        this.productService.handlePlaceOrder(currentUser, session,
                receiverName, receiverAddress, receiverPhone,
                paymentMethod, uuid);

        if (!paymentMethod.equals("COD")) {

            String ip = this.vNPayService.getIpAddress(request);
            String vnpUrl = this.vNPayService.generateVNPayURL(Double.parseDouble(totalPrice), uuid, ip);

            return "redirect:" + vnpUrl;
        }

        return "redirect:/thanks";

    }

    @GetMapping("/thanks")
    public String getThankYouPage(Model model,
            @RequestParam("vnp_ResponseCode") Optional<String> vnpayResponseCode,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef) {

        if (vnpayResponseCode.isPresent() && paymentRef.isPresent()) {
            String paymentStatus = vnpayResponseCode.get().equals("00") ? "PAYMENT_SUCCED" : "PAYMENT_FAILED";
            this.productService.updatePaymentStatus(paymentRef.get(), paymentStatus);
        }
        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 10);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent()
                : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam(name = "query", required = false) String query, Model model) {
        List<Product> products = productService.searchProducts(query);
        model.addAttribute("products", products);
        return "client/product/search";
    }

}
