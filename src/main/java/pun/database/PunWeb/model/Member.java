package pun.database.PunWeb.model;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Integer memberId;

    private String username; // 帳號（前端輸入的帳號）

    private String password; // 密碼（先用純文字版）

    public Integer getMemberId() {return memberId;}

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
