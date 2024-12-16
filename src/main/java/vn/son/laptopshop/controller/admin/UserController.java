package vn.son.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.son.laptopshop.domain.User;
import vn.son.laptopshop.service.UploadService;
import vn.son.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(
            UploadService uploadService,
            UserService userService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("1@gmail.com");
        System.out.println(arrUsers);

        model.addAttribute("son", "test");
        model.addAttribute("sontau", "from controller with model");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<User> usersPage = this.userService.getAllUsers(pageable);
        List<User> users = usersPage.getContent();
        model.addAttribute("users1", users);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", usersPage.getTotalPages());
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User son,
            BindingResult newUserBindingResult,
            @RequestParam("sonFile") MultipartFile file) {

        // List<FieldError> errors = newUserBindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(">>>>" + error.getField() + " - " +
        // error.getDefaultMessage());
        // }
        // validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        //
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(son.getPassword());

        son.setAvatar(avatar);
        son.setPassword(hashPassword);
        son.setRole(this.userService.getRoleByName(son.getRole().getName()));
        // save
        this.userService.handleSaveUser(son);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User son) {
        User currentUser = this.userService.getUserById(son.getId());
        if (currentUser != null) {
            currentUser.setAddress(son.getAddress());
            currentUser.setFullName(son.getFullName());
            currentUser.setPhone(son.getPhone());

            // bug here
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User eric) {
        this.userService.deleteAUser(eric.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/finance")
    public String showFinancePage(Model model) {
        // Bạn có thể thêm dữ liệu vào model nếu cần thiết
        model.addAttribute("pageTitle", "Quản Lý Tài Chính");
        // Trả về tên tệp JSP tương ứng
        return "admin/finance/finance"; // Tên tệp JSP (không cần phần mở rộng .jsp)
    }

    @GetMapping("/admin/generateReport")
    public String showFinancePageCreate(Model model) {
        // Bạn có thể thêm dữ liệu vào model nếu cần thiết
        model.addAttribute("pageTitle", "Quản Lý Tài Chính");
        // Trả về tên tệp JSP tương ứng
        return "admin/finance/report"; // Tên tệp JSP (không cần phần mở rộng .jsp)
    }

    @GetMapping("/admin/changepass")
    public String getChangePasswordPage(Model model) {
        model.addAttribute("pageTitle", "Đổi Mật Khẩu Admin");
        return "admin/auth/change_password"; // Tên tệp JSP (không cần phần mở rộng .jsp)
    }

    @GetMapping("/admin/promotion")
    public String showCreatePromotionForm(Model model) {

        return "admin/promotion/create"; // Trả về tên JSP cho giao diện tạo khuyến mãi
    }

    @GetMapping("/list")
    public String showPromotionList(Model model) {

        return "admin/promotion/list"; // Trả về tên JSP cho giao diện danh sách khuyến mãi
    }

    @GetMapping("review")
    public String showReviewList(Model model) {

        return "admin/review/list"; // Trả về tên của JSP trang hiển thị
    }

    @GetMapping("support")
    public String showRequestSupport(Model model) {

        return "admin/support/request"; // Trả về tên của JSP trang hiển thị
    }

    @GetMapping("/admin/report")
    public String showFinanceReport(Model model) {

        return "admin/finance/report"; // Tên tệp JSP (không cần phần mở rộng .jsp)
    }

    @GetMapping("/admin/profit")
    public String showFinanceProfit(Model model) {

        return "admin/finance/profit"; // Tên tệp JSP (không cần phần mở rộng .jsp)
    }
}
