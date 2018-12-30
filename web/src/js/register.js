var RegisterController = {
    usernameInput: $("#username"),
    usernameValidityDisplay: $("#js-usernameValidityDisplay"),
    userType: $('#user-type'),

    checkUsernameValidity: function() {
        var _self = this;

        $(document).ready(function () {
            _self.usernameInput.keyup(function () {
                var username = $(this).val();
                if (username.length > 3) {
                    // console.log("Preparing...");
                    $.post('CheckUser', {"username" : username, "user-type": _self.userType.val()},
                        function(msg) {
                            console.log(msg);
                            if (msg.trim() == 'invalid') {
                                _self.usernameValidityDisplay.html("Tên đăng nhập đã tồn tại!");
                                _self.usernameInput.get(0).setCustomValidity("Hãy chọn một tên đăng nhập khác."); // call get(0) to cast jQuery object to JavaScript in order to use JS setCustomValidity method
                            }
                            else if (msg.trim() == 'valid') {
                                _self.usernameValidityDisplay.html("Tên đăng nhập khả dụng!");
                                _self.usernameInput.get(0).setCustomValidity('');
                            }
                        }
                    );
                } else {
                    _self.usernameValidityDisplay.html("Tên đăng nhập phải dài hơn 4 ký tự!");
                    _self.usernameInput.get(0).setCustomValidity("Hãy chọn một tên đăng nhập khác.");
                }
            });
        });
    }
}

RegisterController.checkUsernameValidity();