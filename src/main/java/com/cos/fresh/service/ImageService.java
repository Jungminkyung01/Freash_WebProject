package com.cos.fresh.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cos.fresh.config.auth.PrincipalDetails;
import com.cos.fresh.domain.image.Image;
import com.cos.fresh.domain.image.ImageRepository;
import com.cos.fresh.domain.user.User;
import com.cos.fresh.domain.user.UserRepository;
import com.cos.fresh.handler.ex.CustomApiException;
import com.cos.fresh.web.dto.image.ImageUpdateDto;
import com.cos.fresh.web.dto.image.ImageUploadDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ImageService {
	
	private final ImageRepository imageRepository;
	private final UserRepository userRepository;
	
	//채소
	@Transactional(readOnly = true)
	public List<Image> 메인스토리(int principalId){
		List<Image> images = imageRepository.mMainStory(principalId);

				// images에 좋아요 상태 담기
				images.forEach((image)->{
					
					image.setLikeCount(image.getLikes().size());
					
					image.getLikes().forEach((like) -> {
						if(like.getUser().getId() == principalId) { // 해당 이미지에 좋아요한 사람들을 찾아서 현재 로긴한 사람이 좋아요 한것인지 비교
							image.setLikeState(true);
						}
					});
					
				});
				
		return images;
	}
	
	//고기
	@Transactional(readOnly = true)
	public List<Image> 메인스토리_고기(int principalId){
		List<Image> images = imageRepository.mMainStory_Meat(principalId);
		
		// images에 좋아요 상태 담기
		images.forEach((image)->{
			
			image.setLikeCount(image.getLikes().size());
			
			image.getLikes().forEach((like) -> {
				if(like.getUser().getId() == principalId) { // 해당 이미지에 좋아요한 사람들을 찾아서 현재 로긴한 사람이 좋아요 한것인지 비교
					image.setLikeState(true);
				}
			});
			
		});
		
		return images;
	}
	
	//해산물
	@Transactional(readOnly = true)
	public List<Image> 메인스토리_해산물(int principalId){
		List<Image> images = imageRepository.mMainStory_Sea(principalId);
		
		// images에 좋아요 상태 담기
				images.forEach((image)->{
					
					image.setLikeCount(image.getLikes().size());
					
					image.getLikes().forEach((like) -> {
						if(like.getUser().getId() == principalId) { // 해당 이미지에 좋아요한 사람들을 찾아서 현재 로긴한 사람이 좋아요 한것인지 비교
							image.setLikeState(true);
						}
					});
					
				});
		
		return images;
	}
	
	//유제품
	@Transactional(readOnly = true)
	public List<Image> 메인스토리_유제품(int principalId){
		List<Image> images = imageRepository.mMainStory_Egg(principalId);
		
		// images에 좋아요 상태 담기
				images.forEach((image)->{
					
					image.setLikeCount(image.getLikes().size());
					
					image.getLikes().forEach((like) -> {
						if(like.getUser().getId() == principalId) { // 해당 이미지에 좋아요한 사람들을 찾아서 현재 로긴한 사람이 좋아요 한것인지 비교
							image.setLikeState(true);
						}
					});
					
				});
		
		return images;
	}
	
	//과일
	@Transactional(readOnly = true)
	public List<Image> 메인스토리_과일(int principalId){
		List<Image> images = imageRepository.mMainStory_Fruit(principalId);
		
		// images에 좋아요 상태 담기
		images.forEach((image)->{
			
			image.setLikeCount(image.getLikes().size());
			
			image.getLikes().forEach((like) -> {
				if(like.getUser().getId() == principalId) { // 해당 이미지에 좋아요한 사람들을 찾아서 현재 로긴한 사람이 좋아요 한것인지 비교
					image.setLikeState(true);
				}
			});
			
		});
		
		return images;
	}
	
	

	@Transactional(readOnly = true)
	public List<Image> 레시피1(int id){
		
		return imageRepository.mRecip1(id);
		//return imageRepository.mRecip1(id);
	}
	
	@Transactional(readOnly = true)
	public List<User> 인기쉐프(){
		
		return userRepository.mPopChef();
	}
	
	@Transactional(readOnly = true)
	public List<Image> 인기사진(){
		return imageRepository.mPopular();
	}
	
	@Transactional(readOnly = true)
	public List<Image> m게시물(int principalId){
		return imageRepository.mUpload_My(principalId);
	}
	
	@Transactional(readOnly = true)
	public List<Image> m하트(int principalId){
		return imageRepository.mHeart_My(principalId);
	}
	
	/*
	 * @Transactional(readOnly = true) public Image 레시피수정(int id, Image
	 * image,ImageUpdateDto imageUpdateDto){ UUID uuid = UUID.randomUUID(); // uuid
	 * String imageFileName =
	 * uuid+"_"+imageUpdateDto.getFile().getOriginalFilename(); // 1.jpg
	 * System.out.println("이미지 파일이름 : "+imageFileName);
	 * 
	 * Path imageFilePath = Paths.get(uploadFolder+imageFileName);
	 * 
	 * // 통신, I/O -> 예외가 발생할 수 있다. try { Files.write(imageFilePath,
	 * imageUpdateDto.getFile().getBytes()); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * //1.영속화 Image imageEntity = imageRepository.findById(id).get();
	 * 
	 * //2. 영속화된 오브젝트를 수정 - 더티체킹(업데이트 완료) imageEntity.setTitle(image.getTitle());
	 * imageEntity.setSubTitle(image.getSubTitle());
	 * imageEntity.setIngredient(image.getIngredient());
	 * imageEntity.setMainMenu(image.getIngredient());
	 * imageEntity.setPerson(image.getPerson());
	 * imageEntity.setCookTime(image.getCookTime());
	 * imageEntity.setDifficult(image.getDifficult());
	 * imageEntity.setDifficult(image.getCookTime()); //이미지
	 * imageEntity.setPostImageUrl(imageFileName);
	 * 
	 * return imageEntity; }
	 */
	
/*
	@Transactional(readOnly = true)
	public Image 레시피수정(int id, MultipartFile postImageUrl,Image image){
		UUID uuid = UUID.randomUUID(); // uuid
		String imageFileName = uuid+"_"+postImageUrl.getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName);
		
		Path imageFilePath = Paths.get(uploadFolder+imageFileName);
		
		// 통신, I/O -> 예외가 발생할 수 있다.
		try {
			Files.write(imageFilePath, postImageUrl.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//1.영속화
		Image imageEntity = imageRepository.findById(id).get();
		
		//2. 영속화된 오브젝트를 수정 - 더티체킹(업데이트 완료)
		imageEntity.setTitle(image.getTitle());
		imageEntity.setSubTitle(image.getSubTitle());
		imageEntity.setIngredient(image.getIngredient());
		imageEntity.setMainMenu(image.getIngredient());
		imageEntity.setPerson(image.getPerson());
		imageEntity.setCookTime(image.getCookTime());
		imageEntity.setDifficult(image.getDifficult());
		imageEntity.setDifficult(image.getCookTime());
		//이미지
		imageEntity.setPostImageUrl(imageFileName);
		
		return imageEntity;
	}
	*/
	
	//상세
	@Transactional(readOnly = true)
	public Image 레시피수정(int id){
		return imageRepository.findById(id)
				.orElseThrow();
	}
	
	//레시피수정하기
	@Transactional(readOnly = true)
	public void 레시피수정하기(int id, Image requestImage){
		Image image = imageRepository.findById(id)
				.orElseThrow();
		image.setTitle(requestImage.getTitle());
		image.setSubTitle(requestImage.getSubTitle());
		//해당함수 종료시 (Service)가 종료될 때 트랜잭션이 종료
	}
	/*
	public ImageUpdateDto update(ImageUpdateDto imageDTO) {
        BoardEntity boardEntity = BoardEntity.toUpdateEntity(imageDTO);
        imageRepository.save(boardEntity);
        return findById(imageDTO.getId());
    }
    */
	
	@Transactional(readOnly = true)
	public void 삭제하기(int id) {
		imageRepository.mRecipDelete(id);
	}
	
	@Transactional(readOnly = true) // 영속성 컨텍스트 변경 감지를 해서, 더티체킹, flush(반영) X
	public Page<Image> 이미지스토리(int principalId, Pageable pageable){
		Page<Image> images = imageRepository.mStory(principalId, pageable);
		
		// 2(cos) 로그인 
		// images에 좋아요 상태 담기
		images.forEach((image)->{
			
			image.setLikeCount(image.getLikes().size());
			
			image.getLikes().forEach((like) -> {
				if(like.getUser().getId() == principalId) { // 해당 이미지에 좋아요한 사람들을 찾아서 현재 로긴한 사람이 좋아요 한것인지 비교
					image.setLikeState(true);
				}
			});
			
		});
		
		return images;
	}
	
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Transactional
	public void 사진업로드(ImageUploadDto imageUploadDto, PrincipalDetails principalDetails) {
		UUID uuid = UUID.randomUUID(); // uuid
		String imageFileName = uuid+"_"+imageUploadDto.getFile().getOriginalFilename(); // 1.jpg
		System.out.println("이미지 파일이름 : "+imageFileName);
		
		Path imageFilePath = Paths.get(uploadFolder+imageFileName);
		
		// 통신, I/O -> 예외가 발생할 수 있다.
		try {
			Files.write(imageFilePath, imageUploadDto.getFile().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// image 테이블에 저장
		Image image = imageUploadDto.toEntity(imageFileName, principalDetails.getUser()); // 5cf6237d-c404-43e5-836b-e55413ed0e49_bag.jpeg
		imageRepository.save(image);
	}
	
	//updateTest
	@Transactional
	public Image 상세수정(int id, Image image) {
		//1. 영속화
		Image imageEntity = imageRepository.findById(id).get();
		
		//2. 영속화된 오브젝트를 수정
		imageEntity.setTitle(image.getTitle());
		imageEntity.setSubTitle(image.getSubTitle());
		imageEntity.setIngredient(image.getIngredient());
		imageEntity.setMainMenu(image.getMainMenu());
		imageEntity.setPerson(image.getPerson());
		imageEntity.setCookTime(image.getCookTime());
		imageEntity.setDifficult(image.getDifficult());
		imageEntity.setCookTip(image.getCookTip());
		
		return imageEntity;
	}
	
}


