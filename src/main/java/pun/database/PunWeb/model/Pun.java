package pun.database.PunWeb.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import jakarta.persistence.Transient;
import java.util.ArrayList;
import java.util.List;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Table(name = "pun")
public class Pun {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pun_id")
    private Integer punId;

    private String content;

    @Column(name = "created_by")
    private Integer createdBy;

    // 這就是正規化的關鍵，它會建立關聯表
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "pun_tag",
            joinColumns = @JoinColumn(name = "pun_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id")
    )
    private List<Tag> tags = new ArrayList<>();

    @CreationTimestamp
    @Column(name = "create_date", nullable = false, updatable = false)
    private LocalDate createDate;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "image_url", columnDefinition = "TEXT")
    private String imageUrl;

    // 無參數建構子 (JPA 必要)
    public Pun() {}

    // 建構子 (tags 傳入 List 而不是 String)
    public Pun(String content, Integer createdBy, List<Tag> tags) {
        this.content = content;
        this.createdBy = createdBy;
        this.tags = tags;
    }

    // --- Getter & Setter ---
    public Integer getPunId() { return punId; }
    public void setPunId(Integer punId) { this.punId = punId; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Integer getCreatedBy() { return createdBy; }
    public void setCreatedBy(Integer createdBy) { this.createdBy = createdBy; }

    // 重點：這裡是 List<Tag>，不是 String
    public List<Tag> getTags() { return tags; }
    public void setTags(List<Tag> tags) { this.tags = tags; }

    public LocalDate getCreateDate() { return createDate; }
    public void setCreateDate(LocalDate createDate) { this.createDate = createDate; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    @Transient
    public String getStatus() {

        long days = createDate.until(LocalDate.now(), ChronoUnit.DAYS);

        if (days <= 10) return "最新諧音梗";
        if (days <= 30) return "新諧音梗";
        if (days <= 90) return "近期諧音梗";
        if (days <= 365) return "中期諧音梗";
        return "舊諧音梗";
    }
}