@sanity
Feature: Check Campaign Exort csv Response with ASC Order
Background:

@sampleAPIs
Scenario: Execute Campaign Exort ASC Order and assert fields
* header Content-Type = 'application/json'
#* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
#* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
  # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
* url 'https://demo-node.accushield.com'
* header Authorization = token
Given path '/Campaign/export/60665/1542'
  And param sort = "date"
  And param order = "ASC"
  And param lang = "en"
When method get
Then status 200
* print response
And match response.statusCode == 200
  #And match response.message == "Invalid campaign ID provided"