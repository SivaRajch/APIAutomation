@sanity
Feature: Check Campaign Update Fetch Visitor Types APi Response
  Background:

  @sampleAPIs
  Scenario: Fetch Visitor Types APi and assert fields
    * header Content-Type = 'application/json'
    * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = inputData.token
    Given path 'Campaign/visitorTypes/60665'
    And param lang = "fr"
    When method get
    Then status 200
    * print response
    And match response.statusCode == 200