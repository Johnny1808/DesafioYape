@GetBokingIds
Feature: Obtener el ID de todos los bookings

  @GetBokingIds-caso1
  Scenario: Consulta todos los booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method GET
    Then status 200
    * print 'Result ->', response

  @GetBokingIds-caso2
  Scenario: Consulta todos los booking con path incorrecto
    Given url 'https://restful-booker.herokuapp.com/bookingg'
    When method GET
    Then status 404
    * print 'Result ->', response