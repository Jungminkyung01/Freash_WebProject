package com.cos.fresh.domain.image;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ImageRepository extends JpaRepository<Image, Integer> {

	//SELECT * FROM image WHERE userId IN (SELECT toUserId FROM subscribe WHERE fromUserId = :principalId) ORDER BY id DESC
	//Test
	@Query(value = "SELECT * FROM image WHERE image.id=:imageId AND userId IN (SELECT toUserId FROM subscribe WHERE fromUserId) ORDER BY id DESC", nativeQuery = true)
	List<Image> mTest(@Param("imageId") int imageId);
	
	@Query(value = "SELECT * FROM image WHERE userId IN (SELECT toUserId FROM subscribe WHERE fromUserId = :principalId) ORDER BY id DESC", nativeQuery = true)
	Page<Image> mStory(@Param("principalId") int principalId, Pageable pageable);

	@Query(value = "SELECT i.* FROM image i INNER JOIN (SELECT imageId, COUNT(imageId) likeCount FROM likes GROUP BY imageId) c ON i.id = c.imageId ORDER BY likeCount DESC", nativeQuery = true)
	List<Image> mPopular();
	
	//SELECT * FROM image WHERE id=1;
	@Query(value = "SELECT * FROM image WHERE id=:id", nativeQuery = true)
	List<Image> mRecip1(@Param("id") int id);
	
	//Main고기 
	@Query(value = "SELECT * FROM image WHERE mainMenu='고기'ORDER BY id DESC", nativeQuery = true)
	List<Image> mMainStory_Meat(@Param("principalId") int principalId);
	
	//Main 채소
	//SELECT * FROM image WHERE mainMenu='채소류' ORDER BY id DESC
	@Query(value = "SELECT * FROM image WHERE mainMenu='채소류' ORDER BY id DESC", nativeQuery = true)
	List<Image> mMainStory(@Param("principalId") int principalId);
	
	//Main해산물 
	@Query(value = "SELECT * FROM image WHERE mainMenu='해산물'ORDER BY id DESC", nativeQuery = true)
	List<Image> mMainStory_Sea(@Param("principalId") int principalId);
	
	//Main유제품
	@Query(value = "SELECT * FROM image WHERE mainMenu='유제품/계란'ORDER BY id DESC", nativeQuery = true)
	List<Image> mMainStory_Egg(@Param("principalId") int principalId);
	
	//Main과일
	@Query(value = "SELECT * FROM image WHERE mainMenu='과일'ORDER BY id DESC", nativeQuery = true)
	List<Image> mMainStory_Fruit(@Param("principalId") int principalId);
	
	//내가 업로드한 게시물
	@Query(value = "SELECT * FROM image WHERE userId IN (SELECT id FROM user WHERE id=:principalId)ORDER BY id DESC", nativeQuery = true)
	List<Image> mUpload_My(@Param("principalId") int principalId);
	
	//찜하기 누른 게시물
	@Query(value = "SELECT * FROM image WHERE userId IN (SELECT imageId FROM likes WHERE userId =:principalId) ORDER BY id DESC", nativeQuery = true)
	List<Image> mHeart_My(@Param("principalId") int principalId);
	
	
	//레시피 삭제하기
	@Modifying
	@Query(value = "DELETE FROM image WHERE id=:id", nativeQuery = true)
	void mRecipDelete(@Param("id") int id);
	
	//레시피 수정
	//UPDATE image SET title='안녕',subTitle='안녕',ingredient='안녕',mainMenu='안녕',person='안녕',cookTime='안녕',difficult='안녕',cookTip='안녕' WHERE id=29;


}
