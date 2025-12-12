package pun.database.PunWeb.repository; // 宣告這個介面所屬的 package

import org.springframework.data.jpa.repository.JpaRepository; // 引入 JpaRepository，讓我們可以直接用很多 CRUD 方法
import pun.database.PunWeb.model.User; // 引入剛剛建立的 User 實體類別
import java.util.Optional; // Optional 用來包裝可能為 null 的回傳值

public interface UserRepository extends JpaRepository<User, Integer> { // 介面繼承 JpaRepository，<實體類別, 主鍵型別>

    Optional<User> findByUsername(String username); // 根據 username 查詢使用者，可能查不到所以用 Optional 包起來

    boolean existsByUsername(String username); // 檢查某個 username 是否已經存在，回傳 true / false
} // 結束 UserRepository 介面
