$(document).ready(function () {
   
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
function ValidatePost() {
    var checker = false;
    if (!$("#message").val()) {
        checker = true;
        $("#message").css({ "border": "1px solid red" });
        $("#message-error").html("*Enter your title");


    }
    else {
        $("#message").css({ "border": "1px solid #eee" });
        $("#message-error").html(" ");

    }
    var file = document.getElementById("file");

   

 
    if (file.files.length == 0) {
        checker = true;
        $("#file").css({ "border": "1px solid red" });
        $("#file - error").html("*No files selected"); 
    }
    else
        {
        $("#file").css({ "border": "1px solid #eee" });
        $("#file - error").html(" "); 
        }
   
    if (checker)
    {

    }
    else
    {
        document.forms["addForm"].submit();
    }
}