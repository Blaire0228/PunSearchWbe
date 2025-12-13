package pun.database.PunWeb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pun.database.PunWeb.model.Pun;

import java.util.List;

public interface PunRepository extends JpaRepository<Pun, Integer> {
    //多標籤查詢
    @Query("SELECT DISTINCT p FROM Pun p JOIN p.tags t WHERE t.tagId IN :tagIds")
    List<Pun> findByTagIds(@Param("tagIds") List<Integer> tagIds);

    //多標籤+keyword查詢
    @Query("SELECT DISTINCT p FROM Pun p JOIN p.tags t " +
            "WHERE t.tagId IN :tagIds AND LOWER(p.content) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Pun> findByTagIdsAndKeyword(@Param("tagIds") List<Integer> tagIds,
                                     @Param("keyword") String keyword);

    //純文字搜尋
    List<Pun> findByContentContainingIgnoreCase(String keyword);

    // 根據創建者 ID 查找所有 Pun
    List<Pun> findByCreatedBy(Integer createdBy);

    // 查找所有不重複的 tags，並將結果以 List<String> 形式返回
    // TRIM(p.tags) 確保去除前後空格
    @Query("SELECT DISTINCT TRIM(p.tags) FROM Pun p")
    List<String> findDistinctTags();

}
