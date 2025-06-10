<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    input{
        display: block;
        width: 50%;
        height: 10%;
    }
    form button{
        width: 20%;

    }
</style>
</head>
<body>
        <form action="boardUpdate" id="updateForm" method="post">
            <input type="text" value="${board.boardNo}" name="boardNo" readonly="readonly">
            <input type="text" value="${board.writer}" name="writer" readonly="readonly">
            <input type="text" value="${board.title}" name="title">
            <input type="text" value="${board.content}" name="content" >
            <button type="submit" onclick="return confirm('등록하시겠습니까?');">등록</button>
        </form>

<script>
    document.getElementById("updateForm").addEventListener("submit",async function(e){
        e.preventDefault();

        const form = e.target;
		const data = {
				boardNo: form.boardNo.value,
                writer: form.writer.value,
                title: form.title.value,
                content: form.content.value
		}
       
        try{
            const response = await fetch("updateBoard",{
                method: "post",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(data)
            });
            const result = await response.text();
            
            if(result == "success"){
                alert("수정 완료");
            }else{
                alert("수정 실패");
            }
        }catch(e){
            console.error(e);   
        }
       
    });
    
</script>
</body>
</html>