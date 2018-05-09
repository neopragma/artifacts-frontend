Feature: Create client-specific artifact set

  Background:
    Given I am logged in with role Consultant

  Scenario: As a Consultant, I want to create custom content that will be inserted into artifacts for my new client.

    Given I am viewing the list of available Custom Content elements
    When I select a Custom Content element
    Then I can create, edit, and save the element for later use

  Scenario: As a Consultant, I want to copy a Gold Standard artifact set and tailor it to my new client.

    Given I have selected a blessed artifact set from the Gold Standard repository
    And marked the artifacts from the set that I want included for my client
    When I select Copy 
    Then the system prompts me to enter the client name

    Given I have initiated the Copy procedure
    When I enter the client name
    Then the system creates a repository named after the client
    And the system copies the marked artifacts from the Gold Standard set

    Given the repository for the client has been created
    When I select Merge Custom Content
    Then the system merges the custom content I have created into the client's artifact set
    And the system applies the branding elements defined for the client

  Scenario: As a Consultant, I need the ability to update my client's artifact set.

    Given I select content from the client's artifact set for update
    When I make changes to the content
    Then I can save the changes to the client's repository as a new version
    