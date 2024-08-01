*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Edge
${URL}    https://abhigyank.github.io/To-Do-List/
${ELEMENT}    //div[@class='mdl-tabs__panel is-active']
${EXPECTED_ITEM_TC001}    นางสาว นิภาลัย กิจนพศรี
${EXPECTED_ITEM_TC002}    Miss Kanoknan Suchaoin 
${EXPECTED_ITEM_TC003}    Miss Jariya Ratchatathiwat
${EXPECTED_ITEM_TC004}    Mrs. Jarunan Phanggamta
${EXPECTED_ITEM_TC005}    Mrs. Watcharapong kijnopsri

*** Keywords ***
Login
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1920    1080

*** Test Cases ***
# Testcase : ตรวจสอบการทำงานเพิ่ม
# Expected : ระบบแสดงข้อมูลตามที่ผู้ใช้งานเพิ่ม
#
TC-001 To Do List 01
    Login
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]  นางสาว นิภาลัย กิจนพศรี
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]     #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]  นางสาว นพมาศ  กิจนพศรี
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]     #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]   นางสาว ปัตตาเวีย  กิจนพศรี
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]     #ปุ่มเพิ่ม
    Sleep   3s
    Click Element   xpath=(//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[2]  #ไปหน้า To-Do-task
    Sleep   3s
    Element Should Contain    ${ELEMENT}    ${EXPECTED_ITEM_TC001}   #เชคข้อมูลที่ควรมีอยู่
    Close Browser

# Testcase : ตรวจสอบการทำงานเพิ่มกรณีที่ลบรายการที่เพิ่มเข้ามา 1 รายการ และทำการเพิ่มใหม่อีกครั้ง
# Expected : ระบบแสดงข้อมูลตามที่ผู้ใช้งานเพิ่ม
#
TC-002 To Do List 02
    Login
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]  Miss Kanoknan Suchaoin
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]    #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]   Miss Jariya Ratchatathiwat
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]   #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]   Mrs. Jarunan Phanggamta
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]   #ปุ่มเพิ่ม
    Click Element   xpath=(//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[2]   #ไปหน้า To-Do-task
    Sleep   2s
    Element Should Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC002}  #เชคข้อมูลที่ควรมีอยู่
    Click Element   xpath=(//span[@class='mdl-button__ripple-container'])[1]
    Sleep   2s
    Element Should Not Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC002}  #เชคข้อมูลที่ไม่ควรมีอยู่
    Click Element   xpath=(//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[1]   #ไปหน้า ADD ITEM
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]  Miss Kanoknan Suchaoin
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]          #ปุ่มลบ
    Click Element   xpath=(//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[2]
    Sleep   2s
    Element Should Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC002}  #เชคข้อมูลที่ควรมีอยู่
    Close Browser

# Testcase : ตรวจสอบการทำงานเพิ่มกรณีเลือกรายการที่ต้องการ completed
# Expected : ระบบแสดงข้อมูลตามที่ผู้ใช้งานเพิ่ม
# 
TC-002 To Do List 03
    Login
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]  Miss Kanoknan Suchaoin
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]    #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]   Miss Jariya Ratchatathiwat
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]   #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]   Mrs. Jarunan Phanggamta
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]   #ปุ่มเพิ่ม
    Input Text   xpath=//div[contains(@class,'mdl-textfield mdl-js-textfield')]//input[1]   Mrs. Watcharapong kijnopsri
    Click Element   xpath=//button[contains(@class,'mdl-button mdl-js-button')]//i[1]   #ปุ่มเพิ่ม
    Click Element   xpath=(//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[2]   #ไปหน้า To-Do-task
    Repeat Keyword    4    Click Element    xpath=(//span[contains(@class,'mdl-checkbox__ripple-container mdl-js-ripple-effect')])[1]
    Sleep   5s
    Click Element   xpath=(//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[3]  #ไปหน้า Completed
    Sleep   2s
    Element Should Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC002}  #เชคข้อมูลที่ควรมีอยู่
    Element Should Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC003}  #เชคข้อมูลที่ควรมีอยู่
    Element Should Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC004}  #เชคข้อมูลที่ควรมีอยู่
    Element Should Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC005}  #เชคข้อมูลที่ควรมีอยู่
    Click Element   xpath=(//li[@class='mdl-list']//button)[4]
    Click Element   xpath=(//li[@class='mdl-list']//button)[2]
    Element Should Not Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC005}  #เชคข้อมูลที่ไม่ควรมีอยู่
    Element Should Not Contain    ${ELEMENT}  ${EXPECTED_ITEM_TC003}  #เชคข้อมูลที่ไม่ควรมีอยู่
    Close Browser

