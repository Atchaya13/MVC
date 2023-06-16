var table = document.getElementById("assert-detail"), sumVal = 0;
for (var i = 1; i < table.rows.length; i++)
{
    if (i != table.rows.length-1)
    {
      
        sumVal = sumVal + parseFloat(table.rows[i].cells[1].innerHTML);
    }
    
}
document.getElementById("total").innerHTML = " "+ sumVal;
function DeleteItemFromCart(item)
{
    var confirmMessage = "Do you want to delete this item";
    if (confirm(confirmMessage) == true) {
        var foodId = parseInt($(item).attr('id'));
        var data = { "FoodId": foodId };
        $.ajax({
            type: "GET",
            url: FoodAppUrlSettings.DeleteItem,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data)
            {
                alert(data);
                window.location.reload();
               
            }
        });
       
    }
    else
    {

    }
}
function Decrese(minus)
{
    
    var sample = $(minus).next().attr("id");
    let text = document.getElementById(sample).textContent;
    document.getElementById(sample).textContent = parseInt(text) - 1;
    var data = { "FoodId": minus.id,"operation":"minus"};
    $.ajax({
        type: "GET",
        url: FoodAppUrlSettings.UpdateCartItem,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {
            window.location.reload();
        }
    });
  
}
function Increse(plus)
{
    var sample = $(plus).prev().attr("id");
    let text = document.getElementById(sample).textContent;
    document.getElementById(sample).textContent = parseInt(text) + 1;
    var data = { "FoodId": plus.id, "operation": "plus" };
    $.ajax({
        type: "GET",
        url: FoodAppUrlSettings.UpdateCartItem,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {
            window.location.reload();
        }
    });
}
function OpenPopUp()
{
    $('#ModalPopUp').modal('show');
}
$(document).ready(function () {
    $.ajax({
        type: "GET",
        url: FoodAppUrlSettings.GetPaymentMethod,
        data: "{}",
        success: function (data) {
 
            var defaultValue = '<option value="-1">Please Select a payment option</option>';
            for (var i = 0; i < data.length; i++) {
                defaultValue += '<option value="' + data[i].PayID + '">' + data[i].PaymentName + '</option>';
               
            }
            $("#dropdown").html(defaultValue);
        }
    });
   
});  
function ClosePopUp()
{
    $('#ModalPopUp').modal('hide');
}
function Validate()
{
    var checker = false;
    if (!$("#address").val())
    {
        checker = true;
        $("#address").css({ "border": "1px solid red" });
        $("#address-error").html("*Enter your address");
      

    }
    else
    {
        $("#address").css({ "border": "1px solid #eee" });
        $("#address-error").html(" ");
       
    }
    var value = $("#dropdown option:selected").val();
    if (value <= 0)
    {
        checker = true;
        document.getElementById("dropdown").style.border = "1px solid red";
        document.getElementById("dropdown-error").innerHTML = "*Select payment method";
    }
    else
    {
        document.getElementById("dropdown").style.border = "1px solid whitesmoke";
        document.getElementById("dropdown-error").innerHTML = "";
    }
    if (checker)
    {

    }
    else
    {
        var address = $("#address").val();
        var valu = $("#dropdown").val();

        var data ={ "paymentType": valu, "Address": address };
        $.ajax({
            type: "GET",
            url: FoodAppUrlSettings.OrderDetail,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data)
            {
                
                window.location.href = '/Food/SummaryPage';

            }
        });
    }
    
}
