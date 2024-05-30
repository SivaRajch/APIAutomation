Feature: Launch Chrome browser

  Background:
    And def globalObj = {}
    * print karate.os.name
    * def getDriver =
              """
              function() {
                  if(karate.os.name == "Linux"){
                  return '{ type: \'chrome\', addOptions: ["--window-size=1920,1080","--remote-allow-origins=*"]}';
                  }
                  else {
                  return '{ type: \'chrome\', executable: "C:/Program Files/Google/Chrome/Application/chrome.exe", addOptions: ["--remote-allow-origins=*"] }';
                  }
               }
              """
    * json driver = getDriver()
    * configure driver = driver

  @LaunchBrowser
  Scenario: Launch Chrome browser
    Given driver baseUrl
    * driver.maximize()
    * driver.send({ method: 'Browser.setDownloadBehavior', params: { behavior: 'allow', downloadPath: karate.toAbsolutePath('file:./'+downloadPath) } })
    * globalObj.driver = driver

    * print ' ========= Url launched in Chrome ========= '

