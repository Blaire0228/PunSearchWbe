package pun.database.PunWeb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pun.database.PunWeb.model.Pun;

import java.util.List;

public interface PunRepository extends JpaRepository<Pun, Integer> {
    //無關鍵字，以標籤搜尋，回傳被選取標籤的諧音梗
    @Query("SELECT DISTINCT p FROM Pun p JOIN p.tags t WHERE t.tagId IN :tagIds")
    List<Pun> findByTagIds(@Param("tagIds") List<Integer> tagIds);

    //以標籤及關鍵字搜尋
    @Query("SELECT DISTINCT p FROM Pun p JOIN p.tags t " +
            "WHERE t.tagId IN :tagIds AND LOWER(p.content) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Pun> findByTagIdsAndKeyword(@Param("tagIds") List<Integer> tagIds,
                                     @Param("keyword") String keyword);

    //無標籤，以關鍵字搜尋，回傳有該關鍵字的諧音梗
    List<Pun> findByContentContainingIgnoreCase(String keyword);

    // 根據創建者的會員ID查所有諧音梗
    List<Pun> findByCreatedBy(Integer createdBy);

    // 查找所有不重複的標籤，並回傳所有的標籤
    @Query("SELECT DISTINCT TRIM(p.tags) FROM Pun p")
    List<String> findDistinctTags();

}
