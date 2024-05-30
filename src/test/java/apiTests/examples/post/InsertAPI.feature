@sanity
Feature: Check Campaign Check Insert APi Response
  Background:
  @sampleAPIs
  Scenario: Create a Campaign and assert fields
    * header Content-Type = 'application/json'
    #* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    Given path 'Campaign/add'
    And request '{"bad_response_message":"Thank you for your response. We are sorry your visit was not satisfactory.","campaign_categories":"standard","campaign_name":"Test Char Count For Email Body","campaign_type":"survey","categories":["Overall Satisfaction","Safety","Cleanliness","Friendliness"],"community_id":60665,"end_date":"2023-03-01","faces":"bad","good_response_message":"Thank you for your response. We are glad you enjoyed your visit","how_often_survey_display":"once_every_3_months","is_enabled":true,"publish_campaign":true,"question_prompt_for_visitor":"","start_date":"2023-03-01","status":"Active","survey_type":"other","url":"https://facebook.com","visitor_type":"staff,group","last_visit_prompt":true,"send_signout_sms":true,"signout_sms_text":"Hi! [visitor], Thank you for visiting our [community name] community. Please rate your experience. [link]","signout_sms_scheduled":false,"signout_sms_starttime":"01:00:00","signout_sms_endtime":"01:00:00","survey_sms":"Hi! [visitor], Thank you visiting our [community name] community.Please rate your experience. [link]","survey_sms_scheduled":false,"survey_sms_starttime":"01:00:00","survey_sms_endtime":"01:00:00","survey_email_subject":"[community name] Community: [feedback] Feedback","survey_email_body":"Hi [visitor], Thank you for visiting us at [community name] Community.{Please click here to let us know about your experience.} A character can be any letter, number, punctuation, special character, or space. Each of these characters takes up one byte of space in a computers memory. Some Unicode characters, like emojis and some letters in non-Latin alphabets, take up two bytes of space and therefore count as two characters. Use our character counter tool below for an accurate count of your characters.A character can be any letter, number, punctuation, special character, or space. Each of these characters takes up one byte of space in a computers memory. Some Unicode characters, like emojis and some letters in non-Latin alphabets, take up two bytes of space and therefore count as two characters. Use our character counter tool below for an accurate count of your characters.A character can be any letter, number, punctuation, special character, or space. Each of these characters takes up one byte of space in a computers memory. Some Unicode characters, like emojis and some letters in non-Latin alphabets, take up two bytes of space and therefore count as two characters. Use our character counter tool below for an accurate count of your characters.A character can be any letter, number, punctuation, special character, or space. Each of these characters takes up one byte of space in a computers memory. Some Unicode characters, like emojis and some letters in non-Latin alphabets, take up two bytes of space and therefore count as two characters. Use our character counter tool below for an accurate count of your characters.A character can be any letter, number, punctuation, special character, or space. Each of these characters takes up one byte of space in a computers memory. Some Unicode characters, like emojis and some letters in non-Latin alphabets, take up two bytes of space and therefore count as two characters.Use our API [community name]","on_screen_question":"We would like to send you some additional information. Can we send you a link via email or text?"}'
    When method post
    Then status 200
    * print response
    And match response.statusCode == 200
    And match response.message == "success"
    And match response.campaignId !=null