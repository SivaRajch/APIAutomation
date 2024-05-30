@ignore
Feature: Login to Potal as sales user

  Background: 

  
  Scenario: Login to Potal as sales user
    * def globalObj = {}
    * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
    Given driver baseUrl
    * fullscreen()
    * java.lang.Thread.sleep(5000)
    * print ' ========= Portal lunached in Chrome ========= '
    * print baseUrl
    #	Read from Karate-config.js
    * print karate.env
    * print baseUrl
