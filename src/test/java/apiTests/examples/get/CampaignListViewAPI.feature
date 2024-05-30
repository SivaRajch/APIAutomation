@sanity
Feature: Check Campaign Update Campaign List  View APi Response
  Background:
   @sampleAPIs
  Scenario: Execute view and assert fields
* header Content-Type = 'application/json'
#* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
  # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
* url 'https://demo-node.accushield.com'
* header Authorization = token
    Given path 'Campaign/listview/60665'
     And param limit = 25
     And param offset = 1
     And param order = "ASC"
     And param sort = "link"
     And param status = "active"
     And param campaign_ids = "349,318"
    When method get
    Then status 200
    * print response
     And match response.statusCode == 200