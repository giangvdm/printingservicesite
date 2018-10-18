var bookBindingCheckbox = document.getElementById("bookbinding");
var bookBindingMethodSelect = document.getElementById("bookbinding-method");
var coverSelect = document.getElementById("cover");

if (!bookBindingCheckbox.checked) {
    bookBindingMethodSelect.disabled = true;
    coverSelect.disabled = true;
}