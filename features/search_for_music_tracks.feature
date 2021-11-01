Feature: Search tracks for a specific music style

  Scenario: A listener requests a music style belonging to the music library

    Given a listener
    And the music library is composed of classical, funk, rock tracks
    When the listener requests tracks for the "funk" music style
    Then the listener gets the "funk" tracks

  Scenario: A premium listener requests a music style belonging to the music library

    Given a premium listener
    And the music library has previews for the classical style
    When the listener requests tracks for the "classical" music style
    Then the premium listener has access to "classical" previews

  Scenario: A listener requests a music style having previews

    Given a listener
    And the music library has previews for the classical style
    When the listener requests tracks for the "classical" music style
    Then the listener gets the "classical" tracks
    But there is no previews amongst the tracks