Feature: Launch Chrome browser
  Background:
    And def globalObj = {}
    * print karate.os.name
    * def projectPath = karate.properties['user.dir']
    * def downloadPath = projectPath+"/" + downloadPath
    * if (karate.os.name.includes('indow')){downloadPath=downloadPath.replace("/null","").replaceAll("/","\\")}
    * def session = { capabilities: { alwaysMatch: { browserName: 'chrome', 'goog:chromeOptions': { args: [ 'window-size=1920,1080','--remote-allow-origins=*'] , 'prefs':{'plugins.always_open_pdf_externally':true, 'download.default_directory': '#(downloadPath)'} } } } }
    * def driver = { type: 'chromedriver',executable: '#(projectPath)/drivers/chromedriver', webDriverSession: 'session'}
    * def linuxDriver = projectPath+'/drivers/chromedriver'
    * def windowsDriver = projectPath+'/drivers/chromedriver.exe'
    * if(karate.os.name == "Linux"){ driver.executable = linuxDriver ;driver.webDriverSession = session } else{driver.executable = windowsDriver;driver.webDriverSession = session}
    * configure driver = driver
    * configure continueOnStepFailure = true


  @LaunchBrowser
  Scenario: Launch Chrome browser
    Given driver baseUrl
    * driver.maximize()
    * driver.timeout(180000)
    * globalObj.driver = driver
    * print ' ========= Url launched in Chrome ========= '
    * print driver.getOptions()