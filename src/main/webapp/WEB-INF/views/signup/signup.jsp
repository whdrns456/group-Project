<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#signup-div{
    border-color: brown;
    background-color: blue;

}
#signup-div input,
#signup-div button{
    display: block;
    margin: auto;
    
}
#signup-div input{
    padding: 16px;
}

#signup-btn{
    padding-left: 75px;
    padding-right: 75px;
}
</style>
</head>
<body>
    <div id="signup-div">
        <input type="text" id="usersName" placeholder="이름을 입력하세요">
        <input type="text" id="usersId" placeholder="아이디를 입력하세요">
        <input type="password" id="usersPassword" placeholder="비밀번호를 입력하세요">
        <input type="password" id="passwordCheck" placeholder="비밀번호를 입력하세요">
        <button id="signup-btn">회원가입</button>
    </div>

    <script>
        window.onload = function(){
            document.getElementById("signup-btn").onclick = function(event){
                event.preventDefault();
                
                const usersPassword = document.getElementById("usersPassword").value;
                const pwdCheck = document.getElementById("passwordCheck").value;
                const usersId = document.getElementById("usersId").value;
                const usersName = document.getElementById("usersName").value;
                
                
                if(usersPassword !== pwdCheck){
                    alert("비밀번호가 일치하지 않습니다.")
                    return false;
                }
                const data = {
                    usersId: usersId,
                    usersName: usersName,
                    usersPassword: usersPassword
                }
                
                const signupPrompt = confirm("회원가입을 진행하겠습니까?");
                if (!signupPrompt) return;

            async function signup(){
                try{
                    const response = await fetch("userSignup",{
                        method:"POST",
                        headers:{
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(data)
                    });
                    const result = await response.text();
                    alert("서버 응답 확인" + result);
                    
                    if(result === "success"){
                        alert("회원가입 성공입니다");
                        location.href = "loginPage.do"
                    }else{
                        alert("회원가입에 실패했습니다.")
                    }
                }catch(e){
                    console.error("Error :: " + e);             
                }
            };
            signup();
            }
        };
    </script>
</body>
</html>