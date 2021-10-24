Feature: Search tracks for a specific music style

  Scenario: A listener requests a music style belonging to the music library

    Given a listener
    And the music library is composed of classical, funk, rock tracks
    When the listener requests tracks for the "funk" music style
    Then the listener gets the "funk" tracks