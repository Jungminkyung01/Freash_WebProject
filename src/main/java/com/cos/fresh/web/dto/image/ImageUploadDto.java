package com.cos.fresh.web.dto.image;

import org.springframework.web.multipart.MultipartFile;

import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.user.User;

import lombok.Data;

@Data
public class ImageUploadDto {
	
	private MultipartFile file;	//이미지
	private String title; // 레시피 제목
	private String subTitle; // 레시피 부제목
	private String ingredient; //사용한 재료
	private String mainMenu; // 레시피 부제목
	private String person; //인원
	private String cookTime; // 시간
	private String difficult; // 난이도
	private String cookTip; // 요리 팁
	
	public Image toEntity(String postImageUrl, User user) {
		return Image.builder()
				.title(title)
				.subTitle(subTitle)
				.ingredient(ingredient)
				.mainMenu(mainMenu)
				.person(person)
				.cookTime(cookTime)
				.difficult(difficult)
				.cookTip(cookTip)
				.postImageUrl(postImageUrl)
				.user(user)
				.build();
	}
}
