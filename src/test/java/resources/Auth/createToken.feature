@createToken
Feature: Creacion token

  Scenario: Creacion de token correto
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { "username" : "admin", "password" : "password123" }
    When method POST
    Then status 200
    And match response contains { token: '#present' }
    * print 'Result ->', response
    * def accessToken = response.token
    * print 'Token guardado:', accessToken
