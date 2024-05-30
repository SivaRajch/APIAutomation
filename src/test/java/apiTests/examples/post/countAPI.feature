@sanity
Feature: Check Campaign Count APi Response
  Background:

  @sampleAPIs
  Scenario: Execute Count API and and assert fields
    #* def inputData = karate.call('file:./src/test/java/apiTests/TestCases/getSigninToken.feature@signin')
    # * karate.call('file:./src/test/java/apiTests/TestCases/listAPI.feature@listapi')
    * url 'https://demo-node.accushield.com'
    * header Authorization = token
    * header Content-Type = 'application/json'
    Given path '/CampaignResultsPage/exportCampaignReportListCount'
    And request '{"community_id":"60862","start_date":"2022-11-04","end_date":"2022-11-05","campaign_id":584,"communityTimeZone":"America/New_York"}'
    When method post
    Then status 200
    * print response
    * print 'Count = ', response.count
      And match response.statusCode == 200
    And match response.dataSize == 0