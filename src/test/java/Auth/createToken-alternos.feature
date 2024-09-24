@createToken
Feature: Creacion token

  @createToken-caso2
  Scenario Outline: Credenciales incorrectas en creacion de token
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { "username" : "<username>", "password" : "<password>" }
    When method POST
    Then status 200
    And match response.reason == 'Bad credentials'
    * print 'Result ->', response
    Examples:
      | username | password     |
      | adminn   | password123  |
      | admin    | password1234 |
      |          | password123  |
      | admin    |              |

  @createToken-caso3
  Scenario: Creacion de token con path incorrecto
    Given url 'https://restful-booker.herokuapp.com/auth1'
    And request { "username" : "admin", "password" : "password123" }
    When method POST
    Then status 404
    * print 'Result ->', response