package pun.database.PunWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import pun.database.PunWeb.model.User;
import pun.database.PunWeb.model.RegisterRequest;
import pun.database.PunWeb.model.LoginRequest;
import pun.database.PunWeb.service.UserService;

import java.util.List;

@RestController
@RequestMapping("/users")
@CrossOrigin(origins = "http://localhost:3000")
public class UserController {

    @Autowired
    private UserService userService;

    // ========= 註冊 API =========
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest req) {

        // 1. 檢查必填欄位
        if (req.getUsername() == null || req.getUsername().isEmpty()
                || req.getPassword() == null || req.getPassword().isEmpty()
                || req.getConfirmPassword() == null || req.getConfirmPassword().isEmpty()) {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body("帳號或密碼不得為空");
        }

        // 2. 檢查密碼是否一致
        if (!req.getPassword().equals(req.getConfirmPassword())) {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body("兩次密碼不一致");
        }

        // 3. 檢查帳號是否已存在
        if (userService.existsByUsername(req.getUsername())) {
            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body("此帳號已被使用");
        }

        // 4. 建立 User 實體並存入資料庫
        User user = new User();
        user.setUsername(req.getUsername());
        user.setPassword(req.getPassword()); // 最簡單版，先不加密

        userService.register(user);

        // 5. 回傳成功訊息
        return ResponseEntity.ok("註冊成功");
    }

    // ========= 登入 API =========
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest req) {

        // 1. 檢查必填欄位
        if (req.getUsername() == null || req.getUsername().isEmpty()
                || req.getPassword() == null || req.getPassword().isEmpty()) {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body("帳號或密碼不得為空");
        }

        // 2. 驗證帳號密碼
        boolean valid = userService.validateUser(req.getUsername(), req.getPassword());

        if (!valid) {
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .body("帳號或密碼錯誤");
        }

        // 3. 最簡單版：只回文字，之後要加 JWT 或 user 資料再改
        return ResponseEntity.ok("登入成功");
    }

    // ========= 測試用：取得所有使用者 =========
    @GetMapping
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }
}
