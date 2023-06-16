var timeleft = sessionStorage.getItem("key") ? sessionStorage.getItem("key") : 1;
var Timer = setInterval(function ()
{
    document.getElementById("timer").innerHTML = `00:00:${timeleft}`;
    sessionStorage.setItem("key", timeleft);
    timeleft = parseInt(timeleft) + 1;
    if (timeleft >= 60) {
        sessionStorage.clear();
        let text = document.getElementById("timer").innerText;
        $("#timetextinput").val(text);
        document.forms["quiz-sheet"].submit();
    }
}, 1000);

function NextQuestion()
{
    sessionStorage.clear();
    sessionStorage.setItem("key", 1);
    let text = document.getElementById("timer").innerText;
    $("#timetextinput").val(text);
    document.forms["quiz-sheet"].submit();
}

function LogOut()
{
    sessionStorage.clear();
    window.location.href = '/Account/LogOut'
}