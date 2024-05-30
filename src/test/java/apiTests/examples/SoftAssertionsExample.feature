Feature:  Soft Assertions Example

  Background:
    * configure continueOnStepFailure = true

  @SoftAssertions1
  Scenario: Soft Assertions Example 1

    * def testData = call read ('file:./src/test/resources/apiTests/sample.json')
    * def name = testData.name
    * print name
    * match name == 'frequenceTest'
    * match name == 'John'
    * match name contains 'Test'
    * match name !contains 'John'
    * print 'Soft Assertion Works'


  @SoftAssertions2
  Scenario: Soft Assertions Example 2
    * configure continueOnStepFailure = false

    * def testData = call read ('file:./src/test/resources/apiTests/sample.json')
    * def job = testData.job
    * print job
    * match job == 'automation'
    * match job == 'dev'
    * match job contains 'mation'
    * match job !contains 'John'
    * print 'Soft Assertion Works'
