@sanity
Feature: Check Campaign Gogle  fetch reviws APi Response
  Background:

  @sampleAPIs
  Scenario:Campaign Gogle  fetch and assert fields
    * header Content-Type = 'application/json'
    * header Authorization = token
    #* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    Given path '/Campaign/fetchReviews/60665'
    And param page = "1"
    When method get
    Then status 200
    * print response
    And match response.statusCode == 500
    And match response.message == "No Place Id/ Invalid Place id provided"
