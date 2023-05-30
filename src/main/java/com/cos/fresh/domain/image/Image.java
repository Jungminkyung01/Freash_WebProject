package com.cos.fresh.domain.image;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PrePersist;
import javax.persistence.Transient;

import com.cos.fresh.domain.comment.Comment;
import com.cos.fresh.domain.likes.Likes;
import com.cos.fresh.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Image { // N,   1
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String postImageUrl; // 사진을 전송받아서 그 사진을 서버에 특정 폴더에 저장 - DB에 그 저장된 경로를 insert
	private String title; // 레시피 제목
	private String subTitle; // 레시피 부제목
	@Column(length = 100, nullable = false)
	private String ingredient; //사용한 재료
	private String mainMenu; // 레시피 부제목
	private String person; //인원
	private String cookTime; // 시간
	private String difficult; // 난이도
	private String cookTip; // 요리 팁
	
	@JsonIgnoreProperties({"images"})
	@JoinColumn(name = "userId")
	@ManyToOne(fetch = FetchType.EAGER) // 이미지를 select하면 조인해서 User정보를 같이 들고옴
	private User user; // 1,  1
	
	// 나는 연관관계의 주인이 아니다. 그러므로 테이블에 칼럼을 만들지마.
		// User를 Select할 때 해당 User id로 등록된 image들을 다 가져와
		// Lazy = User를 Select할 때 해당 User id로 등록된 image들을 가져오지마 - 대신 getImages() 함수의 image들이 호출될 때 가져와!!
		// Eager = User를 Select할 때 해당 User id로 등록된 image들을 전부 Join해서 가져와!!
		@OneToMany(mappedBy = "image", fetch = FetchType.LAZY)
		@JsonIgnoreProperties({"image"})
		private List<Step> step; // 양방향 매핑
	
	// 이미지 좋아요
	@JsonIgnoreProperties({"image"})
	@OneToMany(mappedBy = "image") 
	private List<Likes> likes;
	
	// 댓글
	@OrderBy("id DESC")
	@JsonIgnoreProperties({"image"})
	@OneToMany(mappedBy = "image") 
	private List<Comment> comments;
	
	@Transient // DB에 칼럼이 만들어지지 않는다.
	private boolean likeState;
	
	@Transient
	private int likeCount;
	
	//항상 데이터베이스에는 시간이 필요하다.
	private LocalDateTime createDate;
	
	@PrePersist
	public void createDate() {
		this.createDate = LocalDateTime.now();
	}

}
