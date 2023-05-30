package com.cos.fresh.web.api;

import java.util.List;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.Step;
import com.cos.fresh.domain.user.User;
import com.cos.fresh.service.ImageService;
import com.cos.fresh.service.LikesService;
import com.cos.fresh.service.RecipeService;
import com.cos.fresh.service.StepService;
import com.cos.fresh.web.dto.CMRespDto;
import com.cos.fresh.web.dto.image.ImageUpdateDto;
import com.cos.fresh.web.dto.image.StepUpdateDto;
import com.cos.fresh.web.dto.image.TestUpdateDto;
import com.cos.fresh.web.dto.user.UserUpdateDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ImageApiController {
	
	private final ImageService imageService;
	private final LikesService likesService;
	private final RecipeService recipeService;
	private final StepService stepService;
	
	//main02_채소
	@GetMapping("/api/main")
	public ResponseEntity<?> mainStory(@AuthenticationPrincipal PrincipalDetails principalDetails){
		List<Image>images = imageService.메인스토리(principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
	}
	
	@PostMapping("/api/main/{imageId}/likes")
	public ResponseEntity<?> likes_V(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요(imageId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
	}
	
	@DeleteMapping("/api/main/{imageId}/likes")
	public ResponseEntity<?> unLikes_V(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요취소(imageId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소성공", null), HttpStatus.OK);
	}
	
	//main01_고기
	@GetMapping("/api/main01_M")
	public ResponseEntity<?> mainStory01(@AuthenticationPrincipal PrincipalDetails principalDetails){
		List<Image>images = imageService.메인스토리_고기(principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
	}
	
	@PostMapping("/api/main01_M/{imageId}/likes")
	public ResponseEntity<?> likes_M(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요(imageId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
	}
	
	@DeleteMapping("/api/main01_M/{imageId}/likes")
	public ResponseEntity<?> unLikes_M(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요취소(imageId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소성공", null), HttpStatus.OK);
	}
	
	//main03_해산물
		@GetMapping("/api/main03_S")
		public ResponseEntity<?> mainStory03(@AuthenticationPrincipal PrincipalDetails principalDetails){
			List<Image>images = imageService.메인스토리_해산물(principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
		}
		
		@PostMapping("/api/main03_S/{imageId}/likes")
		public ResponseEntity<?> likes_S(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
			likesService.좋아요(imageId, principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
		}
		
		@DeleteMapping("/api/main03_S/{imageId}/likes")
		public ResponseEntity<?> unLikes_S(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
			likesService.좋아요취소(imageId, principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소성공", null), HttpStatus.OK);
		}
		
		//main04_유제품
		@GetMapping("/api/main04_P")
		public ResponseEntity<?> mainStory04(@AuthenticationPrincipal PrincipalDetails principalDetails){
			List<Image>images = imageService.메인스토리_유제품(principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
		}
		
		@PostMapping("/api/main04_P/{imageId}/likes")
		public ResponseEntity<?> likes_E(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
			likesService.좋아요(imageId, principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
		}
		
		@DeleteMapping("/api/main04_P/{imageId}/likes")
		public ResponseEntity<?> unLikes_E(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
			likesService.좋아요취소(imageId, principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소성공", null), HttpStatus.OK);
		}
		
		//main05_과일
		@GetMapping("/api/main05_F")
		public ResponseEntity<?> mainStory05(@AuthenticationPrincipal PrincipalDetails principalDetails){
			List<Image>images = imageService.메인스토리_과일(principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
		}
		
		@PostMapping("/api/main05_F/{imageId}/likes")
		public ResponseEntity<?> likes_F(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
			likesService.좋아요(imageId, principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
		}
		
		@DeleteMapping("/api/main05_F/{imageId}/likes")
		public ResponseEntity<?> unLikes_F(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
			likesService.좋아요취소(imageId, principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소성공", null), HttpStatus.OK);
		}
		
		@GetMapping("/api/recipe1")
		public ResponseEntity<?> recipe1(@PathVariable int id){
			List<Image>images = imageService.레시피1(id);
			return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
		}
		
		//레시피 수정
		/*
		@PutMapping("/api/recipe1/{id}")
		public CMRespDto<?> recipeUpdate(
				@PathVariable int id,
				@Valid ImageUpdateDto imageUpdateDto,
				@AuthenticationPrincipal Image image
				//@Valid StepUpdateDto stepUpdateDto
				){
				Image imageEntity = imageService.레시피수정(id,imageUpdateDto.toEntity(null));

				//Step stepEntity = stepService.레시피수정(id, stepUpdateDto.toEntity(null, null,null, null, null, null),stepUpdateDto);
				return new CMRespDto<>(1, "레시피수정완료", imageEntity); // 응답시에 userEntity의 모든 getter 함수가 호출되고 JSON으로 파싱하여 응답한다.
		}
		*/
		/*
		 * //레시피 API에서
		 * 
		 * @PostMapping("/api/recipe1/{imageId}/recipe") public ResponseEntity<?>
		 * recipeDelete(@PathVariable int imageId, @AuthenticationPrincipal
		 * PrincipalDetails principalDetails){ imageService.레시피삭제(imageId,
		 * principalDetails.getUser().getId()); return new ResponseEntity<>(new
		 * CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED); }
		 */
		
		@DeleteMapping("/api/recipe/{id}/delete")
		public ResponseEntity<?> recipeDelete(@PathVariable int id){
			recipeService.레시피삭제(id);
			return new ResponseEntity<>(new CMRespDto<>(1, "댓글삭제성공", null), HttpStatus.OK);
		}
		
		//레시피 수정(최종?)
		@PutMapping("/api/update2/{id}")
		public ResponseEntity<?> update2(@PathVariable int id, @RequestBody Image image, @RequestBody Step step){
			imageService.레시피수정하기(id,image);
			stepService.레시피수정하기(id,step);
			return new ResponseEntity<>(new CMRespDto<>(1, "수정성공", null), HttpStatus.OK);
		}
		
		
		@GetMapping("/api/index1")
		public ResponseEntity<?> index1(@AuthenticationPrincipal PrincipalDetails principalDetails){
			List<Image>images = imageService.메인스토리_고기(principalDetails.getUser().getId());
			return new ResponseEntity<>(new CMRespDto<>(1, "성공", images),HttpStatus.OK);
		}
		
	@GetMapping("/api/image")
	public ResponseEntity<?> imageStory(@AuthenticationPrincipal PrincipalDetails principalDetails, 
			@PageableDefault(size=20) Pageable pageable){
		Page<Image> images =  imageService.이미지스토리(principalDetails.getUser().getId(), pageable);
		return new ResponseEntity<>(new CMRespDto<>(1, "성공", images), HttpStatus.OK);
	}
	
	@PostMapping("/api/image/{imageId}/likes")
	public ResponseEntity<?> likes(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요(imageId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요성공", null), HttpStatus.CREATED);
	}
	
	@DeleteMapping("/api/image/{imageId}/likes")
	public ResponseEntity<?> unLikes(@PathVariable int imageId, @AuthenticationPrincipal PrincipalDetails principalDetails){
		likesService.좋아요취소(imageId, principalDetails.getUser().getId());
		return new ResponseEntity<>(new CMRespDto<>(1, "좋아요취소성공", null), HttpStatus.OK);
	}
	
	//updateTest
	@PutMapping("/api/update/{id}")
	public CMRespDto<?> upTest(@PathVariable int id, TestUpdateDto testUpdateDto) {
		Image imageEntity = imageService.상세수정(id, testUpdateDto.toEntity());
		//System.out.println(testUpdateDto);
		return new CMRespDto<>(1, "회원수정완료", imageEntity); 
	}
	
}
