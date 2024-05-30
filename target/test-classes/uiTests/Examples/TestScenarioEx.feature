
Feature: Calling of scenarios from another feature file


Background:

@tag3
Scenario: Three
* print 'start---------'


@tag4
Scenario: Four
* print 'Fourth scenario'
   * def writeOrgId =
      """
      function(){
          				System.setProperty("karate.env", "0000000");
      }
      """
     * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(2000)

* print karate.env
* print karate.config.orgId 