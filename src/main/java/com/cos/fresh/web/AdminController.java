package com.cos.fresh.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cos.fresh.domain.add.Add1;
import com.cos.fresh.domain.add.Add1Repository;
import com.cos.fresh.domain.image.ImageRepository;
import com.cos.fresh.domain.user.User;
import com.cos.fresh.domain.user.UserRepository;
import com.cos.fresh.service.AdminService;
import com.cos.fresh.service.AuthService;
import com.cos.fresh.service.ImageService;
import com.cos.fresh.web.dto.user.UserProfileDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor // final 필드를 DI 할때 사용
@Controller
public class AdminController {
	
	@Autowired
	private final AdminService adminService;
	
	@Autowired
	private final UserRepository userRepository;
	
	@Autowired
	private final Add1Repository add1Repository;
	
	@Autowired
	private final ImageRepository imageRepository;
	
	@RequestMapping("/user/admin" )
	public String admin(Model model) {
		model.addAttribute("userInfo", adminService.회원리스트());
		return "user/admin";
	}
	
	//공지사항
	@GetMapping("/user/add")
		public String addForm() {
		
		return "user/add";
	}
	
	//공지사항_글쓰기
	@PostMapping("/user/writedo")
	public String writeDo(Add1 add1) {
		
		adminService.글쓰기(add1);
		
		//System.out.println(add1.getTitle());
		//System.out.println("제목: " + title);
		//System.out.println("내용: " + content1);
		
		return "redirect:/user/addlist";
	}
	
	//공지사항_리스트
	@GetMapping("/user/addlist")
	public String addList(Model model) {
		model.addAttribute("list",adminService.addList());
		return "user/addlist";
	}
	
	//공지사항_뷰
	@GetMapping("/user/addView")
	public String addView(Model model, int id) {
		model.addAttribute("add1",adminService.addView(id));
		return "user/addView";
	}
	
	//공지사항_삭제
	/*
	@GetMapping("/user/delete")
	public String deleteView(int id) {
		adminService.deleteView(id);
		return "redirect:/user/addlist";
	}
	*/
	@GetMapping("/user/admin/{id}")
	public String deleteView(@PathVariable int id) {
		try {
			add1Repository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			return "삭제에 실패하였습니다. 해당Id는 DB에 없습니다.";
		}

		return "redirect:/user/addlist";
	}
	
	/*
	@RequestMapping(value = "/user/admin/{id}", method = RequestMethod.GET) // POST, DELETE, PUT, PATCH 사용 가능
	public void TestCase(@PathVariable int id) {
	   // do something
	} 
	
	@DeleteMapping("/user/delete/{id}")
	void deleteView(@PathVariable int id) {
		adminService.deleteView(id);
	}
	*/
	/*
	@GetMapping("/user/admin/{id}")
	public String View(@PathVariable int id) {
		adminService.addList();
		return "redirect:/user/addlist";
	}
	*/
	//공지사항_수정
	@GetMapping("/user/admin/{id}/modify")
	public String addModify(@PathVariable int id,
										Model model) {
		model.addAttribute("add1",adminService.addView(id));
		return "user/modify";
	}
	
	@PostMapping("/user/update2/{id}")
	public String addUpdate(@PathVariable int id, Add1 add1) {
		
		Add1 add1Temp = adminService.addView(id);
		add1Temp.setTitle(add1.getTitle());
		add1Temp.setContent1(add1.getContent1());
		
		adminService.글쓰기(add1Temp);
		
		return "redirect:/user/addlist";
	}
	
	//회원 리스트
	@GetMapping("/user/admin_userList")
	public String userList(Model model) {
		System.out.println("/admin_userList 요청");
		List<User> userList = adminService.회원리스트();
		model.addAttribute("userInfo", userList);
		return "user/admin_userList";
	}
	
	//회원삭제
	
	@GetMapping("user/admin_userList/{id}")
	public String deleteUser(@PathVariable int id) {
		userRepository.deleteById(id);
		
		//return "삭제되었습니다.id"+id;
		return "redirect:/user/admin_userList";
	}
	
	
	//레시피 리스트
	@GetMapping("/user/recipeList")
	public String recipeList(Model model) {
		model.addAttribute("recipeList", adminService.imageList());
		return "user/recipeList";
	}
	
	//레시피 삭제
	@GetMapping("user/recipeList/{id}")
	public String deleteRecipe(@PathVariable int id) {
		imageRepository.deleteById(id);
		
		//return "삭제되었습니다.id"+id;
		return "redirect:/user/recipeList";
	}

}
