@Ping
Feature: Validar si el API está funcionando

  Scenario: Confirmar si la API está en funcionamiento
    Given url 'https://restful-booker.herokuapp.com/ping'
    When method GET
    Then status 201
    And match response == 'Created'
    * print 'Result ->', response

  Scenario: Realizando ping a path incorrecto
    Given url 'https://restful-booker.herokuapp.com/ping123'
    When method GET
    Then status 404
    And match response == 'Not Found'
    * print 'Result ->', response