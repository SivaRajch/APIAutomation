package performanceTests.Examples

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

// How to setup system for performance testing documentation can be found at
// https://frequencedev.atlassian.net/wiki/spaces/PRODUCT/pages/346947634/Setup+system+for+performance+testing+using+Karate

class firstTest extends Simulation{

  val test = scenario("firstTest").exec(karateFeature("classpath:apiTests/examples/get/listUsers.feature"))

  setUp(
    test.inject(rampUsers(10).during(10))
  )
}