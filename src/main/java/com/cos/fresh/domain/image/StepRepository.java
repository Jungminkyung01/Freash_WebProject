package com.cos.fresh.domain.image;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface StepRepository extends JpaRepository<Step, Integer>{
	
	//레시피 상세
	//SELECT * FROM image, step WHERE image.id = step.id IN (SELECT id FROM image WHERE image.id=:imageId)
	@Query(value = "SELECT * FROM image, step WHERE image.id=:imageId AND step.id=:imageId", nativeQuery = true)
	List<Step> mResipe(@Param("imageId") int imageId);
	
	//레시피 상세 - 테스트
		@Query(value = "SELECT * FROM step i INNER JOIN (SELECT * FROM image WHERE id=:id GROUP BY id) c ON i.id = c.id", nativeQuery = true)
		List<Step> mResipe2(@Param("id") int id);
}
