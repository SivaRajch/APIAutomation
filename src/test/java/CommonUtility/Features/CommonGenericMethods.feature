Feature: This file contains all the generic or re-usable methods which can use across the project
# you can implement re-usable methods in Java or JavaScript

  Background:

  Scenario: common re-usable or Generic feature methods

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
    # This method will return the future date with given format by adding given days.
    # if you call pass year, month and days as +ve number you will get future date and if you pass -ve number you will get past date

    * def getFutureDate =
                """
                function(expectedFormat, years, months,days) {
                  var DateTimeFormatter = Java.type('java.time.format.DateTimeFormatter');
                  var dtf = DateTimeFormatter.ofPattern(expectedFormat);
                  var endDate = java.time.LocalDateTime.now().plusYears(years).plusMonths(months).plusDays(days);;
                  return endDate.format(dtf);
                }
                """
    # This function will return a random string name.
    # If you call this function and pass length, you will get a random string.
    * def getRandomString =
                """
                function(length) {
                  var result = "";
                  var pattern = "ABCDEFGHIKLMNOPQRSTVXYZabcdefghijklmnopqrstuvwxyz";
                  for(var i=0;i<length;i++)
                  result += pattern.charAt(Math.floor(Math.random() * pattern.length()));
                  return result;
                }
                """
  # This method will convert string in (yyyy-mm-dd) format to MM/dd/yyyy format. parameter required date in string with yyyy-mm-dd

    * def getDateFromString =
        """
            function convertAndFormatDate(dateString) {
                const dateParts = dateString.split('-');
                const year = parseInt(dateParts[0]);
                const month = parseInt(dateParts[1]) - 1;
                const day = parseInt(dateParts[2]);
                const date = new Date(year, month, day);
                var dateString = new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString().split("T")[0];
                const outputFormat = 'MM/DD/YYYY';
                const year2 = date.getFullYear();
                const month2 = String(date.getMonth() + 1).padStart(2, '0');
                const day2 = String(date.getDate()).padStart(2, '0');
                const formattedDate2 = outputFormat.replace('YYYY', year2).replace('MM', month2).replace('DD', day2);
                return formattedDate2;
            }
        """
  # This method will add days to any date.
    * def getAnyDate =
          """
              function addDaysInAnyDate(dateInput, days) {
                  var inputDateFormat = new Date(dateInput);
                  var dateFormatTotime = new Date(inputDateFormat);
                  var modifiedDate = new Date(dateFormatTotime.getTime() + (days * 86400000));
                  let modifiedDateString = modifiedDate.toString();
                  var date = new Date(modifiedDateString);
                  var dateString = new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString().split("T")[0];
                  return dateString;
              }
          """

    # Replace All Occurrences of string
    * def replaceAll = function(str, search, replacement) { var modifiedString = str; while (modifiedString.indexOf(search) !== -1) { modifiedString = modifiedString.replace(search, replacement); } return modifiedString; }

    # convert string to array
    * def stringToIntArray = function (x) { var stringArray = x; var numberArray = stringArray.map(Number); karate.log(numberArray); return numberArray }

    * def  getcountOccurrences =
            """
               function countOccurrences(inputString, characterToCount) {
                  var count = 0;
                  for (var i = 0; i < inputString.length; i++) {
                    if (inputString.charAt(i) === characterToCount) {
                      count++;
                    }
                  }
                return count;
              }
            """

  # This method will return the last day of any month in yyyy-MM-dd format. pass the no of month as parameter to get last day of that month.
    # If you want current months last day then pass 0, for future months pass number as greater than 0 and for past months pass number with -ve sign like -1
    * def getLastDayOfTheMonth =
        """
            function lastDayOfMonth(noOfPlusMonths) {
              var currentDate = new Date();
              var futureDate = new Date(currentDate);
              futureDate.setMonth(currentDate.getMonth() + noOfPlusMonths);
              futureDate.setDate(0);
              var futureYear = futureDate.getFullYear();
              var futureMonth = futureDate.getMonth() + 1;
              var lastDayOfMonth = futureDate.getDate();
              if(futureMonth<10)
              {
                  futureMonth='0'+futureMonth;
              }
                    if(lastDayOfMonth<10)
              {
                  lastDayOfMonth='0'+lastDayOfMonth;
              }
              var requiredDate = futureYear + '-'+futureMonth+'-'+lastDayOfMonth;
               return requiredDate;
            }
        """

    * def getFlightEndDateAsPerStartDate =
        """
            function flightEndDate(flightStartDate, noOfPlusMonths) {
            var startDate = new Date(flightStartDate);
              startDate.setMonth(startDate.getMonth() + noOfPlusMonths);
              startDate.setDate(0);
              var futureYear = startDate.getFullYear();
              var futureMonth = startDate.getMonth() + 1;
              var lastDayOfMonth = startDate.getDate();
              if(futureMonth<10)
              {
                  futureMonth='0'+futureMonth;
              }
                    if(lastDayOfMonth<10)
              {
                  lastDayOfMonth='0'+lastDayOfMonth;
              }
              var requiredDate = futureYear + '-'+futureMonth+'-'+lastDayOfMonth;
               return requiredDate;
            }
        """