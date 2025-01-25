*** Variables ***
${CASH_COUNTERSERVICE_TAB}      //div[contains(@class,'payment-option-tab COUNTERSERVICE_CASH-tab')]//div[2]
${ADDRESS_INFO_FIELD}           //span[contains(@class,'address ellipsis-full')]
${PAYMENT_BUTTON}               //button[@class='btn js-pdbc btn-proceed btn-green gradient btn-lg btn-half wide pull-right space-down continue-payment-btn continue-payment-btn-popup']
${BARCODE_LABEL}                //div[contains(text(),'ชำระด้วยบาร์โค้ดผ่าน')]
${INVOICE_LABEL}                //td[contains(text(),'เลขที่ใบแจ้งสินค้า')]

# Example product locators (adjust as needed)
${AMARIT_NAME_CELL}             //td[contains(text(),'AMARIT คอลลาเจน 30 แคปซูล')]
${AMARIT_QTY_CELL}              //tbody/tr[3]/td[3]
${AMARIT_PRICE_CELL}            //td[contains(text(),'฿ 119')]
