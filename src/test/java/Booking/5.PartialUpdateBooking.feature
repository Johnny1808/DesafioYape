@PartialUpdateBooking
Feature: Actualizacion parcial booking

  @PartialUpdateBooking-caso1
  Scenario Outline: : Actualizacion parcial booking de nombre y apellido
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('3.CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    * def bodyRequest = read('classpath:Request/patchBooking.json')
    * bodyRequest.firstname = '<firstname>'
    * bodyRequest.lastname = '<lastname>'
    And request bodyRequest
    When method PATCH
    Then status 200
    * print 'Result ->', response
    And match response.firstname == '<firstname>'
    And match response.lastname == '<lastname>'
    Examples:
      | firstname | lastname |
      | Anny      | Huamani  |


  @PartialUpdateBooking-caso2
  Scenario Outline: : Actualizacion parcial booking de precio total y depositpaid
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('3.CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    And request { "totalprice" : <totalprice>, "depositpaid" : <depositpaid> }
    When method PATCH
    Then status 200
    * print 'Result ->', response
    Examples:
      | totalprice | depositpaid |
      | 111        | false       |


  @PartialUpdateBooking-caso3
  Scenario Outline: : Actualizacion parcial booking de checkin y checkout
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('3.CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    And request { "bookingdates" : { "checkin" : "<checkin>", "checkout" : "<checkout>" } }
    When method PATCH
    Then status 200
    * print 'Result ->', response
    Examples:
      | checkin    | checkout   |
      | 2025-01-01 | 2025-01-07 |