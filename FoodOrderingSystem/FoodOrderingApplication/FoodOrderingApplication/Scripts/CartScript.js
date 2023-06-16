var secondsleft = sessionStorage.getItem("seconds") ? sessionStorage.getItem("seconds") : 60;
var minutesLeft = sessionStorage.getItem("minutes") ? sessionStorage.getItem("minutes") : 09;
var Timer = setInterval(function () {
    document.getElementById("timer").innerHTML = `00:${minutesLeft}:${secondsleft}`;
    sessionStorage.setItem("seconds", secondsleft);
    secondsleft -= 1;
    if (secondsleft <= 0 && minutesLeft <= 0)
    {
        window.location.href = '/Account/Index';
    }
    if (secondsleft <= 0)
    {
        minutesLeft -= 1;
        sessionStorage.setItem("minutes", minutesLeft);
        secondsleft = 60;
    }
   
}, 1000);

$.ajax
    ({
        type: "GET",
        url: FoodAppUrlSettings.GetNoOfCartItem,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {
            document.getElementById("cart-item").innerHTML = data;
        }

    });

function AddToCart(foodItem) {
    var data = { "id": foodItem.id };
    $.ajax
        ({
            type: "GET",
            url: FoodAppUrlSettings.AddCartUrl,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data)
            {
                alert(data);
            }

        });
}
function LogOut() {
    sessionStorage.clear();
    window.location.href = '/Account/LogOut'
}
$(document).ready(function () {
    $(".add-Item").click(function ()
    {
        let item = document.getElementById("cart-item").textContent;
        document.getElementById("cart-item").textContent = parseInt(item) + 1;
    })
})