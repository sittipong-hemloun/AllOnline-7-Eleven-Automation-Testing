*** Variables ***
${SEARCH_BAR}               //input[@placeholder='ค้นหาชื่อสินค้าหรือแบรนด์']
${SEARCH_BUTTON}            //button[@class='btn btn-default search']//span[@class='glyphicon glyphicon-icon-search']
${COOKIE_GDPR_BUTTON}       //div[@id='alert-cookie-gdpr-allonline__button']
${PRODUCT_TITLE_LINK}       (//a[contains(@title, '{PRODUCT_NAME}')])[1]
${ADD_TO_CART_BUTTON}       //button[@class='btn btn-addtocart btn-green gradient broad add-to-cart add-to-cart-cls-mobile']
${PROCEED_BUTTON}           //a[@class='btn btn-confirm btn-green gradient wide btn-half pull-right proceed']
