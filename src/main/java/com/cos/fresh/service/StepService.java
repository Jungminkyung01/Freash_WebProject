package com.cos.fresh.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.Step;
import com.cos.fresh.domain.image.StepRepository;
import com.cos.fresh.web.dto.image.ImageUpdateDto;
import com.cos.fresh.web.dto.image.StepUpdateDto;
import com.cos.fresh.web.dto.image.StepUploadDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StepService {
	
	private final StepRepository stepRepository;
	
	//@Transactional(readOnly = true)
	//public List<Step> 레시피스탭(int id ){
	//	List<Step> images = stepRepository.mResipe(id);
	//	return images;
	//}
	
	@Transactional(readOnly = true)
		public List<Step> 레시피스탭(int id){
			List<Step> images = stepRepository.mResipe2(id);
			return images;
		}
	
	@Value("${file2.path}")
	private String uploadFolder2;
	
	@Value("${file3.path}")
	private String uploadFolder3;
	
	@Value("${file4.path}")
	private String uploadFolder4;
	
	@Value("${file5.path}")
	private String uploadFolder5;
	
	@Value("${file6.path}")
	private String uploadFolder6;
	
	@Transactional
	public void 사진업로드(StepUploadDto stepUploadDto, PrincipalDetails principalDetails) {
		UUID uuid = UUID.randomUUID(); // uuid
		//01
		String imageFileName1 = uuid+"_"+stepUploadDto.getFile2().getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName1);
		
		//02
		String imageFileName2 = uuid+"_"+stepUploadDto.getFile3().getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName2);
		
		//03
		String imageFileName3 = uuid+"_"+stepUploadDto.getFile4().getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName3);
		
		//04
		String imageFileName4 = uuid+"_"+stepUploadDto.getFile5().getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName4);
				
		//05
		String imageFileName5 = uuid+"_"+stepUploadDto.getFile6().getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName5);
		
		Path imageFilePath1 = Paths.get(uploadFolder2+imageFileName1);
		Path imageFilePath2 = Paths.get(uploadFolder3+imageFileName2);
		Path imageFilePath3 = Paths.get(uploadFolder4+imageFileName3);
		Path imageFilePath4 = Paths.get(uploadFolder5+imageFileName4);
		Path imageFilePath5 = Paths.get(uploadFolder6+imageFileName5);
		
		// 통신, I/O -> 예외가 발생할 수 있다.
		try {
			Files.write(imageFilePath1, stepUploadDto.getFile2().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			Files.write(imageFilePath2, stepUploadDto.getFile3().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			Files.write(imageFilePath3, stepUploadDto.getFile4().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			Files.write(imageFilePath4, stepUploadDto.getFile5().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			Files.write(imageFilePath5, stepUploadDto.getFile6().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// step 테이블에 저장
		Step step = stepUploadDto.toEntity(imageFileName1, imageFileName2, imageFileName3, imageFileName4, imageFileName5, principalDetails.getUser()); // 5cf6237d-c404-43e5-836b-e55413ed0e49_bag.jpeg
		stepRepository.save(step);
	}
	
	@Transactional(readOnly = true)
	public Step 레시피수정(int id, Step step,StepUpdateDto stepUpdateDto){
		UUID uuid = UUID.randomUUID(); // uuid
		String imageFileName1 = uuid+"_"+stepUpdateDto.getFile2().getOriginalFilename(); // 01
		System.out.println("이미지 파일이름 : "+imageFileName1);
		
		String imageFileName2 = uuid+"_"+stepUpdateDto.getFile3().getOriginalFilename(); // 02
		System.out.println("이미지 파일이름 : "+imageFileName2);

		String imageFileName3 = uuid+"_"+stepUpdateDto.getFile4().getOriginalFilename(); // 03
		System.out.println("이미지 파일이름 : "+imageFileName3);

		String imageFileName4 = uuid+"_"+stepUpdateDto.getFile5().getOriginalFilename(); // 04
		System.out.println("이미지 파일이름 : "+imageFileName4);

		String imageFileName5 = uuid+"_"+stepUpdateDto.getFile6().getOriginalFilename(); // 05
		System.out.println("이미지 파일이름 : "+imageFileName5);
		
		Path imageFilePath1 = Paths.get(uploadFolder2+imageFileName1);
		Path imageFilePath2 = Paths.get(uploadFolder3+imageFileName2);
		Path imageFilePath3 = Paths.get(uploadFolder4+imageFileName3);
		Path imageFilePath4 = Paths.get(uploadFolder5+imageFileName4);
		Path imageFilePath5 = Paths.get(uploadFolder6+imageFileName5);
		
		// 통신, I/O -> 예외가 발생할 수 있다.
		try {
			Files.write(imageFilePath1, stepUpdateDto.getFile2().getBytes());
			Files.write(imageFilePath2, stepUpdateDto.getFile3().getBytes());
			Files.write(imageFilePath3, stepUpdateDto.getFile3().getBytes());
			Files.write(imageFilePath4, stepUpdateDto.getFile3().getBytes());
			Files.write(imageFilePath5, stepUpdateDto.getFile3().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//1.영속화
		Step stepEntity = stepRepository.findById(id).get();
		
		//2. 영속화된 오브젝트를 수정 - 더티체킹(업데이트 완료)
		stepEntity.setCation01(step.getCation01());
		stepEntity.setCation02(step.getCation02());
		stepEntity.setCation03(step.getCation03());
		stepEntity.setCation04(step.getCation04());
		stepEntity.setCation05(step.getCation05());
		
		//이미지
		stepEntity.setPostImageUrl01(imageFileName1);
		stepEntity.setPostImageUrl02(imageFileName2);
		stepEntity.setPostImageUrl03(imageFileName3);
		stepEntity.setPostImageUrl04(imageFileName4);
		stepEntity.setPostImageUrl05(imageFileName5);
		
		return stepEntity;
	}
	
		//상세
		@Transactional(readOnly = true)
		public Step 레시피수정2(int id){
			return stepRepository.findById(id)
					.orElseThrow();
		}
		
		//레시피수정하기
		@Transactional(readOnly = true)
		public void 레시피수정하기(int id, Step requestStep){
			Step step = stepRepository.findById(id)
					.orElseThrow();
			step.setCation01(requestStep.getCation01());
			step.setCation02(requestStep.getCation02());
			step.setCation03(requestStep.getCation03());
			step.setCation04(requestStep.getCation04());
			step.setCation05(requestStep.getCation05());
			
			//해당함수 종료시 (Service)가 종료될 때 트랜잭션이 종료
		}
}
