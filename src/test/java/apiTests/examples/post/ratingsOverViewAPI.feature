@sanity
Feature: Check Ratings Overview APi Response with Different Daterange
  Background:

  @sampleAPIs
  Scenario: Execute Rating OverView with Different Daterange and assert fields
    * header Content-Type = 'application/json'
    #* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    Given path 'Campaign/ratingsOverView'
    And param lang = "en"
    And request '{"community_id": 60665,"timezone": "America/New_York"}'
    When method post
    Then status 200
    * print response

    And match response.statusCode == 200