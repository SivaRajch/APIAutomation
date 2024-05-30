package preformanceTests.Example
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._
class UserTest extends  Simulation{
  val protocol = karateProtocol(
    "/cats/{id}" -> Nil,
    "/cats" -> Nil
  )
  //val scn = scenario("weScoket").exec(karateFeature("classpath:uiTests/TestCases/Orders/WebSocketTest.feature"))
  val scn = scenario("weScoket").exec(karateFeature("classpath:src/test/java/apiTests/examples/get/listUsers.feature"))

  //val scn = scenario("weScoket").exec(karateFeature("classpath:apiTests/TestCases/IntegrationsCreative.feature"))
  val nbUsers = Integer.getInteger("users", 1)
  val myRamp = java.lang.Long.getLong("ramp", 20)
  // setUp(scn.inject(rampUsers(nbUsers).during(myRamp)))
  setUp(
    scn.inject(rampUsers(nbUsers) during (myRamp)).protocols(protocol)
  )
}