window.onload = function () {
    const submitBtn = document.getElementById("submitBtn");

    submitBtn.addEventListener("click", function (event) {
        event.preventDefault(); // 폼의 기본 제출 동작 막기
        sendData(); // 로그인 함수 실행
    });

    async function sendData() {
        const userId = document.getElementById("userId").value.trim();
        const userPassword = document.getElementById("userPassword").value.trim();

        if (!userId || !userPassword) {
            alert("아이디와 비밀번호를 모두 입력해 주세요.");
            return;
        }

        const data = {
            usersId: userId,
            usersPassword: userPassword
        };

        try {
            const response = await fetch("userLogin", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(data)
            });

            const result = await response.json();
            console.log("로그 확인 ::", result);

            if (result.status === "success") {
                location.href = "/haechan/";
            } else {
                alert(result.message);
            }

        } catch (e) {
            console.error("전송 실패", e);
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    }
};
