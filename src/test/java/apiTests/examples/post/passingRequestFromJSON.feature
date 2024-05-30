Feature: Sample karate test script to use JSON file as request in POST call
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://reqres.in/'
    * def requestPayload = read("requestPayload.json")
#    * def requestPayload = read('classpath:./requestPayload.json')

  @sampleAPIs
  Scenario: Create an user with JSON request file
#    * header Authorization = "Basic b3BlcmF0aXZlX3N0YWdlOjNyWk5OYm9FbFcvQWhXWSs3VGJBSkZQalhtT0RRbUloN2JNV3g3RlVaS2s9"
    * header Content-Type = 'application/json'

    Given path 'api/users'
    And request requestPayload
    When method post
    Then status 201
    * print response
    * print 'New users id= ', response.id
    And match response.name == 'frequenceTestPayLoad'
    And match response.job == 'readJSON'
