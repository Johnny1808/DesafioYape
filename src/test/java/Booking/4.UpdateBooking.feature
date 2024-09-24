@UpdateBooking
Feature: Actualizar booking

  @UpdateBooking-caso1
  Scenario Outline: : Actualizar booking
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('3.CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    * def bodyRequest = read('classpath:Request/createBooking.json')
    * bodyRequest.firstname = '<firstname>'
    * bodyRequest.lastname = '<lastname>'
    * bodyRequest.totalprice = <totalprice>
    * bodyRequest.depositpaid = <depositpaid>
    * bodyRequest.bookingdates.checkin = '<checkin>'
    * bodyRequest.bookingdates.checkout = '<checkout>'
    * bodyRequest.additionalneeds = '<additionalneeds>'
    And request bodyRequest
    When method PUT
    Then status 200
    * print 'Result ->', response
    And match response.firstname == '<firstname>'
    And match response.lastname == '<lastname>'
    And match response.totalprice == <totalprice>
    And match response.depositpaid == <depositpaid>
    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | John      | Moreno   | 130        | true        | 2024-01-01 | 2024-01-05 | Breakfast2      |


  @UpdateBooking-caso2
  Scenario Outline: : Actualizar booking casos alternos
    * def result = call read('classpath:Auth/CreateToken.feature')
    * def accessToken = result.accessToken
    * def result = call read('3.CreateBooking.feature')
    * def bookingid = result.bookingid
    Given url 'https://restful-booker.herokuapp.com/booking/' + bookingid
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=' + accessToken
    * def bodyRequest = read('classpath:Request/createBooking.json')
    * bodyRequest.firstname = '<firstname>'
    * bodyRequest.lastname = '<lastname>'
    * bodyRequest.totalprice = <totalprice>
    * bodyRequest.depositpaid = <depositpaid>
    * bodyRequest.bookingdates.checkin = '<checkin>'
    * bodyRequest.bookingdates.checkout = '<checkout>'
    * bodyRequest.additionalneeds = '<additionalneeds>'
    And request bodyRequest
    When method PUT
    Then status 200
    * print 'Result ->', response
    And match response.firstname == '<firstname>'
    And match response.lastname == '<lastname>'
    And match response.totalprice == <totalprice>
    And match response.depositpaid == <depositpaid>
    And match response.bookingdates.checkin == '<checkin>'
    And match response.bookingdates.checkout == '<checkout>'
    And match response.additionalneeds == '<additionalneeds>'
    Examples:
      | casos                    | firstname | lastname   | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | Nombre alfanumerico      | Johnny123 | Mallqui    | 150        | true        | 2024-01-01 | 2024-01-05 | Breakfast2b     |
      | Apellido alfanumerico    | Johnny    | Mallqui123 | 150        | true        | 2024-01-01 | 2024-01-05 | Breakfast2b     |
      | Precio total 0           | Johnny    | Mallqui    | 0          | true        | 2024-01-01 | 2024-01-05 | Breakfast2b     |
      | checkout menor a checkin | Johnny    | Mallqui    | 150        | true        | 2024-01-01 | 2023-01-05 | Breakfast2b     |