Feature: Probar los endpoints de la API de JSONPlaceholder

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Obtener todos los posts
    Given path '/posts'
    When method get
    Then status 200
    * match response == '#array'
    * match response != []

  Scenario: Obtener un solo post que existe
    Given path '/posts/1'
    When method get
    Then status 200
    * print response
    * match response.id == 1
    * match response.userId == 1
    * match response.title != null

  Scenario: Intentar obtener un post que NO existe
    Given path '/posts/9999'
    When method get
    Then status 404

  Scenario: Crear un nuevo post (POST)
    Given path '/posts'
    And request { title: 'foo', body: 'bar', userId: 1 }
    When method post
    Then status 201
    * print response
    * match response.title == 'foo'
    * match response.id == 101

  Scenario: Actualizar un post existente (PUT)
    Given path '/posts/1'
    And request { id: 1, title: 'foo updated', body: 'bar updated', userId: 1 }
    When method put
    Then status 200
    * print response
    * match response.title == 'foo updated'
    * match response.id == 1