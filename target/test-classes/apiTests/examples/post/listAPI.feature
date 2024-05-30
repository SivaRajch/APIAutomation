@sanity
Feature: Check Campaign List APi Response
  Background:
  @listapi
  Scenario: Check Campaign Check List and assert fields
    * configure report = false
    * header Content-Type = 'application/json'
    #* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    Given path '/Campaign/listReport'
    And request '{"start": 0,"community_id": 60665,"communityTimeZone": "America/New_York"}'
    When method post
    Then status 200
    * print response
    And match response.statusCode == 200
    #And match response.datalenth ==31

