
$(document).ready(function () {
    $(".tab-nav-wrapper li.active").click();
    $($(".tab-nav-wrapper li.active a").attr("href")).show();
    $(".tab-nav-wrapper li").click(function (e) {
        e.preventDefault();
        e.stopPropagation();

        $(".tab-nav-wrapper li").removeClass("active");
        $(this).addClass("active");

        var target = $(this).find("a").attr("href");
        $(".tab-content-wrapper").find(".tab-content").hide();
        $(".tab-content-wrapper").find(target).show();
    })
});

function AddBoard()
{
    window.location.href = '/Board/AddBoard';
}
$(document).ready(function () {
    
    $.ajax({
        type: "GET",
        url: AppUrlSettings.FetchOccation,
        success: function (data)
        {
            console.log(data);
            var defaultValue = '<option value="-1">Please Select a Occation</option>';
            for (var i = 0; i < data.length; i++)
            {
                defaultValue += '<option value="' + data[i].occationID + '">' + data[i].occationName + '</option>';
            }
            $("#dropdown").html(defaultValue);
        },
        Error: function (data) {
            console.log(data);
        }
    });
});  

function Validate() {
    var checker = false;
    if (!$("#title").val()) {
        checker = true;
        $("#title").css({ "border": "1px solid red" });
        $("#title-error").html("*Enter your title");


    }
    else {
        $("#title").css({ "border": "1px solid #eee" });
        $("#title-error").html(" ");

    }
    if (!$("#name").val()) {
        checker = true;
        $("#name").css({ "border": "1px solid red" });
        $("#name-error").html("*Enter recepient name");


    }
    else {
        $("#name").css({ "border": "1px solid #eee" });
        $("#name-error").html(" ");

    }
    var value = $("#dropdown option:selected").val();
    if (value <= 0) {
        checker = true;
        document.getElementById("dropdown").style.border = "1px solid red";
        document.getElementById("dropdown-error").innerHTML = "*Select occation";
    }
    else {
        document.getElementById("dropdown").style.border = "1px solid whitesmoke";
        document.getElementById("dropdown-error").innerHTML = "";
    }
    if (checker) {

    }
    else {
        document.forms["addForm"].submit();
        //var address = $("#address").val();
        //var valu = $("#dropdown").val();

        //var data = { "paymentType": valu, "Address": address };
        //$.ajax({
        //    type: "GET",
        //    url: FoodAppUrlSettings.OrderDetail,
        //    data: data,
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (data) {

        //        window.location.href = '/Food/SummaryPage';

        //    }
        //});
    }

}