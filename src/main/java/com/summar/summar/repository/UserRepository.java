package com.summar.summar.repository;

import com.summar.summar.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {


    boolean existsByUserNickname(String nickname);

    /*boolean existsByUserEmail(String userId);*/


    Optional<User> findByUserEmail(String userEmail);

    boolean existsByUserEmail(String userEmail);
}
