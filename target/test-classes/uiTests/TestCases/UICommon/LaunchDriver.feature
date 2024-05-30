Feature: Launch Chrome browser
  Background:
    And def globalObj = {}
    * print karate.os.name
    * def projectPath = karate.properties['user.dir']
    * def downloadPath = projectPath+"/" + downloadPath
    * def session = { capabilities: { alwaysMatch: { browserName: 'chrome', 'goog:chromeOptions': { args: [ 'window-size=1920,1080','--remote-allow-origins=*'] , 'prefs':{'plugins.always_open_pdf_externally':true, 'download.default_directory': '#(downloadPath)'} } } } }
    * def driver = { type: 'chromedriver',executable: '#(projectPath)/drivers/chromedriver', webDriverSession: 'session'}
    * def linuxDriver = projectPath+'/drivers/chromedriver'
    * def windowsDriver = projectPath+'/drivers/chromedriver.exe'
    * if(karate.os.name == "Linux"){ driver.executable = linuxDriver ;driver.webDriverSession = session } else{driver.executable = windowsDriver;driver.webDriverSession = session}
#    * print driver
    * configure driver = driver

  @LaunchBrowser
  Scenario: Launch Chrome browser
    Given driver baseUrl
    * driver.maximize()
    * globalObj.driver = driver
    * print ' ========= Url launched in Chrome ========= '
    * print driver.getOptions()