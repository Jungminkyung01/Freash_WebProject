<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/header.jsp"%>

<link rel="stylesheet" href="/css/upload.css">

<!--사진 업로드페이지 중앙배치-->
<main class="uploadContainer">
	<!--사진업로드 박스-->
	<section class="upload">

		<!--사진업로드 로고-->
		<div class="upload-top">
			<a href="home.html" class=""> <img src="/images/logo.jpg" alt="">
			</a>
			<h2>레시피 등록</h2>
		</div>
		<br>
		<!--사진업로드 로고 end-->

		<!--사진업로드 Form-->
		<form class="upload-form" action="/image" method="post"
			enctype="multipart/form-data" id="myForm">
			<!-- 대표사진 이미지 업로드 -->
			<div>
				<div class="upload-form-detail">
					<input type="file" name="file" onchange="imageChoose(this)" />

					<div class="upload-img">
						<img src="/images/person.jpeg" alt="" id="imageUploadPreview" />
					</div>
					<p>요리의 대표사진을 등록해 주세요.</p>
				</div>
				<!--사진설명 + 업로드버튼-->
				<div class="upload-form-detail">
					<div class="border-group">
						<div class="form-group row">
							<label class="col-sm-3">레시피 제목</label>
							<div class="col-sm-5">
								<input type="text" placeholder="레시피 제목" name="title"
									class="input">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3">요리소개</label>
							<div class="col-sm-5">
								<input type="text" placeholder="요리소개를 간단하게 적어주세요"
									name="subTitle" class="input">
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3">사용한 재료 작성</label>
							<div class="col-sm-7">
								<input type="text" class="input" placeholder="사용한 재료 작성"
									name="ingredient" />
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3">메인재료</label>
							<div class="col-sm-7 input">
								<input type="radio" name="mainMenu" value="고기 " class="radio">고기
								<input type="radio" name="mainMenu" value="채소류">채소류 <input
									type="radio" name="mainMenu" value="해산물">해산물 <input
									type="radio" name="mainMenu" value="유제품/계란">유제품/계란 <input
									type="radio" name="mainMenu" value="과일">과일
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3">인원선택</label>
							<div class="col-sm-7 input">
								<input type="radio" name="person" value="1 " class="radio">1인분
								<input type="radio" name="person" value="2">2인분 <input
									type="radio" name="person" value="3">3인분 <input
									type="radio" name="person" value="4">4인분 <input
									type="radio" name="person" value="5">5인분
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3">조리 시간</label>
							<div class="col-sm-7 input">
								<input type="radio" name="cookTime" value="10분 " class="radio">10분이내
								<input type="radio" name="cookTime" value="20분">20분이내 <input
									type="radio" name="cookTime" value="30분">30분이내 <input
									type="radio" name="cookTime" value="60분">60분이내 <input
									type="radio" name="cookTime" value="2시간">2시간이내
							</div>
						</div>

						<div class="form-group row">
							<label class="col-sm-3">요리 난이도</label>
							<div class="col-sm-7 input">
								<input type="radio" name="difficult" value="⭐ " class="radio">⭐
								<input type="radio" name="difficult" value="⭐⭐">⭐⭐ <input
									type="radio" name="difficult" value="⭐⭐⭐">⭐⭐⭐ <input
									type="radio" name="difficult" value="⭐⭐⭐⭐">⭐⭐⭐⭐ <input
									type="radio" name="difficult" value="⭐⭐⭐⭐⭐">⭐⭐⭐⭐⭐
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-5">요리 팁이 있다면 작성해주세요</label><br> <br>
							<textarea name="cookTip" form="myForm" cols="30" rows="5"
								placeholder="Ex) 고기요리에는 소금보다 설탕을 넣어야 단맛이 겉돌지 않고 육질이 부드러워요"></textarea>
						</div>


					</div>
				</div>

			</div>
			<hr>
			<!-- STEP-->
			<div class="bg-light">
				<div class="border-group2">

					<!--요리 순서-->

					<div class="upload-top">
						<br>
						<h2>요리 순서</h2>
						<br>
						<p>
							<b>✔ 요리의 맛이 좌우 될 수 있는 중요한 부분은 빠짐없이 적어주세요.</b>
						</p>
					</div>
					<br> <br>
					<!-- STEP1 -->
					<div class="form-group row">
						<div class="col-sm-7">
							<h3>STEP1.</h3>

							<textarea name="cation01" form="myForm" cols="30" rows="5"
								placeholder="요리과정에 대해 설명해 주세요" style="width: 550px;"></textarea>
						</div>
						<div class="col-sm-3">
							<input type="file" name="file2" onchange="imageChoose2(this)" />

							<div class="upload-img2">
								<img src="/images/person.jpeg" alt="" id="imageUploadPreview2" />
							</div>
							<p></p>
						</div>
					</div>
					<hr>
					<!-- STEP2 -->
					<div class="form-group row">
						<div class="col-sm-7">
							<h3>STEP2.</h3>

							<textarea name="cation02" form="myForm" cols="30" rows="5"
								placeholder="요리과정에 대해 설명해 주세요" style="width: 550px;"></textarea>
						</div>
						<div class="col-sm-3">
							<input type="file" name="file3" onchange="imageChoose3(this)" />

							<div class="upload-img2">
								<img src="/images/person.jpeg" alt="" id="imageUploadPreview3" />
							</div>
							<p></p>
						</div>
					</div>
					<hr>
					<!-- STEP3 -->
					<div class="form-group row">
						<div class="col-sm-7">
							<h3>STEP3.</h3>

							<textarea name="cation03" form="myForm" cols="30" rows="5"
								placeholder="요리과정에 대해 설명해 주세요" style="width: 550px;"></textarea>
						</div>
						<div class="col-sm-3">
							<input type="file" name="file4" onchange="imageChoose4(this)" />

							<div class="upload-img2">
								<img src="/images/person.jpeg" alt="" id="imageUploadPreview4" />
							</div>
							<p></p>
						</div>
					</div>
					<hr>
					<!-- STEP4 -->
					<div class="form-group row">
						<div class="col-sm-7">
							<h3>STEP4.</h3>

							<textarea name="cation04" form="myForm" cols="30" rows="5"
								placeholder="요리과정에 대해 설명해 주세요" style="width: 550px;"></textarea>
						</div>
						<div class="col-sm-3">
							<input type="file" name="file5" onchange="imageChoose5(this)" />

							<div class="upload-img2">
								<img src="/images/person.jpeg" alt="" id="imageUploadPreview5" />
							</div>
							<p></p>
						</div>
					</div>
					<hr>
					<!-- STEP5 -->
					<div class="form-group row">
						<div class="col-sm-7">
							<h3>STEP5.</h3>

							<textarea name="cation05" form="myForm" cols="30" rows="5"
								placeholder="요리과정에 대해 설명해 주세요" style="width: 550px;"></textarea>
						</div>
						<div class="col-sm-3">
							<input type="file" name="file6" onchange="imageChoose6(this)" />

							<div class="upload-img2">
								<img src="/images/person.jpeg" alt="" id="imageUploadPreview6" />
							</div>
							<p></p>
						</div>
					</div>

				</div>
			</div>
			<button class="cta blue button">업로드</button>

			<!--사진설명end-->

		</form>
		<!--사진업로드 Form-->
	</section>
	<!--사진업로드 박스 end-->
</main>
<br />
<br />

<script src="/js/upload.js"></script>
<%@ include file="../main/footer.jsp"%>