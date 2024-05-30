Feature: Check Campaign Check Dates APi Response
  Background:

  @signin
  Scenario: Create an user and assert fields
    * url 'https://sso-qa-server.accushield.com'
    #    * header Authorization = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbmNyeXB0ZWRQYXlsb2FkIjoiai9PbHRXTDVyeitNN1RmcTNtb05IbWl4VUp4cjhIVmZoWXhXMkd0VWk4L3lNSjU2Q1dQRnRPL21YTFN0Zkc5K3dEMXgyeU1SQk01UnhGTlYyQStJQllQczFxWmZkUE1QUVRvSzVybnJLWitUUFR1WUt0OU9HblR0YWJiUEd0MXU1ZjJTNWsvK1FiUGRZZE5WOXFQSlFSYVIzSmV6SFVZMTZmcVMyb3BzRVBocGc1bEhnbmFmdUxjVjAvVUJXSnZJaHJpLzF2SW1yOG01QzJrK3MzblU5NlZwWUdDZ2NJb3lsaURhTzRrMDdGbTdrbkFqbW5YcFE1SnBmblU1clo1ZGpDVHEycXdCOFUvUXZhR2J1OTU3clljUGMvS3ErRlFXVjR6Y2g2alNoV2t4TGcxcUNVLzU1aWwzaU90eXFnb1kvelFCOUEreDVkaEs4WUVXZVo4N3dMeFRhcFp3QU81K0pzMkhkZkZ6QWZaTnd0Y1VDcFhILzV1bDFjWmgwL1UrYTA4UERxYkRHejJOVGExTVI0QUc2dz09IiwiaWF0IjoxNzE2MTg1MTIwLCJleHAiOjE3MTYxOTk1MjB9.gJ5CliDDIXvQOZJpGigjR5t1UN_Bx7T59u-vOebduOY"
    * header Content-Type = 'application/json'
    Given path '/auth/sign-in'
    And request '{"email":"kumar@yopmail.com","password":"77nSSENudi7kd5ug1gQxHV5g+iT4CqW5HOB739Ib4Pk=","ip":null,"remember_me":false}'
    When method post
    Then status 200
    * print response
    * def token = "Bearer "+response.data.Token
    * print 'Token is = ', response.data.Token