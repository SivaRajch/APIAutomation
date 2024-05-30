@ignore
Feature: Login to Reachback

  Background: 
    * url baseUrl
    * header Content-Type = 'application/json'

  @login
  Scenario: Login to Reachback
    Given path 'Auth/Login'
      And request requestBody
     When method post
     Then status 200
      And print 'responseee', response
      * print userId 
      And karate.config.userId = "test"
      * print userId 
#* def deactivateUser = call read('file:/TestScenario.feature@tag4') newUser.globalObj