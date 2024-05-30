Feature: Login with given user


  Background: 
    * url baseUrl
    * def token = {userEmail : '#(userEmail)', userPassword : '#(userPassword)'}
    * print 'Token in Login with given user feature:', token
    * header Content-Type = 'application/json'
		* def request1 =  '{"username":"'+token.userEmail+'","password":"'+token.userPassword+'","grantType":"password"}'
		
  @login
  Scenario: Login to Reachback
    Given path 'Auth/Login'
      And request request1
     When method post
     Then status 200
      And print 'responseee', response
    
      