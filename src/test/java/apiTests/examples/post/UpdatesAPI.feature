@sanity
Feature: Check Campaign Updates APi Response
  Background:
     @sampleAPIs
  Scenario: Execute Updates APi and assert fields
        header Content-Type = 'application/json'
     #  * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
       # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
       * url 'https://demo-node.accushield.com'
       * header Authorization = token
    Given path 'Campaign/checkdates'
    And request '{"bad_response_message":"Thank you for your response. We are sorry your visit was not satisfactory.","campaign_categories":"standard","campaign_name":"Ratings ","campaign_type":"none","categories":["Overall Satisfaction","Safety","Cleanliness","Friendliness"],"community_id":60665,"end_date":"2023-06-30","faces":"","good_response_message":"Thank you for your response. We are glad you enjoyed your visit","how_often_survey_display":"everytime","is_enabled":true,"publish_campaign":true,"start_date":"2023-01-01","status":"Active","survey_type":"none","url":"","visitor_type":"staff,guest,group,vendor","id":1375,"last_visit_prompt":true,"send_signout_sms":true,"signout_sms_text":"Hi [visitor]! Thank you for visiting us at [community name] community. Please rate here. [link]","signout_sms_scheduled":false,"signout_sms_starttime":"01:00:00","signout_sms_endtime":"01:00:00","survey_sms":"","survey_sms_scheduled":false,"survey_sms_starttime":"","survey_sms_endtime":"","survey_email_subject":"","survey_email_body":"","on_screen_question":""}'
    When method post
    Then status 200
    * print response
    And match response.statusCode == 200