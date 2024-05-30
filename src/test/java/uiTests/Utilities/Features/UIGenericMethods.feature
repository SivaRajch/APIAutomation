Feature: This file contains all the generic or re-usable methods which can use across the project
# you can implement re-usable methods in Java or JavaScript

  Background:

  Scenario: Re-usable or Generic methods

    # This mthod will return the greet message
    * def commonPageObjects = call read ('file:./src/test/java/uiTests/ObjectRepository/Common/commonPageObjects.json')

    # This mthod will return the current date with given format.
    # if you call "getCurrentDate('uuuu-MM-dd-HHmmss')" then it will return 2023-02-28-113055 (current date)
    * def getCurrentDate =
                 """
                 function(expectedFormat) {
                   var DateTimeFormatter = Java.type('java.time.format.DateTimeFormatter');
                   var dtf = DateTimeFormatter.ofPattern(expectedFormat);
                   var ldt = java.time.LocalDateTime.now();
                   return ldt.format(dtf);
                 }
                 """
    # This mthod will return the future date with given format by adding given days.
    # if you call pass days as +ve number you will get future date and if you pass -ve number you will get past date
    * def getFutureDate =
                """
                function(expectedFormat, days) {
                  var DateTimeFormatter = Java.type('java.time.format.DateTimeFormatter');
                  var dtf = DateTimeFormatter.ofPattern(expectedFormat);
                  var endDate = java.time.LocalDateTime.now().plusDays(days);
                  return endDate.format(dtf);
                }
                """
    # This mthod will return the date with given format by adding given days.
    # if you call pass days as +ve number you will get future date and if you pass -ve number you will get past date
    * def addDaysInDate =
        """
        function(expectedFormat, endDate, days) {
          var DateTimeFormatter = Java.type('java.time.format.DateTimeFormatter');
          var LocalDate = Java.type('java.time.LocalDate');
          var dtf = DateTimeFormatter.ofPattern(expectedFormat);
          var  date = LocalDate.parse(endDate, dtf);
          var updatedDate = dtf.format(date.plusDays(days))
          return updatedDate;
        }
        """

    * def verifyPageTitle = function(expectedTitle) { return driver.title == expectedTitle }

    * def waitForElement = function(locator, seconds) { driver.retry(2*seconds,500).waitForEnabled(locator) }

    * def waitForElementAndClick = function(locator, seconds) { driver.retry(2*seconds,500).waitForEnabled(locator).click() }

    * def moveToElementAndClick = function(locator, seconds) {  driver.retry(2*seconds,500).waitForEnabled(locator); driver.mouse().move(locator).click() }

    * def waitForPageLoad = function(seconds) {   driver.retry(2*seconds,500).waitUntil("!!window.jQuery && window.jQuery.active == 0 && document.readyState == 'complete'") }

    * def waitForInvisibilityOfBodyContentOverlay = function(seconds) { driver.retry(2*seconds,500).waitForResultCount(commonPageObjects.BODY_CONTENT_OVERLAY,0) }

    * def waitForInvisibilityOfSpinner = function(seconds) { driver.retry(2*seconds,500).waitForResultCount(commonPageObjects.BODY_CONTENT_OVERLAY_SPINNER_CSS,0) }

    * def waitForInvisibilityOfElement = function(locator, seconds) { driver.retry(2*seconds,500).waitForResultCount(locator,0) }

    * def enterText = function(locator, value) { driver.retry(60,500).waitForEnabled(locator); driver.input(locator,value) }

    * def getText = function(locator){driver.text(locator)}

    * def getValue = function(locator){driver.value(locator)}

    * def clearValue = function(locator) {driver.retry(60,500).waitForEnabled(locator); driver.clear(locator)}

    * def setValue = function(locator, value) { driver.retry(60,500).waitForEnabled(locator); driver.value(locator,value) }

    * def trimArray = function(arr){ return arr.map(function(element){return element.trim()}); }

    * def waitForInvisibilityOfSpinnerForFlight = function(seconds) { driver.retry(2*seconds,500).waitForResultCount(commonPageObjects.BODY_CONTENT_SPINNER_XPATH,0) }

    * def waitForInvisibilityOfSpinnerLoader = function(seconds) { driver.retry(2*seconds,500).waitForResultCount(commonPageObjects.LOADER_SPINNER_XPATH,0) }

    * def waitForAnalyticsLoaderInVisible = function(seconds) {  try {  driver.retry(seconds,500).waitForResultCount(commonPageObjects.ANALYTICS_PAGE_LOADER_CSS,0);  }  catch(err) {    driver.refresh();    driver.delay(5000);  driver.retry(seconds-10,500).waitForResultCount(commonPageObjects.ANALYTICS_PAGE_LOADER_CSS,0)  }  }

    * def moveToElement = function(locator, seconds) {  driver.retry(2*seconds,500).waitForEnabled(locator); driver.mouse().move(locator).go() }

    * def attachPDFToReport = function(pdfPath,fileName) { karate.embed('<a href="../' + pdfPath + '" target="_blank">Click here to OPEN the '+fileName+' pdf file</a>', 'text/html');  }

    * def generateRandomUUID = function generate_uuidv4() {  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,  function(c) {  var uuid = Math.random() * 16 | 0, v = c == 'x' ? uuid : (uuid & 0x3 | 0x8);  return uuid.toString(16);  });  }

    * def selectFlightDates = function selectDates(dateInString,element){const monthNames=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];let dateSplit=dateInString.split("-");let year=dateSplit[0];let month=dateSplit[1];let day=dateSplit[2].replace(/^0+/,'');let monthName;if(month>=1&&month<=12){monthName=monthNames[month-1]}driver.delay(2000);let yearElement=element.replace('value',year);driver.retry(2*20,500).waitForEnabled(yearElement);driver.mouse().move(yearElement).click();driver.delay(2000);let monthElement=element.replace('value',monthName.toUpperCase());driver.retry(2*20,500).waitForEnabled(monthElement);driver.mouse().move(monthElement).click();driver.delay(2000);let dayElement=element.replace('value',day);driver.retry(2*20,500).waitForEnabled(dayElement);driver.mouse().move(dayElement).click();driver.delay(2000)}