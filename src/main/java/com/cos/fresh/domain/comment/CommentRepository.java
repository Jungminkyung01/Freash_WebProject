package com.cos.fresh.domain.comment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CommentRepository extends JpaRepository<Comment, Integer>{
	
	//imageId=1의 댓글들을 보여줘라
	@Query(value = "SELECT * FROM comment WHERE imageId=:imageId", nativeQuery = true)
	List<Comment> mCo(@Param("imageId") int imageId);
}
