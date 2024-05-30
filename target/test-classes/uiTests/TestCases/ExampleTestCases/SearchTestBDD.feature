Feature: Test search using Karate

  Background: 

  @UI @StandardUser
  Scenario: Open browser and search for Frequence
    Given user has opened url in browser
    And user has typed 'frequence' in the search box
    Then anything 
    
