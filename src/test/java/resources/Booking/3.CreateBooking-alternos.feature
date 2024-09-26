@Booking
Feature: Crear booking

  @createBooking-caso2
  Scenario Outline: : Creacion de booking casos alternos
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Accept = 'application/json'
    * def bodyRequest = read('classpath:Request/createBooking.json')
    * bodyRequest.firstname = '<firstname>'
    * bodyRequest.lastname = '<lastname>'
    * bodyRequest.totalprice = <totalprice>
    * bodyRequest.depositpaid = <depositpaid>
    * bodyRequest.bookingdates.checkin = '<checkin>'
    * bodyRequest.bookingdates.checkout = '<checkout>'
    And request bodyRequest
    When method POST
    Then status 200
    * print 'Result ->', response
    And match response contains { bookingid: '#present' }
    And match response.booking.firstname == '<firstname>'
    And match response.booking.lastname == '<lastname>'
    And match response.booking.totalprice == <totalprice>
    And match response.booking.depositpaid == <depositpaid>
    And match response.booking.bookingdates.checkin == '<checkin>'
    And match response.booking.bookingdates.checkout == '<checkout>'
    Examples:
      | casos                    | firstname | lastname   | totalprice | depositpaid | checkin    | checkout   |
      | Nombre alfanumerico      | Johnny123 | Mallqui    | 150        | true        | 2024-01-01 | 2024-01-05 |
      | Apellido alfanumerico    | Johnny    | Mallqui123 | 150        | true        | 2024-01-01 | 2024-01-05 |
      | Precio total 0           | Johnny    | Mallqui    | 0          | true        | 2024-01-01 | 2024-01-05 |
      | checkout menor a checkin | Johnny    | Mallqui    | 150        | true        | 2024-01-01 | 2023-01-05 |