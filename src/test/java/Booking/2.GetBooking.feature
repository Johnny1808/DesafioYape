@getBooking
Feature: Obtener informacion del booking por ID

  @getBooking-caso1
  Scenario: Obtener la informacion del booking creado
    * def result = call read('CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response contains { firstname: '#present' }
    And match response contains { lastname: '#present' }
    And match response contains { totalprice: '#present' }
    * print 'Result ->', response


  @getBooking-caso2
  Scenario Outline: Consultas erroneas de bookings no existentes
    Given url 'https://restful-booker.herokuapp.com/booking/<bookingid>'
    And header Accept = 'application/json'
    When method GET
    Then status 404
    * print 'Result ->', response
    Examples:
      | bookingid |
      | 9999      |
      | xx        |