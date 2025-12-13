package pun.database.PunWeb.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pun.database.PunWeb.model.*;
import pun.database.PunWeb.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;
import java.util.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:5173", allowCredentials = "true")
public class AuthController {

    private final MemberRepository memberRepository;

    public AuthController(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest req) {

        if (req.getMemberName() == null || req.getMemberName().isBlank()) {
            return ResponseEntity.badRequest().body("帳號不能是空白");
        }

        if (!req.getPassword().equals(req.getConfirmPassword())) {
            return ResponseEntity.badRequest().body("密碼與確認密碼不一致");
        }

        if (memberRepository.existsByMemberName(req.getMemberName())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("帳號已被使用");
        }

        Member newMember = new Member();
        newMember.setMemberName(req.getMemberName());
        newMember.setPassword(req.getPassword()); //（簡化：未加密）

        memberRepository.save(newMember);

        return ResponseEntity.ok("註冊成功");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest req, HttpSession session) {

        Optional<Member> memberOpt = memberRepository.findByMemberName(req.getMemberName());

        if (memberOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("帳號或密碼錯誤");
        }

        Member member = memberOpt.get();

        if (!member.getPassword().equals(req.getPassword())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("帳號或密碼錯誤");
        }

        session.setAttribute("MEMBER_ID", member.getMemberId());
        session.setAttribute("MEMBER_NAME", member.getMemberName());

        return ResponseEntity.ok("登入成功");
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(HttpSession session) {
        session.invalidate();
        return ResponseEntity.ok("已登出");
    }

    @GetMapping("/me")
    public ResponseEntity<?> me(HttpSession session) {

        Object mid = session.getAttribute("MEMBER_ID");

        if (mid == null) {
            return ResponseEntity.ok("未登入");
        }

        Map<String, Object> data = new HashMap<>();
        data.put("memberId", mid);
        data.put("memberName", session.getAttribute("MEMBER_NAME"));

        return ResponseEntity.ok(data);
    }
}
