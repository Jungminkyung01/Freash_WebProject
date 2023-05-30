package com.cos.fresh.domain.image;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

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
public class Step { // N,   1
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String postImageUrl01; // 사진을 전송받아서 그 사진을 서버에 특정 폴더에 저장 - DB에 그 저장된 경로를 insert
	private String cation01; // 레시피 설명
	private String postImageUrl02;
	private String cation02;
	private String postImageUrl03;
	private String cation03;
	private String postImageUrl04;
	private String cation04;
	private String postImageUrl05;
	private String cation05;
	
	//@JsonIgnoreProperties({"images"})
	//@JoinColumn(name = "userId")
	//@ManyToOne(fetch = FetchType.EAGER) // 이미지를 select하면 조인해서 User정보를 같이 들고옴
	//private User user; // 1,  1
	

	@JoinColumn(name = "imageId")
	@ManyToOne(fetch = FetchType.EAGER) // 이미지를 select하면 조인해서 User정보를 같이 들고옴
	private Image image; // 1,  1
	
	//항상 데이터베이스에는 시간이 필요하다.
	private LocalDateTime createDate;
	
	@PrePersist
	public void createDate() {
		this.createDate = LocalDateTime.now();
	}

}
