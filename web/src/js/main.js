var navController = {
    pageName: document.querySelector("body").dataset.pageName,
    navItems: document.getElementsByClassName("nav-list__item"),
    setActiveNavItem() {
        numberOfNavItems = this.navItems.length; // use this in For loop to improve performance (JS engine)
        for (var i = 0; i < numberOfNavItems; i++) {
            if (this.navItems[i].dataset.itemName === this.pageName) {
                this.navItems[i].classList.add("isActive");
                // optional break
                // break;
            }
        }
    }
}

navController.setActiveNavItem();

var dialogController = {
    dialogDismissButtons: $('.js-dialogDismissButton'),
    initDialog() {
        for (var i = 0; i < this.dialogDismissButtons.length; i++) {
            $(this.dialogDismissButtons[i]).on("click", function() {
                $(this).parent().fadeOut();
            });
        }
    }
}

dialogController.initDialog();