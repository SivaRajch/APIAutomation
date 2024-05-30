@sort
Feature: Check Campaign Google Link APi Response
  Background:

  @sampleAPIs
  Scenario: Execute Results view and assert fields
    * header Content-Type = 'application/json'
    #* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    Given path '/Campaign/listview/60665'
    And param limit = 25
    And param offset = 0
    And param order = "ASC"
    And param sort = "status"
    And param status = "active"
    And param staff = "staff"
    And param search = ''

    When method get
    Then status 200
    * print response
    And match response.statusCode == 200
