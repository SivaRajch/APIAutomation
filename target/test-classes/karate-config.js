function fn() {
    var config = {
        baseUrl: 'https://google.com/',

        username: 'automation_tester@xxx.com',
        password: 'xxx',
        tempCookie: '_ga=GA1.2.555595317.1661255089;vl_dev_session=SESSION;',
        access_token: 'Test',
        token:'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbmNyeXB0ZWRQYXlsb2FkIjoiai9PbHRXTDVyeitNN1RmcTNtb05IbWl4VUp4cjhIVmZoWXhXMkd0VWk4L3lNSjU2Q1dQRnRPL21YTFN0Zkc5K3dEMXgyeU1SQk01UnhGTlYyQStJQllQczFxWmZkUE1QUVRvSzVybnJLWitUUFR1WUt0OU9HblR0YWJiUEd0MXU1ZjJTNWsvK1FiUGRZZE5WOXFQSlFSYVIzSmV6SFVZMTZmcVMyb3BzRVBocGc1bEhnbmFmdUxjVjAvVUJXSnZJaHJpLzF2SW1yOG01QzJrK3MzblU5NlZwWUdDZ2NJb3lsaURhTzRrMDdGbTdrbkFqbW5YcFE1SnBmblU1clo1ZGpDVHEycXdCOFUvUXZhR2J1OTU3clljUGMvS3ErRlFXVjR6Y2g2alNoV2t4TGcxcUNVLzU1aWwzaU90eXFnb1kvelFCOUEreDVkaEs4WUVXZVo4N3dLS3kwbEtaOFRIdkM3bXBveUNqcFh0Tnd0Y1VDcFhILzV1bDFjWmgwL1UrYTA4UERxYkRHejJOVGExTVI0QUc2dz09IiwiaWF0IjoxNzE2OTYxMjMwLCJleHAiOjE3MTY5NzU2MzB9.ZWIbG3Fxy1lgfCGTmz5pqyNIyIF21JMITsjttD8koCk',
        downloadPath:"src/test/resources/downloads",
            };

    var env = karate.env;
    var user = karate.user;
    karate.log('Env is: ', env);
    config.targetDir = karate.properties['targetdir']
    config.random_string = function(s) {  var text = "";   var possible = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";   for (var i = 0; i < s; i++)     text += possible.charAt(Math.floor(Math.random() * possible.length));   return text; }
    config.afterScenario = function() { if(karate.info.errorMessage){driver.screenshot(true); driver.quit(); } }
    if (env == 'qa') {
    karate.log('Running scripts on QA environment');
    config.password = 'xxxxxxxxxx';
           config.baseUrl = 'https://qa.xxxxxxx.com/';

    }
    if (env == 'dev') {
    karate.log('Running scripts on DEV environment');
    config.password = 'xxxxxxxxxxx';
      config.baseUrl = 'https://dev.xxxxxxx.com/';

    }
    if (env == 'stage') {
    karate.log('Running scripts on STAGE environment');
    config.password = 'xxxxxxx';
          config.baseUrl = 'https://stage.xxxxxxxxx.com/';


    }
    if (env == 'uat') {

    }
    if (env == 'production') {
    karate.log('Running scripts on PROD environment');
        config.password = 'xxxxxx';

      config.baseUrl = 'https://xxxxxxxxx.com/';

    }
    return config;
}