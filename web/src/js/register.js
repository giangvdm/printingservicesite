var RegisterController = {
    usernameInput: $("#username"),
    usernameValidityDisplay: $("#js-usernameValidityDisplay"),

    checkUsernameValidity: function() {
        var _self = this;

        $(document).ready(function () {
            _self.usernameInput.change(function () {
                var username = $(this).val();
                if (username.length > 3) {
                    // console.log("Preparing...");
                    $.ajax({
                        method: "POST",
                        url: "CheckUser",
                        data: "username=" + username,
                        success: function (msg) {
                            $(document).ajaxComplete(function (event, request, settings) {
                                if (msg == "invalid") {
                                    _self.usernameValidityDisplay.html("Tên đăng nhập đã tồn tại!");
                                    _self.usernameInput.get(0).setCustomValidity("Hãy chọn một tên đăng nhập khác."); // call get(0) to cast jQuery object to JavaScript in order to use JS setCustomValidity method
                                }
                                else {
                                    _self.usernameValidityDisplay.html("Tên đăng nhập khả dụng!");
                                    _self.usernameInput.get(0).setCustomValidity('');
                                }
                                // console.log(msg);
                            });
                        }
                    });
                } else {
                    _self.usernameValidityDisplay.html("Tên đăng nhập phải dài hơn 4 ký tự!");
                    _self.usernameInput.get(0).setCustomValidity("Hãy chọn một tên đăng nhập khác.");
                }
            });
        });
    }
}

RegisterController.checkUsernameValidity();