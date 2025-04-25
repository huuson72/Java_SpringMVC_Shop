package vn.son.laptopshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.son.laptopshop.domain.Order;
import vn.son.laptopshop.domain.Product;
import vn.son.laptopshop.domain.User;
import vn.son.laptopshop.domain.dto.ChangePasswordRequest;
import vn.son.laptopshop.domain.dto.RegisterDTO;
import vn.son.laptopshop.domain.dto.UpdateUserDTO;
import vn.son.laptopshop.service.OrderService;
import vn.son.laptopshop.service.ProductService;
import vn.son.laptopshop.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(
            ProductService productService,
            UserService userService,
            PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/page/{pageNumber}")
    public String listProducts(@PathVariable int pageNumber, Model model) {
        int pageSize = 8; // Số sản phẩm hiển thị trên một trang
        Page<Product> productPage = productService.findPaginated(pageNumber, pageSize);

        model.addAttribute("products", productPage.getContent()); // Danh sách sản phẩm
        model.addAttribute("currentPage", productPage.getNumber()); // Trang hiện tại
        model.addAttribute("totalPages", productPage.getTotalPages()); // Tổng số trang

        return "client/homepage/show";
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 8);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<String> factories = productService.findAllFactories();
        model.addAttribute("factories", factories);

        model.addAttribute("products", prs.getContent());
        model.addAttribute("currentPage", prs.getNumber());
        model.addAttribute("totalPages", prs.getTotalPages());

        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
            //Kiểm tra dữ liệu từ form đăng ký thông qua BindingResult
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        // validate
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        // save
        this.userService.handleSaveUser(user);
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {

        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {

        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);

        return "client/cart/order-history";
    }

    @GetMapping("/profile")
    public String getProfilePage(Model model) {

        return "client/auth/profile";
    }

    @GetMapping("/sale")
    public String getSalePage(Model model) {

        return "client/product/sale";
    }

    @GetMapping("/usersup")
    public String showSupportUser(Model model) {

        return "client/homepage/showsupport"; // Trả về tên của JSP trang hiển thị
    }

    @GetMapping("/tracking")
    public String showTracking(Model model) {

        return "client/cart/tracking"; // Trả về tên của JSP trang hiển thị
    }

    @GetMapping("/user/changepass")
    public String getChangePassPage(Model model) {
        model.addAttribute("changePasswordRequest", new ChangePasswordRequest());
        return "client/auth/changepass"; // Tên file giao diện (JSP hoặc Thymeleaf)
    }

    @PostMapping("/user/changepass")
    public String handleChangePassword(
            @ModelAttribute("changePasswordRequest") @Valid ChangePasswordRequest request,
            BindingResult bindingResult,
            HttpServletRequest httpRequest,
            Model model) {

        // Nếu có lỗi từ form
        if (bindingResult.hasErrors()) {
            return "client/auth/changepass";
        }

        // Lấy email người dùng hiện tại từ session
        HttpSession session = httpRequest.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            model.addAttribute("error", "Bạn cần đăng nhập để đổi mật khẩu.");
            return "client/auth/changepass";
        }

        String email = (String) session.getAttribute("email");

        try {
            // Gọi service để đổi mật khẩu
            userService.changePassword(email, request.getOldPassword(), request.getNewPassword());
            model.addAttribute("message", "Đổi mật khẩu thành công!");
            return "client/auth/changepass";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "client/auth/changepass";
        }
    }

    @GetMapping("/user/changeinfo")
    public String getChangeInfoPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            return "redirect:/login";
        }

        String email = (String) session.getAttribute("email");
        User user = userService.getUserByEmail(email);
        if (user == null) {
            return "redirect:/login";
        }

        // Chuyển dữ liệu từ User sang DTO
        UpdateUserDTO userDTO = new UpdateUserDTO();
        userDTO.setFullName(user.getFullName());
        userDTO.setAddress(user.getAddress());
        userDTO.setPhone(user.getPhone());

        model.addAttribute("userDTO", userDTO);
        return "client/auth/changeinfo";
    }

    @PostMapping("/user/changeinfo")
    public String handleChangeInfo(
            @ModelAttribute("userDTO") @Valid UpdateUserDTO userDTO,
            BindingResult bindingResult,
            HttpServletRequest request,
            Model model) {

        if (bindingResult.hasErrors()) {
            return "client/auth/changeinfo";
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            return "redirect:/login";
        }

        String email = (String) session.getAttribute("email");
        User existingUser = userService.getUserByEmail(email);
        if (existingUser == null) {
            return "redirect:/login";
        }

        // Cập nhật thông tin
        existingUser.setFullName(userDTO.getFullName());
        existingUser.setAddress(userDTO.getAddress());
        existingUser.setPhone(userDTO.getPhone());
        userService.saveUser(existingUser);

        model.addAttribute("message", "Thông tin đã được cập nhật thành công.");
        return "client/auth/changeinfo";
    }

}
