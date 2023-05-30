package com.cos.fresh.web;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.Step;
import com.cos.fresh.service.ImageService;
import com.cos.fresh.service.UserService;
import com.cos.fresh.web.dto.user.UserProfileDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService userService;

	
	@GetMapping("/user/{pageUserId}")
	public String profile(@PathVariable int pageUserId, Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		UserProfileDto dto = userService.회원프로필(pageUserId, principalDetails.getUser().getId());

		model.addAttribute("dto", dto);
		return "user/profile";
	}
	
	//세션에 접근
	@GetMapping("/user/{id}/update")
	public String updateForm(@PathVariable int id, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		// 1. 추천
		//System.out.println("세션 정보 : "+principalDetails.getUser());
		
		// 2. 극혐
		//Authentication auth =   SecurityContextHolder.getContext().getAuthentication();
		//PrincipalDetails mPrincipalDetails = (PrincipalDetails) auth.getPrincipal();
		//System.out.println("직접 찾은 세션 정보 : "+mPrincipalDetails.getUser());
	
		return "user/update";
	}

}
