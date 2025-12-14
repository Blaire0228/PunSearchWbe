package pun.database.PunWeb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pun.database.PunWeb.model.Member;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Integer> {

    Optional<Member> findByMemberName(String memberName);

    boolean existsByMemberName(String memberName);
}
