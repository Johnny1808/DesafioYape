@DeleteBooking
Feature: Eliminar Booking por ID

  @DeleteBooking-caso1
  Scenario: Eliminar booking creado con el endpoint CreateBooking
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    When method DELETE
    Then status 201
    And match response == 'Created'
    * print 'Result ->', response

  @DeleteBooking-caso2
  Scenario: Eliminar booking creado y validando con el endpoint getBooking
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    When method GET
    Then status 200
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    When method DELETE
    Then status 201
    And match response == 'Created'
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    When method GET
    Then status 404

  @DeleteBooking-caso3
  Scenario: Eliminar booking no existente
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    Given url 'https://restful-booker.herokuapp.com/booking/12345'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    When method DELETE
    Then status 405
    And match response == 'Method Not Allowed'
    * print 'Result ->', response