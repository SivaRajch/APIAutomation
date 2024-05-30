Feature: New proposal creation

  Background: 
    * def resultLogin = call read('file:./src/test/java/UITests/ui/common/Login.feature@login')
    * def globalObj = resultLogin.globalObj

  @login
  Scenario: Create new proposal by logging in as sales user
    *	globalObj.Namee = 'Frequence'
    *	globalObj.ID = '12345'

    * def newVariable = 'newVariable'
    * globalObj.newVar = newVariable
    * print 'global=====> ',globalObj
    * def driver = globalObj.driver
    * driver.close()
