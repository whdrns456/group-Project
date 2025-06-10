/**
 * 
 */
const logout = async function () {
    try {
        const response = await fetch("logout", { method: "POST" });

        if (!response.ok) {
            throw new Error(`서버 오류 발생: ${response.status}`);
        }

        const result = await response.text();

        if (result === "success") {
            alert("로그아웃 성공 되었습니다.");
            location.href = "/haechan/";
        } else {
            alert("로그아웃 실패");
        }
    } catch (e) {
        console.error(e);
    }
};
window.onload = function () {
    document.getElementById("logout-btn").addEventListener("click", logout);
}