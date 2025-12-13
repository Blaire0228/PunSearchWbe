package pun.database.PunWeb.service;

import org.springframework.stereotype.Service;
import pun.database.PunWeb.model.Member;
import pun.database.PunWeb.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private MemberRepository memberRepository;

    // 註冊：存進資料庫
    public Member register(Member member) {
        return memberRepository.save(member);
    }

    // 用 username 找使用者
    public Optional<Member> findByUsername(String username) {
        return memberRepository.findByUsername(username);
    }

    // 查全部使用者
    public List<Member> getAllUsers() {
        return memberRepository.findAll();
    }

    // 新增：檢查帳號是否存在(註冊用)
    public boolean existsByUsername(String username) {
        return memberRepository.existsByUsername(username);
    }

    // 登入用，驗證帳號密碼是否正確
    public boolean validateUser(String username, String password) {
        Optional<Member> userOpt = memberRepository.findByUsername(username);
        if (userOpt.isEmpty()) {
            return false;
        }
        Member member = userOpt.get();
        // 現在是最簡單版：直接比對純文字密碼
        return member.getPassword().equals(password);
    }
}
