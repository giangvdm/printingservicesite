var UniversalFormController = {
    form: $(".form"),
    passwordInput: $("#password"),
    passwordRepeat: $("#password-repeat"),
    passwordRepeatValidityDisplay: $("#js-passwordRepeatValidityDisplay"),

    checkPasswordRepeat: function() {
        // check if this is a form with password & password-repeat fields
        if (this.form[0].length && this.passwordInput.length && this.passwordRepeat.length) {
            var _self = this;
            this.passwordRepeat.on("keyup", function() {
                if (_self.passwordRepeat.val() !== _self.passwordInput.val()) {
                    _self.passwordRepeatValidityDisplay.html("Mật khẩu không khớp!");
                    _self.passwordRepeat.get(0).setCustomValidity("Vui lòng nhắc lại mật khẩu.");
                }
                else {
                    _self.passwordRepeatValidityDisplay.html("");
                    _self.passwordRepeat.get(0).setCustomValidity("");
                }
            });
        }
    }
}

UniversalFormController.checkPasswordRepeat();