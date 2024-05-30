
Feature: t

  Background: 
    * def resultLogin = call read('file:./src/test/java/UITests/ui/common/Login.feature@login')
    * def globalObj = resultLogin.globalObj

  @AdPortal @SmokeTest
  Scenario: Smoke test for search
    *	globalObj.Namee = 'Frequence'
		*	globalObj.ID = '12345'

    * def newVariable = 'newVariable'
    * globalObj.newVar = newVariable
    * print 'global=====> ',globalObj

  #  * def testCall = call read('file:./src/test/java/karateTests/apis/file.feature@TagName') globalObj
    * print 'global=====> ',globalObj

  #  * def callSearch = call read('file:Fea.feature@Tag1') globalObj



