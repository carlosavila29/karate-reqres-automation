package api.reqres;

import com.intuit.karate.junit5.Karate;

class ReqresRunner {

    @Karate.Test
    Karate testAll() {
        // Busca archivos .feature en la misma ruta del paquete
        // y los ejecuta en paralelo por defecto.
        return Karate.run().relativeTo(getClass());
    }
}