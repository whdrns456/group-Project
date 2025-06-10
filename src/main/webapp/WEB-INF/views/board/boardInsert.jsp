<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    * {
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background-color: #f7f7f7;
        padding: 40px;
    }

    .form-div {
        width: 600px;
        margin: 0 auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        position: relative;
    }

    .input-div input {
        display: block;
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        background-color: #fdfdfd;
        transition: border-color 0.3s;
    }

    .input-div input:focus {
        border-color: #4a90e2;
        outline: none;
    }

    #content-area {
        width: 100%;
        height: 150px;
        padding: 12px;
        resize: none;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    #content-area.warning {
        border-color: red;
        background-color: #ffe6e6;
    }

    .testLength {
        position: absolute;
        bottom: 35px;
        right: 35px;
        font-size: 13px;
        color: #666;
    }

    .testLength p {
        display: inline;
        margin: 0;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }
</style>
</head>
<body>
	<div class="form-div">
		<div class="input-div">
		<input type="text" id="usersId" readonly value="${sessionScope.loginUser.usersId}">
		<input type="text" id="boardTitle" placeholder="제목을 입력하세요.">
	</div>
		<textarea name="content" id="content-area" class="content-area" maxlength="200"  placeholder="텍스트를 입력하세요"></textarea>
		<div class="testLength">
			<p class="textCount">0</p>
			<p class="textTotal">/200</p>
		</div>
		<button type="submit" id="insetBoard">등록하기</button>
	</div>
	<script>
		window.onload = function(){
		// click event안에서 

		const textarea = document.querySelector(".content-area");
		const textCount = document.querySelector(".textCount");
		const maxLength = 200; 

		//submit은 form태그 안에서 만 사용이 가능하다. 
		document.getElementById("insetBoard").addEventListener("click",async function() {
		//onclick 시 데이터 삽입되게 해야된다. 
		const writer = document.getElementById("usersId").value;
		const title = document.getElementById("boardTitle").value;
		const content = document.getElementById("content-area").value;

		data = {
			writer: writer,
			title: title,
			content: content
		}


			try{
				const respone = await fetch("insertBoard",{
					method:"post",
					headers:{"Content-Type":"application/json"},
					body: JSON.stringify(data)
				});
				const result = await respone.text();

				if(result == 'success'){
					alert('[게시글 등록 성공했습니다.]');
					location.href = "/haechan/boardList.do"
				}else{
					alert('게시글 등록 실패했습니다.');
				}

			}catch(e){
				console.log(e);
				
			}
		});
		textarea.addEventListener("input", function(){
			const length = textarea.value.length;
			textCount.textContent = length;
			
			if(length >= maxLength){
				textarea.classList.add('warning');
				alert('[최대 글자 수 200자를 초과할 수 없습니다.]');
			}else{
				textarea.classList.remove('warning');
			}
		});
	}
	</script>
</body>
</html>