@sanity
Feature: Check Campaign Dates APi Response
  Background:

  @sampleAPIs
  Scenario: Execute CheckDates API and assert fields
   # * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    * header Content-Type = 'application/json'
    Given path 'Campaign/checkdates'
    And request '{"community_id": 60665,"end_date": "2025-08-17","start_date": "2023-08-16","visitor_type": "vendor","timezone": "Pacific/Honolulu","campaign_id": 0}'
    When method post
    Then status 200
    * print response
    And match response.statusCode == 200
    And match response.count == 1