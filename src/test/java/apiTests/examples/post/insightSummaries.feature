@sanity
Feature: Check Campaign Insight Summaries APi Response
  Background:


  @sampleAPIs
  Scenario: Create an user and assert fields

  #  * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
   # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    * header Content-Type = 'application/json'
    Given path 'Campaign/insightSummaries'
    And request '{"communityIds": [61272]}'
    When method post
    Then status 200
    * print response
    * print 'Count = ', response.count
    And match response.statusCode == 200
    And match response.message == "Success"
    And match response.ratingsEnabled == true


