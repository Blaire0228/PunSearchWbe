package pun.database.PunWeb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pun.database.PunWeb.model.Pun;
import pun.database.PunWeb.repository.PunRepository;

import java.util.List;
import java.util.Optional;

@Service
public class PunService {

    @Autowired
    private PunRepository punRepository;
    public List<Pun> getAllPuns() {
        return punRepository.findAll();
    }

    public Pun getPunById(Integer punId) {
        return punRepository.findById(punId).orElse(null);
    }

    public Pun createPun(Pun pun) {
        return punRepository.save(pun);
    }

    public Pun updatePun(Integer punId, Pun updatePun) {
        Optional<Pun> optionalPun = punRepository.findById(punId);
        if(optionalPun.isPresent()) {
            Pun pun = optionalPun.get();
            pun.setContent(updatePun.getContent());
            pun.setTags(updatePun.getTags());
            pun.setCreatedBy(updatePun.getCreatedBy());
            return punRepository.save(pun);
        }
        return null;
    }
    public void deletePun(Integer punId) {
        punRepository.deleteById(punId);
    }

    public List<Pun> getPunsByCreatedBy(Integer createdBy) {
        return punRepository.findByCreatedBy(createdBy);
    }

    public List<String> getAllDistinctTags() {
        return punRepository.findDistinctTags();
    }

    //本次專案主要搜尋判斷
    public List<Pun> search(List<Integer> tagIds, String keyword) {

        boolean noTags = (tagIds == null || tagIds.isEmpty());
        boolean noKeyword = (keyword == null || keyword.isBlank());

        if (noTags && noKeyword) //輸入為空值所以回傳所有諧音梗
            return punRepository.findAll();

        if (noTags) //無標籤，以關鍵字搜尋，回傳有該關鍵字的諧音梗
            return punRepository.findByContentContainingIgnoreCase(keyword);

        if (noKeyword) //無關鍵字，以標籤搜尋，回傳被選取標籤的諧音梗
            return punRepository.findByTagIds(tagIds);

        return punRepository.findByTagIdsAndKeyword(tagIds, keyword);//以標籤及關鍵字搜尋
    }
}
