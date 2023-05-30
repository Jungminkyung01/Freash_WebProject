package com.cos.fresh.web.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.service.ImageService;
import com.cos.fresh.service.LikesService;
import com.cos.fresh.service.RecipeService;
import com.cos.fresh.service.StepService;
import com.cos.fresh.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class RecipeApiController {
	
	private final ImageService imageService;
	
	//레시피 삭제API
	@DeleteMapping("api/recipe1/delete/{id}")
	public ResponseEntity<?> deleteRecipe(@PathVariable int id){
		imageService.삭제하기(id);
		return new ResponseEntity<>(new CMRespDto<>(1, "삭제성공", null), HttpStatus.OK);
	}

}
