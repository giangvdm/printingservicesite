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