@ignore
Feature: Calling of scenarios from another feature file

  Background: 

  @tag3
  Scenario: Three
    * print 'start---------'

  @tag4
  Scenario: Four
    * print 'Fourth scenario'

    * def readKarate = Java.type('karateTests/Utilities.readKarateConfig')
    * def writeResponse = new readKarate().write("karate.config.orgId", "oooo")
    * print writeResponse

    * def readResponse = new readKarate().read("karate.config.orgId")
    * print readResponse
