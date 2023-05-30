package com.cos.fresh.domain.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

// 어노테이션이 없어도 JpaRepository를 상속하면 IoC 등록이 자동으로 된다.
public interface UserRepository extends JpaRepository<User, Integer>{
	// JPA query method
	User findByUsername(String username);
	
	//구독자 많은 user을 찾는다.
		@Query(value="SELECT i.* FROM user i INNER JOIN (SELECT toUserId, COUNT(toUserId) subCount FROM subscribe GROUP BY toUserId) c ON i.id = c.toUserId ORDER BY subCount DESC",nativeQuery = true)
		List<User> mPopChef();
		
	//userList를 보여준다.
	@Query(value="SELECT * FROM user order by id DESC",nativeQuery = true)
	List<User> mUserList();
}
