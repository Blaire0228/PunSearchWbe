package pun.database.PunWeb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pun.database.PunWeb.model.Pun;
import pun.database.PunWeb.service.PunService;
import java.util.List;

@RestController
@RequestMapping("/puns")
@CrossOrigin(origins = "http://localhost:3000")
public class PunController {

    @Autowired
    private PunService punService;

    @GetMapping
    public List<Pun> getAllPuns() {
        return punService.getAllPuns();
    }

    @GetMapping("/{punId}")
    public Pun getPunById(@PathVariable Integer punId) {
        return punService.getPunById(punId);
    }

    @GetMapping("/search")
    public List<Pun> search(
            @RequestParam(required = false) List<Integer> tags,
            @RequestParam(required = false) String keyword
    ) {
        return punService.search(tags, keyword);
    }

    @GetMapping("/member/{memberId}")
    public List<Pun> getPunsByMemberId(@PathVariable Integer memberId) {
        return punService.getPunsByCreatedBy(memberId);
    }

    @GetMapping("/tags")
    public List<String> getAllTags() {
        return punService.getAllDistinctTags();
    }

    @PostMapping
    public Pun createPun(@RequestBody Pun pun) {
        return punService.createPun(pun);
    }

    @PostMapping("/{punId}")
    public Pun updatePun(@PathVariable Integer punId, @RequestBody Pun pun) {
        return punService.updatePun(punId, pun);
    }

    @DeleteMapping("/{punId}")
    public void deletePun(@PathVariable Integer punId) {
        punService.deletePun(punId);
    }

}
