package com.cos.fresh.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.domain.add.Add1;
import com.cos.fresh.domain.comment.Comment;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.ImageRepository;
import com.cos.fresh.domain.image.Step;
import com.cos.fresh.domain.user.User;
import com.cos.fresh.handler.ex.CustomValidationException;
//import com.cos.fresh.service.CommentService;
import com.cos.fresh.service.ImageService;
import com.cos.fresh.service.StepService;
import com.cos.fresh.web.dto.image.ImageUpdateDto;
import com.cos.fresh.web.dto.image.ImageUploadDto;
import com.cos.fresh.web.dto.image.StepUploadDto;
import com.cos.fresh.web.dto.user.UserProfileDto;
import com.cos.fresh.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ImageController {
	
	private final ImageService imageService;
	private final StepService stepService;
	//private final CommentService commentService;
	@Autowired
	private final ImageRepository imageRepository;
	
	@GetMapping({"/","/dist/index"})
	public String index(Model model) {
		
		model.addAttribute("images",null);
		return "dist/index";
	}
	
	//Main Start
	@GetMapping("/main/main01_M")
	public String main01_M(Model model ) {
		//이미지를 출력해 주기위해 model을 이용하여 이미지값을 들고 온다.
		model.addAttribute("images",null);
		return "main/main01_M";
	}
	
	@GetMapping("/main/main02_V")
	public String main02_V(Model model ) {
		model.addAttribute("images",null);
		return "main/main02_V";
	}
	
	@GetMapping("/main/main03_S")
	public String main03_S(Model model ) {
		model.addAttribute("images",null);
		return "main/main03_S";
	}
	
	@GetMapping("/main/main04_P")
	public String main04_P(Model model ) {
		model.addAttribute("images",null);
		return "main/main04_P";
	}
	
	@GetMapping("/main/main05_F")
	public String main05_F(Model model ) {
		model.addAttribute("images",null);
		return "main/main05_F";
	}
	//Main End
		
	//@RequestMapping
	@GetMapping("/image/recipe/{id}")
	public String recipe(Model model,@PathVariable int id) {
		List<Step> recipe = stepService.레시피스탭(id);
		List<Image> recipe1 = imageService.레시피1(id);
		//List<Comment> mcomment = commentService.m코멘트(id);
		model.addAttribute("recipe", recipe);
		model.addAttribute("recipe1", recipe1);
		//model.addAttribute("mcomment", mcomment);
		return "image/recipe";
	}
	
	//인기 쉐프 - 구독자 많은 순으로
	@GetMapping("/image/chef")
	public String chef(Model model ) {
		//api는 데이터를 리턴하는 서버
		List<User> images = imageService.인기쉐프();
		model.addAttribute("images",images);
		return "image/chef";
	}
	
	@GetMapping("/image/story")
	public String story() {
		return "image/story";
	}
	
	// API 구현한다면 - 이유 - (브라우저에서 요청하는게 아니라, 안드로이드,iOS 요청)
	@GetMapping("/image/popular")
	public String popular(Model model) {
		// api는 데이터를 리턴하는 서버!!
		List<Image> images = imageService.인기사진();
		model.addAttribute("images", images);
		
		return "image/popular";
	}
	
	//내가 등록한 레시피
	@GetMapping("/user/myRecipe/{principalId}")
	public String myRecipe(Model model,@PathVariable int principalId) {
		List<Image> mrecipe = imageService.m게시물(principalId);
		model.addAttribute("images", mrecipe);
		
		return "user/myRecipe";
	}
	
	//내가 등록한 레시피에서 수정과 삭제를 진행한다. 
	//레시피 삭제
	@GetMapping("user/myRecipe/{principalId}/{id}")
	public String deletemRecipe(@PathVariable int id,@PathVariable int principalId) {
		imageRepository.deleteById(id);
		
		//return "삭제되었습니다.id"+id;
		return "redirect:/user/myRecipe/{principalId}";
	}
	
	/*
	@GetMapping("/image/{id}/update")
	public String RecipeUpdate(@PathVariable("id") int id, @AuthenticationPrincipal PrincipalDetails principalDetails,Model model) {
		
		// 1. 추천
		System.out.println("세션 정보 : "+principalDetails.getUser());
		List<Image> mrecipe = imageService.m게시물(id);
		model.addAttribute("images", mrecipe);
		
		// 2. 극혐
		//Authentication auth =   SecurityContextHolder.getContext().getAuthentication();
		//PrincipalDetails mPrincipalDetails = (PrincipalDetails) auth.getPrincipal();
		//System.out.println("직접 찾은 세션 정보 : "+mPrincipalDetails.getUser());
	
		return "image/update";
	}
	*/
	
	//글수정하기
	@GetMapping("/image/{id}/upDate2")
	public String update2Form(@PathVariable int id, Model model) {
		model.addAttribute("image",imageService.레시피수정(id));
		model.addAttribute("image1",stepService.레시피수정2(id));
		return "image/update";
	}

		//수정 받아오기
		@PostMapping("/image/update2/{id}")
		public String addUpdate(@PathVariable int id, Image image) {
			
			Image imageTemp = imageService.레시피수정(id);
			imageTemp.setTitle(image.getTitle());
			imageTemp.setSubTitle(image.getSubTitle());
			imageTemp.setDifficult(image.getDifficult());
			imageTemp.setCookTime(image.getCookTime());
			imageTemp.setCookTip(image.getCookTip());
			
			//imageService.레시피1(imageTemp);
			
			return "redirect:/user/addlist";
		}
	
	/*
	@PostMapping("/image/update")
	public String update(@ModelAttribute ImageUpdateDto imageUpdateDto,Model model) {
		ImageUpdateDto imageUp = imageService.update(imageUpdateDto);
		model.addAttribute("imageUp",imageUp);
		return "image/recipe";
	}
	*/
	
	@GetMapping("/image/upload")
	public String upload() {
		return "image/upload";
	}
	
	@PostMapping("/image")
	public String imageUpload(ImageUploadDto imageUploadDto,StepUploadDto stepUploadDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {

		// 깍둑이
		if(imageUploadDto.getFile().isEmpty()) {
			throw new CustomValidationException("이미지가 첨부되지 않았습니다.", null);
		}
		
		if(stepUploadDto.getFile2().isEmpty()) {
			throw new CustomValidationException("이미지가 첨부되지 않았습니다.", null);
		}
		
		imageService.사진업로드(imageUploadDto, principalDetails);
		stepService.사진업로드(stepUploadDto, principalDetails);
		return "redirect:/user/"+principalDetails.getUser().getId();
	}
	
	//uptest 수정페이지로 이동
	/*
	@RequestMapping(value="/image/upTest", method = RequestMethod.GET)
	public String getupTest(int id, Model model) throws Exception {
		ImageVO data = imageService.detail(id);
		model.addAttribute("data",data);
		return "image/upTest";
	}
	*/
	
	/*
	@GetMapping("/image/{id}/update")
	public String profileSetting(@PathVariable int id) {
		return "image/upTest";
	}

	
	  @PutMapping("/image/{id}") public @ResponseBody CMRespDto<?>
	  profileUpdate(@PathVariable int id, Image image,
	  
	  @AuthenticationPrincipal PrincipalDetails principalDetails) {
		  Image imageEntity = imageService.상세수정(id, image); 
		 // principalDetails.setUser(userEntity); 
		  return new CMRespDto<>(1, "회원수정완료", imageEntity); 
	  }
	 */
	
}




