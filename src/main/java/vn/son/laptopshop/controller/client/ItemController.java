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
    // Lấy thông tin chi tiết của một sản phẩm theo id từ cơ sở dữ liệu và hiển thị trang chi tiết sản phẩm.
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
        // Lấy ngươi dùng hiện tại từ session
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        // Lấy giỏ hàng của người dùng:
        Cart cart = this.productService.fetchByUser(currentUser);
        // Xử lí giỏ hàng trống
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        // Tổng tiền đơn hàng
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }
        // Truyền dữ liệu vào model
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }
//Cập nhật thông tin giỏ hàng trước khi thanh toán.

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }
// Xử lý việc tạo đơn hàng và chuyển hướng đến trang thanh toán.

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            //Các tham số truyền vào từ form thanh toán
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice) throws UnsupportedEncodingException {
        //Xử lí tạo đối tượng người dùng
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        //Tạo một UUID ngẫu nhiên cho đơn hàng
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
// thông báo kết quả thanh toán.

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
            // Kiểm tra xem có giá trị trang hiện tại trong productCriteriaDTO không
            if (productCriteriaDTO.getPage().isPresent()) {
                // Nếu có, chuyển đổi từ String sang int để lấy số trang
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // Nếu không có, giữ giá trị page là 1 (trang đầu tiên)
            }
        } catch (Exception e) {
            // Nếu có lỗi trong quá trình chuyển đổi (ví dụ: trang không hợp lệ), giữ page = 1
            // TODO: handle exception
        }

        // Khởi tạo đối tượng Pageable với số trang là `page - 1` và mỗi trang có tối đa 10 sản phẩm
        Pageable pageable = PageRequest.of(page - 1, 10);
        // Kiểm tra nếu có yêu cầu sắp xếp sản phẩm theo giá
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            // Lấy giá trị sắp xếp từ productCriteriaDTO
            String sort = productCriteriaDTO.getSort().get();
            // Nếu yêu cầu sắp xếp theo giá tăng dần
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }
        // Gọi phương thức fetchProductsWithSpec để lấy danh sách sản phẩm từ service với các tiêu chí lọc và phân trang
        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);
        // Lấy danh sách sản phẩm từ kết quả Page. Nếu không có sản phẩm, trả về danh sách trống.
        List<Product> products = prs.getContent().size() > 0 ? prs.getContent()
                : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // Nếu có chuỗi query, loại bỏ thông tin trang hiện tại 
            qs = qs.replace("page=" + page, "");
        }
        // Thêm dữ liệu vào model để truyền cho view
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
