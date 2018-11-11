var formController = {
    bookBindingCheckbox: document.getElementById("bookbinding"),
    bookBindingMethodSelect: document.getElementById("bookbinding-method"),
    coverSelect: document.getElementById("cover"),
    
    bookBindingToggleInput() {
        if (!this.bookBindingCheckbox.checked) {
            this.bookBindingMethodSelect.disabled = true;
            this.coverSelect.disabled = true;
        }
        else {
            this.bookBindingMethodSelect.disabled = false;
            this.coverSelect.disabled = false;
        }
    },

    initForm() {
        this.bookBindingToggleInput();
        this.bookBindingCheckbox.addEventListener("change", function() {
            formController.bookBindingToggleInput();
        });
    },
    
    
}

formController.initForm();

