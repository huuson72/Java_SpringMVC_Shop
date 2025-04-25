package vn.son.laptopshop.service.userinfo;

import java.util.Collections;
import java.util.Map;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import vn.son.laptopshop.domain.Role;
import vn.son.laptopshop.domain.User;
import vn.son.laptopshop.service.UserService;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserService userService;

    public CustomOAuth2UserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        Map<String, Object> attributes = oAuth2User.getAttributes();

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        String email = (String) attributes.get("email");
        String fullName = (String) attributes.get("name");
        Role userRole = this.userService.getRoleByName("USER");

        if (email != null) {
            System.out.println("Checking user in database: " + email);
            User user = this.userService.getUserByEmail(email);

            if (user == null) {
                User newUser = new User();
                newUser.setEmail(email);
                newUser.setAvatar("default-google.png");
                newUser.setFullName(fullName != null ? fullName : "Unknown Name");
                newUser.setPassword("hoidannit"); // Mặc định, nên được mã hóa nếu cần
                // newUser.setProvider("GOOGLE");
                newUser.setRole(userRole);

                System.out.println("Attempting to save new user: " + newUser);
                this.userService.saveUser(newUser);
                System.out.println("User saved successfully!");
            } else {
                System.out.println("User already exists: " + user);
            }
        }

        return new DefaultOAuth2User(
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + userRole.getName())),
                oAuth2User.getAttributes(),
                "email");
    }

}
