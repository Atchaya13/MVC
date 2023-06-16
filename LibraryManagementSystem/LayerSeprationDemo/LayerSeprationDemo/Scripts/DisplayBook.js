var table =$('#books-detail').dataTable({
    order: [[0, 'asc']]
});

function DeleteBook(id)
{
    var confirmMessage = "Do you want to delete this record";
    if (confirm(confirmMessage) == true) {
        var bookId = parseInt($(id).attr('id'));
        var data = { "queryString": bookId };
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
        document.getElementById("books-detail").deleteRow(i);
    }
    else {

    }
    
}


