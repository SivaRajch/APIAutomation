@sanity
Feature: Check Campaign Update Google Reviews APi Response
  Background:

  @sampleAPIs
  Scenario: Execute Campaign Update Google Reviews and assert fields
    * header Content-Type = 'application/json'
    * header Authorization = token
   # * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    Given path '/updateGoogleReviews/60665'
    When method get
    Then status 404
    * print response
    And match response.statusCode == 404
    And match response.message == "The end point you are looking for is not found or not available"
