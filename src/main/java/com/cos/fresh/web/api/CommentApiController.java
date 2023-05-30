package com.cos.fresh.web.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.domain.comment.Comment;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.handler.ex.CustomValidationApiException;
import com.cos.fresh.service.CommentService;
import com.cos.fresh.web.dto.CMRespDto;
import com.cos.fresh.web.dto.comment.CommentDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class CommentApiController {

	private final CommentService commentService;
	
	@PostMapping("/api/comment")
	public ResponseEntity<?> commentSave(@Valid @RequestBody CommentDto commentDto, BindingResult bindingResult, @AuthenticationPrincipal PrincipalDetails principalDetails){
		Comment comment =  commentService.댓글쓰기(commentDto.getContent(), commentDto.getImageId(), principalDetails.getUser().getId()); // content, imageId, userId
		return new ResponseEntity<>(new CMRespDto<>(1, "댓글쓰기성공", comment), HttpStatus.CREATED);
	}
	
	@DeleteMapping("/api/comment/{id}")
	public ResponseEntity<?> commentDelete(@PathVariable int id){
		commentService.댓글삭제(id);
		return new ResponseEntity<>(new CMRespDto<>(1, "댓글삭제성공", null), HttpStatus.OK);
	}
	
	/*
	 * @GetMapping("/api/co/{imageId}") public ResponseEntity<?>
	 * comment(@PathVariable int imageId){ List<Comment> images =
	 * commentService.m코멘트(imageId); return new ResponseEntity<>(new CMRespDto<>(1,
	 * "성공", images), HttpStatus.OK); }
	 */
}
