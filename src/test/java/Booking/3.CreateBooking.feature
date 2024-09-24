@createBooking
Feature: Crear booking

  @createBooking-caso1
  Scenario Outline: : Creacion de booking
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Accept = 'application/json'
    * def bodyRequest = read('classpath:Request/createBooking.json')
    * bodyRequest.firstname = '<firstname>'
    * bodyRequest.lastname = '<lastname>'
    * bodyRequest.totalprice = <totalprice>
    * bodyRequest.depositpaid = <depositpaid>
    And request bodyRequest
    When method POST
    Then status 200
    * print 'Result ->', response
    * def bookingid = response.bookingid
    * print 'ID guardado:', bookingid
    And match response contains { bookingid: '#present' }
    And match response.booking.firstname == '<firstname>'
    And match response.booking.lastname == '<lastname>'
    And match response.booking.totalprice == <totalprice>
    And match response.booking.depositpaid == <depositpaid>
    Examples:
      | firstname | lastname | totalprice | depositpaid |
      | Johnny    | Mallqui  | 150        | true        |
