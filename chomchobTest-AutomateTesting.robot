*** Settings ***
Library            SeleniumLibrary
Suite Setup        Set Selenium Speed    0.1s
Suite Teardown     Close Browser

*** Variables ***
${url}                       https://www.nejavu.com
${browser}                   chrome
${locator_banner}            css=#top > main > div.modal-overlay.active > div.modal.p-0.active > div
${locator_closemodal}        css=#top > main > div.modal-overlay.active > div.modal.p-0.active > a
${locator_search}            css=#search-dropdown
${locator_menucartoon}       css=#top > main > div.main-wrapper.is-chrome > div.nav-wrapper.site-nav > div.nav-container > div.dn.db-lg.rel.z-2 > nav > div > ul > li:nth-child(3) > a
${locator_cartoon}           css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.mt-4 > div > h4 > strong > span:nth-child(1)
${locator_listrow2}          xpath=/html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[7]/div/div[2]
${locator_addcart1}          xpath=/html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[1]/div/div[3]/div[2]
${locator_addcart2}          xpath=/html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[2]/div/div[3]/div[2]
${locator_addcart3}          xpath=/html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[3]/div/div[3]/div[2]
${locator_addcart4}          xpath=/html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[4]/div/div[3]/div[2]
${locator_addcart5}          xpath=/html/body/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[5]/div/div[3]/div[2]
${locator_button_cart}       css=#top > main > div.main-wrapper.is-chrome > div.header-wrapper.site-header > div > div > div.header-bottom > div > div.dim-4.dim-3-lg.df.aic.jce.od-3.p-1.p-0-lg > ul > li:nth-child(2) > div > a
${locator_mycart}            xpath=//*[@id="cart"]/div[1]/h4/strong
${locator_name1}             css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(1) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_name2}             css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(2) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_name3}             css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(3) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_name4}             css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(4) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_name5}             css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(5) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_delete1}           xpath=/html/body/main/div[1]/div[3]/div[1]/div/div/div[2]/div[2]/div[5]/a
${locator_delete2}           xpath=/html/body/main/div[1]/div[3]/div[1]/div/div/div[2]/div[3]/div[5]/a
${locator_delete3}           xpath=/html/body/main/div[1]/div[3]/div[1]/div/div/div[2]/div[4]/div[5]/a
${locator_delete4}           xpath=/html/body/main/div[1]/div[3]/div[1]/div/div/div[2]/div[2]/div[5]/a
${locator_delete5}           xpath=/html/body/main/div[1]/div[3]/div[1]/div/div/div[2]/div[2]/div[5]/a
${locator_priceall}          xpath=/html/body/main/div[1]/div[3]/div[1]/div/div/div[4]/div[2]/div/div[1]
${locator_confirm_delete}    xpath=/html/body/div/div/div[3]/button[1]
${locator_cartnull}          xpath=//*[@id="top"]/main/div[1]/div[3]/div[1]/div/div/h2/strong
${locator_badge_cart}        css=#badge-cart

*** Keywords ***
Open Web Browser
    #เปิด Browser และไปที่ Link https://www.nejavu.com
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_banner}

Add to cart
    Click Element      ${locator_addcart1}
    Sleep    0.2s
    Click Element      ${locator_addcart2}
    Sleep    0.2s
    Click Element      ${locator_addcart3}
    Sleep    0.2s
    Click Element      ${locator_addcart4}
    Sleep    0.2s
    Click Element      ${locator_addcart5}
    Sleep    2s

Delete item
    Click Element      ${locator_delete1}
    Click Element      ${locator_confirm_delete}
    Sleep    2s
    Click Element      ${locator_delete2}
    Click Element      ${locator_confirm_delete}
    Sleep    2s
    Click Element      ${locator_delete3}
    Click Element      ${locator_confirm_delete}
    Sleep    2s
    Click Element      ${locator_delete4}
    Click Element      ${locator_confirm_delete}
    Sleep    2s
    Click Element      ${locator_delete5}
    Click Element      ${locator_confirm_delete}
    Sleep    2s

*** Test Cases ***
TC-1
    Open Web Browser

    #ถ้ามี Banner pop-up ขึ้นมาให้กดปิด Modal (แต่ถ้าไม่ทำข้อต่อไปได้เลย)
    Click Element    ${locator_closemodal}
    Wait Until Element Is Visible    ${locator_search}  

    #Click menu “การ์ตูน”
    Click Element    ${locator_menucartoon}
    Wait Until Element Is Visible    ${locator_cartoon}

    # Get ชื่อหนังสือทุกเล่มในแถวที่หนึ่ง
    ${txt1}=    Get Text    ${locator_name1}
    ${txt2}=    Get Text    ${locator_name2}
    ${txt3}=    Get Text    ${locator_name3}
    ${txt4}=    Get Text    ${locator_name4}
    ${txt5}=    Get Text    ${locator_name5}
    Scroll Element Into View    ${locator_listrow2}   #ทำตรงนี้เพราะว่าต้อง Scroll down ลงมาแถวที่ 2 เนื่องจากติดแถบแจ้งเตือน cookie ทำให้กดปุ่มใส่ตะกร้าไม่ได้
    Sleep    0.2s

    #กดปุ่ม “ใส่ตระกร้า” หนังสือทุกเล่มแถวที่หนึ่ง
    Add to cart

    #กดปุ่ม “รถเข็น / ตระกร้า”
    Click Element    ${locator_button_cart}
    Wait Until Element Is Visible    ${locator_mycart}
    Sleep    0.2s

    #Verify ชื่อหนังสือทุกเล่ม ที่อยู่ในตระกร้า โดยใช้ชื่อที่ได้มาจากข้อที่แล้ว 
    Should Be Equal As Strings    ${txt2}     [จัดส่ง20มิ.ย..67](BOXSET) Boruto โบรุโตะ เล่ม 20
    Should Be Equal As Strings    ${txt3}     [จัดส่ง18เม.ย.67](BOXSET No.2) NARUTO นินจาคาถา โอ้โฮเฮะ เล่ม 19 - 36
    Should Be Equal As Strings    ${txt4}     [จัดส่ง18เม.ย.67](BOXSET No.1) NARUTO นินจาคาถา โอ้โฮเฮะ เล่ม 1 - 18
    Should Be Equal As Strings    ${txt1}     มหาศึกคนชนคน เล่ม 3 
    Should Be Equal As Strings    ${txt5}    คืนนี้พี่ขอดูด เล่ม 4 [Limited Edition]
    Sleep    1s                            
                                
    #ลบหนังสือทุกเล่มที่อยู่ในตระกร้า
    #Scroll Element Into View    ${locator_priceall}
    Sleep    2s
    Delete item
    Wait Until Element Is Visible    ${locator_cartnull}
    Sleep    0.5s

    #Verify badge บนรถเข็นว่าเหลือหนังสือเท่ากับ 0
    ${txt}=    Get Text    ${locator_badge_cart}
    Should Be Equal As Strings    ${txt}    0
    Sleep    0.5s
    