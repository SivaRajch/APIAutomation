@sanity
Feature: Check Campaign SearchByID APi Response
  Background:
    * url 'https://demo-node.accushield.com'

  @sampleAPIs
  Scenario: Create an user and assert fields
    * header Content-Type = 'application/json'
   # * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token

    Given path 'Campaign/searchById/436'
    When method get
    Then status 200
    * print response

    And match response.statusCode == 200