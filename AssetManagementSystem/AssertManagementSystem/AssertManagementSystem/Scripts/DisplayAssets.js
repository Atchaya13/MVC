
var table = $('#assert-detail').dataTable({
    order: [[0, 'asc']]
});
function DeleteAsset(id) {
    var confirmMessage = "Do you want to delete this record";
    if (confirm(confirmMessage) == true) {
        var assetId = parseInt($(id).attr('id'));
        var data = { "assetId": assetId };
        $.ajax({
            type: "GET",
            url: MyAppUrlSettings.MyUsefulUrl,
            data: data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                alert("here" + data);
            }
        });
        var i = id.parentNode.parentNode.rowIndex;
        document.getElementById("assert-detail").deleteRow(i);
    }
    else
    {

    }

}
function Decrese(minus)
{
    var data = { "assetId": minus.id };
    $.ajax({
        type: "GET",
        url: MyAppUrlSettings.MinusUrl,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            alert("here" + data);
        }
    });
    var sample = $(minus).next().attr("id");
    let text = document.getElementById(sample).textContent;
    let availableCount = $(minus).parent().next().attr("id");
    let count = document.getElementById(availableCount).textContent;
    let totalCount = document.getElementById(sample).textContent;
    var minusId = minus.id;
    if (parseInt(count) >= parseInt(totalCount))
    {
      $(minus).hide();
    }
    else 
    {
        document.getElementById(sample).textContent = parseInt(text) - 1;
    }
   
}
function Increse(plus) {
  
    var data = { "assetId": plus.id };
    $.ajax({
        type: "GET",
        url: MyAppUrlSettings.PlusUrl,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            alert("here" + data);
        }
        
    });
    var sample = $(plus).prev().attr("id");
    let text = document.getElementById(sample).textContent;
    let availableCount = $(plus).parent().next().attr("id");
    document.getElementById(sample).textContent = parseInt(text) + 1;
    let totalCount = document.getElementById(sample).textContent;
    let count = document.getElementById(availableCount).textContent;
    if (totalCount > count)
    {
      let s1= $(plus).prev().prev().show();
    }
  
}
//$("#drop-down").click(function (event) {
//    var value = $(this).val();
//    var productId=sessionStorage.getItem("assertId");
//    $("#assign").click(function () {
        
//        $.ajax({
//            type: "GET",
//            url: MyAppUrlSettings.ResourseAssignUrl,
//            data: { "value": value, "product": productId },
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            success: function (data) {
//                alert("Select user name!!!");
//            }
//        });
//    })
    
//});
function clickkk() {
   var value = $("#drop-down").val();
   var productId = sessionStorage.getItem("assertId");
    $.ajax({
            type: "GET",
            url: MyAppUrlSettings.ResourseAssignUrl,
            data: { "value": value, "product": productId },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data)
            {
               alert("success 123");
            }
    });
    $('#ModalPopUp').modal('hide');
   
}
function FetchAsset(id) {
    var GetID = id.id;
    sessionStorage.setItem("assertId", GetID);
}
function FetchUser(getid)
{
    var data = { "id": getid.id };
    $.ajax({
        type: "GET",
        url: MyAppUrlSettings.FetchUserUrl,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            alert("here" + data);
        }

    });
    
}
function FetchUsers(element)
{
    var data = { "id": element.id };
    //$('#ModalPopUp').modal('show');
    $.ajax({
        type: "GET",
        url: MyAppUrlSettings.FetchUserUrl,
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data)
        {
            //console.log(data);
            $('#ModalPopUp').modal('show');
        }
        
    });
    
}
function ClosePopUp() {
    $('#ModalPopUp').modal('hide');
}

              