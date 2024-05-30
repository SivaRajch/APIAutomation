Feature: Check Publish APi Response
  Background:

  @sampleAPIs
  Scenario: Punlish API and assert fields
    * header Content-Type = 'application/json'
    * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = inputData.token
    Given path '/Campaigns/publish/60665'
    And request '{"is_enabled": false,"id": 1536}'
    When method post
    * print response
    Then status 200
    And match response.statusCode == 200