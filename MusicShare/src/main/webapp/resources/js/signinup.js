function testfn() {
    var username=$("#username").val();
    var password=$("#password").val();
    console.log(username+"=="+password);
    $.ajax({
        type: 'post',
        url: 'localhost:8080/user/login',
        contentType: 'application/json;charset=utf-8',
        data: '{' +
        '"username":' + '"' + username + '"' + ',' + '"password":' + '"' + password + '"' +
        '}',
        success: function (data) {
            if(date){
                alert("成功");
            }
        }
    });
}