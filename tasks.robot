*** Settings ***
Documentation       Practice buying stuff from an e-commerce site

Resource            ecommerce_website_workflow.robot


*** Tasks ***
Buy Stuff From E-Commerce Site
    Open E-Commerce Site
    ${usernames}    ${password}    Get Usernames and Password From Login Page

    FOR    ${usernames}    IN    @{usernames}
        Login to E-Commerce Site    ${usernames}    ${password}[0]
        Log    message
        
    END
    Log    message
