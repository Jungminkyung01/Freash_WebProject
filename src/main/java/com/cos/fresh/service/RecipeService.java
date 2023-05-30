package com.cos.fresh.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.fresh.domain.comment.Comment;
import com.cos.fresh.domain.comment.CommentRepository;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.ImageRepository;
import com.cos.fresh.domain.user.User;
import com.cos.fresh.domain.user.UserRepository;
import com.cos.fresh.handler.ex.CustomApiException;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RecipeService {

	//이미지 저장소에서 삭제
	private final ImageRepository imageRepository;
	
	@Transactional
	public void 레시피삭제(int id) {
		try {
			imageRepository.deleteById(id);
		} catch (Exception e) {
			throw new CustomApiException(e.getMessage());
		}
	}
	
	
	
}
