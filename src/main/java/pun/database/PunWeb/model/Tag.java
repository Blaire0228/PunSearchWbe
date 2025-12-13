package pun.database.PunWeb.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Table(name = "tag")
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer tagId;

    @Column(unique = true)
    private String tagName;

    // 多對多反向關聯，不會產生新表
    @ManyToMany(mappedBy = "tags")
    @JsonIgnore
    private List<Pun> puns = new ArrayList<>();

    public Tag() {}

    public Tag(String tagName) {
        this.tagName = tagName;
    }

    // Getter / Setter
    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public List<Pun> getPuns() {
        return puns;
    }

    public void setPuns(List<Pun> puns) {
        this.puns = puns;
    }
}
