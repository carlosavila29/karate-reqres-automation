package api.reqres;

import com.intuit.karate.junit5.Karate;

class ReqresTests {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}