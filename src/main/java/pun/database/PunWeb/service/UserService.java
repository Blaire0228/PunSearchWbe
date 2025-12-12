package pun.database.PunWeb.service;

import org.springframework.stereotype.Service;
import pun.database.PunWeb.model.User;
import pun.database.PunWeb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // 註冊：存進資料庫
    public User register(User user) {
        return userRepository.save(user);
    }

    // 用 username 找使用者
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    // 查全部使用者
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // 新增：檢查帳號是否存在(註冊用)
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    // 登入用，驗證帳號密碼是否正確
    public boolean validateUser(String username, String password) {
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isEmpty()) {
            return false;
        }
        User user = userOpt.get();
        // 現在是最簡單版：直接比對純文字密碼
        return user.getPassword().equals(password);
    }
}
