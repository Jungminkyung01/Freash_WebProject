package com.cos.fresh.web.dto.image;

import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TestUpdateDto {

	private String title; // 레시피 제목
	private String subTitle; // 레시피 부제목
	private String ingredient; //사용한 재료
	private String mainMenu; // 레시피 부제목
	private String person; //인원
	private String cookTime; // 시간
	private String difficult; // 난이도
	private String cookTip; // 요리 팁
	//private String username;	//유저아이디
	
	public Image toEntity() {
		return Image.builder()
				.title(title) // 이름을 기재 안했으면 문제!! Validation 체크
				.subTitle(subTitle)
				.ingredient(ingredient)
				.mainMenu(mainMenu)
				.person(person)
				.cookTime(cookTime)
				.difficult(difficult)
				.cookTip(cookTip)
				.build();
	}
}
