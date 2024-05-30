@sort
Feature: Check Campaign Sorting response(Statu Active with all Visitor Types)
  Background:

  @sampleAPIs
  Scenario: Execute Results view and assert fields(Statu Active with all Visitor Types)
    * header Content-Type = 'application/json'
   # * def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    Given path '/Campaign/listview/60665'
    And param limit = 25
    And param offset = 0
    And param order = "ASC"
    And param sort = "status"
    And param status = "ended"
    And param staff = "staff,guest,group"
    And param lang = "en"
    And param export = false
    And param search = ''

    When method get
    Then status 200
    * print response
    And match response.statusCode == 200
