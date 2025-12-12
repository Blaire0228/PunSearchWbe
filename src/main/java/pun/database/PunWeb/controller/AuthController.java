package pun.database.PunWeb.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pun.database.PunWeb.model.*;
import pun.database.PunWeb.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import java.util.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:5173", allowCredentials = "true")
public class AuthController {

    private final UserRepository userRepository;

    public AuthController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest req) {

        if (req.getUsername() == null || req.getUsername().isBlank()) {
            return ResponseEntity.badRequest().body("帳號不能是空白");
        }

        if (!req.getPassword().equals(req.getConfirmPassword())) {
            return ResponseEntity.badRequest().body("密碼與確認密碼不一致");
        }

        if (userRepository.existsByUsername(req.getUsername())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("帳號已被使用");
        }

        User newUser = new User();
        newUser.setUsername(req.getUsername());
        newUser.setPassword(req.getPassword()); //（簡化：未加密）

        userRepository.save(newUser);

        return ResponseEntity.ok("註冊成功");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest req, HttpSession session) {

        Optional<User> userOpt = userRepository.findByUsername(req.getUsername());

        if (userOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("帳號或密碼錯誤");
        }

        User user = userOpt.get();

        if (!user.getPassword().equals(req.getPassword())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("帳號或密碼錯誤");
        }

        session.setAttribute("USER_ID", user.getMemberId());
        session.setAttribute("USERNAME", user.getUsername());

        return ResponseEntity.ok("登入成功");
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(HttpSession session) {
        session.invalidate();
        return ResponseEntity.ok("已登出");
    }

    @GetMapping("/me")
    public ResponseEntity<?> me(HttpSession session) {

        Object uid = session.getAttribute("USER_ID");

        if (uid == null) {
            return ResponseEntity.ok("未登入");
        }

        Map<String, Object> data = new HashMap<>();
        data.put("userId", uid);
        data.put("username", session.getAttribute("USERNAME"));

        return ResponseEntity.ok(data);
    }
}
