var OrderFormController = {
    form: $('#order-form'),
    bookBindingCheckbox: $('#bookbinding'),
    paperSizeInput: $('#paper-size'),
    paperQualityInput: $('#paper-quality'),
    bookBindingMethodInput: $('#bookbinding-method'),
    coverQualityInput: $('#cover-quality'),
    numberOfSideInput: $('#number-of-side'),
    numberOfCopiesInput: $('#number-of-copies'),
    pricingData: {},
    fileUploadInput: $('#file-upload'),
    previewButton: $('#preview-button'),

    bookBindingToggleInput() {
        if (!this.bookBindingCheckbox.prop('checked')) {
            this.bookBindingMethodInput.prop('disabled', true);
            this.coverQualityInput.prop('disabled', true);
        }
        else {
            this.bookBindingMethodInput.prop('disabled', false);
            this.coverQualityInput.prop('disabled', false);
        }
    },

    initForm() {
        var _self = this;

        this.fileUploadInput.on("change", function() {
            if (_self.fileUploadInput.valid()) {
                _self.previewButton.prop('disabled', false);
            }
        });

        this.bookBindingToggleInput();
        this.bookBindingCheckbox.on("change", function () {
            OrderFormController.bookBindingToggleInput();
        });

        $.getJSON("./data/pricing.json", function (data) {
            _self.pricingData = data;

            _self.form.on("change", function () {
                // calculate total and display it within the form
                $("#total").val(_self.calculateTotal());
            });
        });
    },

    calculateTotal() {
        var total = 0;

        // calculate total for 1 item
        total += this.pricingData.paperSize[this.paperSizeInput.val()] * this.pricingData.paperQuality[this.paperQualityInput.val()];
        if (this.bookBindingCheckbox.prop('checked')) {
            total += this.pricingData.bookBindingMethod[this.bookBindingMethodInput.val()] + this.pricingData.coverQuality[this.coverQualityInput.val()];
        }
        if (this.numberOfSideInput.val() == 2) {
            total = Math.round(total / 1.5);
        }
        // done (for 1 item)

        // calculate total for the whole order
        total *= this.numberOfCopiesInput.val();
        // DONE

        return total;
    },

    // getFileSize() {
    //     $('#file-upload').on('change', function() {
    //         alert(this.file[0].size);
    //     });
    // }
}

OrderFormController.initForm();

// orderFormController.getFileSize();
