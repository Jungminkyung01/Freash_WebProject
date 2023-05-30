package com.cos.fresh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.fresh.domain.add.Add1;
import com.cos.fresh.domain.add.Add1Repository;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.ImageRepository;
import com.cos.fresh.domain.user.User;
import com.cos.fresh.domain.user.UserRepository;
import com.cos.fresh.web.dto.user.UserProfileDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service // 1. IoC  2. 트랜잭션 관리
public class AdminService {
	
	private final UserRepository userRepository;
	@Autowired
	private Add1Repository add1Repository;
	@Autowired
	private ImageRepository imageRepository;
	
	//작성
	@Transactional(readOnly = true)
	public void 글쓰기(Add1 add1) {
		add1Repository.save(add1);
	}
	
	//리스트
	@Transactional(readOnly = true)
	public List<Add1> addList(){
		return add1Repository.findAll();
	}
	
	//특정페이지 불러오기
	@Transactional(readOnly = true)
	public Add1 addView(int id) {
		return add1Repository.findById(id).get();
	}
	
	//특정페이지 삭제
	@Transactional(readOnly = true)
	public void deleteView(int id) {
		add1Repository.deleteById(id);
	}
	

	
	//레시피 리스트
	@Transactional(readOnly = true)
	public List<Image> imageList(){
		return imageRepository.findAll();
	}
	
	//회원정보 리스트
	@Transactional(readOnly = true)
	public List<User> 회원리스트(){
		
		return userRepository.mUserList();
	}
	
	

}
