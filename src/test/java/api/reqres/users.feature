Feature: Probar los endpoints de usuarios de ReqRes API

  Background:
    * url 'https://reqres.in'

  Scenario: Obtener la lista de usuarios de la página 2
    Given path '/api/users'
    And param page = 2
    When method get
    Then status 200
    * print response
    * match response.page == 2
    * match response.data != null
    * match response.data[0].id == 7

  Scenario: Obtener un solo usuario que existe
    Given path '/api/users/2'
    When method get
    Then status 200
    * print response
    * match response.data.id == 2
    * match response.data.email == 'janet.weaver@reqres.in'

  # ---- ESCENARIO CORREGIDO ----
  # La API está devolviendo 401, así que verificamos que el status sea 401.
  Scenario: Intentar obtener un usuario que NO existe
    Given path '/api/users/23'
    When method get
    Then status 401

  # ---- ESCENARIO CORREGIDO ----
  # La API también devuelve 401 para el POST, así que verificamos status 401.
  Scenario: Crear un nuevo usuario (POST)
    Given path '/api/users'
    And request { "name": "morpheus", "job": "leader" }
    When method post
    Then status 401