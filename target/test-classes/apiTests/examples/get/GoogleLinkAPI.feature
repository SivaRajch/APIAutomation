@sanity
Feature: Check Campaign Google Link APi Response
  Background:

  @sampleAPIs
  Scenario:Campaign Google Link and assert fields
    * header Content-Type = 'application/json'
  #  * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    Given path 'Campaign/surveyLink/60665'
    When method get
    Then status 200
    * print response
       And match response.statusCode == 404
    And match response.result == "The community address is incomplete"
