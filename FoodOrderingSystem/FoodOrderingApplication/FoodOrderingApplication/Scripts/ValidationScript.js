$(document).ready(function () {
    sessionStorage.removeItem();
    $("#login").click(function () {
        ValidationForm();

    });
});
function ValidationForm() {
    if ($("#login-form").valid()) {
        document.forms["loginForm"].submit();
    }
    else
    {
        return false
    }
}
