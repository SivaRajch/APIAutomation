Feature: Test search using Karate

  Background: 

  @UI @StandardUser
  Scenario: Open browser and search for Frequence
    * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
    Given driver 'https://www.codegrepper.com/code-examples/html/html+dummy+input'
    * fullscreen()
    And input('#search', 'frequence')
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * eval sleep(3000)
      
    #  * java.lang.Thread.sleep(4000)
    
    * print '==========='
	  
	  * def json = "{\"campaignId\":\"123456789\", \"productName\":\"Spectrum\",\"role\":\"Admin\"}"
    * def filename = "./newFile.json"
    * def CreateJSONFile = Java.type('apiTests.Utilities.CreateJSONFile')
   # * def CreateJSONFile = Java.type('/src/test/java/apiTests/Utilities/CreateJSONFile')
    * def jsonResponse = new CreateJSONFile().write(json, filename)
    
    * print '=========== =========== ===========1234 '
    
    #	Read from Karate-config.js
    * def readKarate = Java.type('apiTests.Utilities/readKarateConfig')
    * def readResponse = new readKarate().read("karate.config.campaignId")
    * print readResponse
