package pun.database.PunWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import pun.database.PunWeb.model.Member;
import pun.database.PunWeb.model.RegisterRequest;
import pun.database.PunWeb.model.LoginRequest;
import pun.database.PunWeb.service.MemberService;

import java.util.List;

@RestController
@RequestMapping("/members")
@CrossOrigin(origins = "http://localhost:3000")
public class MemberController {

    @Autowired
    private MemberService memberService;

    // ========= 註冊 API =========
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest req) {

        // 1. 檢查必填欄位
        if (req.getMemberName() == null || req.getMemberName().isEmpty()
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
        if (memberService.existsByMemberName(req.getMemberName())) {
            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body("此帳號已被使用");
        }

        // 4. 建立 Member 實體並存入資料庫
        Member member = new Member();
        member.setMemberName(req.getMemberName());
        member.setPassword(req.getPassword()); // 最簡單版，先不加密

        memberService.register(member);

        // 5. 回傳成功訊息
        return ResponseEntity.ok("註冊成功");
    }

    // ========= 登入 API =========
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest req) {

        // 1. 檢查必填欄位
        if (req.getMemberName() == null || req.getMemberName().isEmpty()
                || req.getPassword() == null || req.getPassword().isEmpty()) {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body("帳號或密碼不得為空");
        }

        // 2. 驗證帳號密碼
        boolean valid = memberService.validateMember(req.getMemberName(), req.getPassword());

        if (!valid) {
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .body("帳號或密碼錯誤");
        }

        // 3. 回傳最簡單的 JSON（只給 memberId）
        Member member = memberService
                .findByMemberName(req.getMemberName())
                .orElse(null);


        return ResponseEntity.ok(
                java.util.Map.of("memberId", member.getMemberId())
        );

    }

    // ========= 取得所有會員（測試用） =========
    @GetMapping
    public List<Member> getAllMembers() {
        return memberService.getAllMembers();
    }

}
