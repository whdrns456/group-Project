/**
 * window.onload = function(){
 * 
 *  DOMContentLoaded는 HTML이 모두 로드되고 파싱이 끝났을 때 실행
    window.onload는 HTML + CSS + 이미지 + JS 등 모든 리소스가 완전히 로드된 후 실행됨
 *   
    대부분의 경우 DOMContentLoaded가 더 빠르고 유용합니다.
 */
document.addEventListener('DOMContentLoaded', () => {
    document.body.addEventListener('click', function(e){
        if(e.target.classList.contains('toggle-reply')){
            const commentId = e.target.getAttribute('data-comment-id');
            const replyDiv = document.getElementById('replies-'+ commentId);

            if(replyDiv){
                const isHidden = replyDiv.style.display === 'none';
                replyDiv.style.display = isHidden ? 'block' : 'none';
                e.target.textContent = isHidden ? '대댓글 숨기기' : '대댓글 보기';
            }
        }
    });
    // DOM이 완전히 로드되었을 때 실행
    document.body.addEventListener("click", async function(e) {

        const usersId = document.getElementById("usersId").value;
        const target = e.target;

        if (!target.classList.contains('comment-btn')) return;
        
        const action = target.dataset.action;
        // CUD 중 확인;
        const commentId = target.dataset.replyId;
        // 대댓글 수정 삭제시 분별하기 위한
        const parentId = target.dataset.parentId;
        // 대댓글
        const boardNo = target.dataset.boardNo;
        // 댓글이 적히는 board 게시글 식별
        const type = target.dataset.type;
        // 부모 자식 타입 확인

        
        let url = '';
        let method = '';
        let payload = {};

        switch(action){
            case 'add':
            const content = prompt('댓글을 입력하세요');
            if (!content) return alert("내용이 비어있습니다.");
            
            payload = {
                boardNo,
                content,
                usersId,
                ...(type === 'child' && { parentId })
            };
            url = type === 'child' ? 'reply' : 'comment';
            method = 'POST';
            break;

            case 'delete':
                if(!confirm('정말 삭제하시겠습니까?')) return;
                payload = { commentId };
                url = 'comment';
                method = 'DELETE';
                break;

            case 'edit':
                const newContent = prompt("새로운 댓글 내용을 입력하세요:");
                if (!newContent) return alert("내용이 비어있습니다.");

                payload = {
                    commentId,
                    content: newContent
                };
                url = 'comment';
                method = 'PUT';
                break;

                default:
                    console.warn("정의되지 않은 액션입니다.");
                return;
            }

            try{
                const response = await fetch(url,{
                    method, 
                    headers:{"Content-Type": "application/json"},
                    body: JSON.stringify(payload)
                });

                const result = await response.text();

                if(result == 'success'){
                    alert('완료 되었습니다.');
                    location.reload();
                }else{
                    alert('작업중 문제 발생');
                }

            }catch(e){
                console.error(e);
            }

    });
});
