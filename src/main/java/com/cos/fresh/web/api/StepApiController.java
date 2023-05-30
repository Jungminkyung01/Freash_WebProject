package com.cos.fresh.web.api;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.cos.fresh.domain.image.Step;
import com.cos.fresh.service.StepService;
import com.cos.fresh.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class StepApiController {

	private final StepService stepService;
	
	//@GetMapping("/api/step/{id}") 
	//public ResponseEntity<?> stepStory(@PathVariable int id){
	//	List<Step> images = stepService.레시피스탭(id);
	//	return new ResponseEntity<>(new CMRespDto<>(1, "성공", images), HttpStatus.OK);
	//}
}
