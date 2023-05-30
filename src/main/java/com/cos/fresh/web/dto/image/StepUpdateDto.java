package com.cos.fresh.web.dto.image;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import com.cos.fresh.domain.image.Step;
import com.cos.fresh.domain.user.User;

import lombok.Data;

@Data
public class StepUpdateDto {
	
	private MultipartFile file2;	//이미지
	private MultipartFile file3;	//이미지
	private MultipartFile file4;	//이미지
	private MultipartFile file5;	//이미지
	private MultipartFile file6;	//이미지
	@NotBlank
	private String cation01; // 레시피 제목
	private String cation02; // 레시피 제목
	private String cation03; // 레시피 제목
	private String cation04; // 레시피 제목
	private String cation05; // 레시피 제목
	
	public Step toEntity(String postImageUrl01,String postImageUrl02,String postImageUrl03,
			String postImageUrl04,String postImageUrl05,User user) {
		return Step.builder()
				.cation01(cation01)
				.cation02(cation02)
				.cation03(cation03)
				.cation04(cation04)
				.cation05(cation05)
				.postImageUrl01(postImageUrl01)
				.postImageUrl02(postImageUrl02)
				.postImageUrl03(postImageUrl03)
				.postImageUrl04(postImageUrl04)
				.postImageUrl05(postImageUrl05)
				.build();
	}
}
