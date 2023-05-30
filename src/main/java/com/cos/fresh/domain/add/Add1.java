package com.cos.fresh.domain.add;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;

import com.cos.fresh.domain.comment.Comment;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.Step;
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
public class Add1 {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String title; // 레시피 제목
	@Column(length = 100, nullable = false)
	private String content1; // 레시피 부제목
	
	//등록한 시간
	private LocalDateTime createDate;
		
	@PrePersist
	public void createDate() {
		this.createDate = LocalDateTime.now();
	}

}
