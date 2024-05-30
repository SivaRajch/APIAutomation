Feature: Sample karate test script to create an  user
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://reqres.in/'

  @sampleAPIs
  Scenario: Create an user and assert fields
#    * header Authorization = "Basic b3BlcmF0aXZlX3N0YWdlOjNyWk5OYm9FbFcvQWhXWSs3VGJBSkZQalhtT0RRbUloN2JNV3g3RlVaS2s9"
    * header Content-Type = 'application/json'

    Given path 'api/users'
    And request '{"name" :"frequenceTest", "job" :"automation"}'
    When method post
    Then status 201
    * print response
    * print 'New users id= ', response.id
    And match response.name == 'frequenceTest'
    And match response.job == 'automation'

    # assigning response tobe converted into JSON
    And json convertJSON = response
    * print convertJSON