Feature: Browse list of artifact repositories

  Background:
    Given I am logged in as any role

  Scenario: As any authorized user, I want to be able to read all the artifact repositories so that I can understand what is going on in the company.

    When I list the existing artifact repositories
    Then I see the complete list
    And the Gold Standard repository is at the top of the list
    And the client-specific repositories appear sorted ascending by client name, descending by version

    Given I am viewing the list of artifact repositories
    When I select a repository from the list
    Then I see a list of the artifact sets contained in that repository

    Given I am viewing the list of artifact sets in a repository
    When I select an artifact
    Then I see the content of that artifact

Feature: Browse and search Gold Standard repository

  Background:
    Given the Gold Standard repository contains artifact sets
      | set1 | gold |
      | set2 | dev  |
      | set3 | gold |

  Scenario: As a Consultant, I want to see only the blessed Gold Standard artifact sets so that I can create a customized set for my client based on material that is ready to share

    Given I am logged in with role Consultant
    When I browse the Gold Standard repository 
    Then I see artifact sets
      | set1 | gold |
      | set3 | gold |
    
  Scenario: As an authorized Gold Standard content creator, I want to see all Gold Standard artifact sets so that I can maintain the repository

    Given I am logged in with role ContentCreator
    When I browse the Gold Standard repository
    Then I see artifact sets
      | set1 | gold |
      | set2 | dev  |
      | set3 | gold |

Feature: Select an artifact set from the Gold Standard repository

  Scenario: As any authorized user, I want to select an artifact set from the Gold Standard repository to use as the template for customization. This may be to create a customized set for a client, or to apply branding on a test basis. The list may have been filtered according to the user's role already.

    Given I am logged in with any role
    And I am viewing a list of artifact sets in the Gold Standard repository
    When I select one of the artifact sets from the list
    Then I can create a copy of the set

Feature: Select specific artifacts from an artifact set from the Gold Standard repository

    Given I am logged in with any role
    And I have selected an artifact set from the Gold Standard repository
    When I mark specific artifacts in that set
    Then the resulting copy contains only the marked artifacts from the original set 

Feature: List existing branding elements

  Background:
    Given the Gold Standard repository contains branding elements
      | foo1 | gold |
      | foo2 | dev  |
      | foo3 | dev  |

  Scenario: As an authorized MarketingSpecialist, I want to see all the Gold Standard branding elements so that I can keep our branding details up to date

    Given I am logged in with role MarketingSpecialist
    When I browse the Gold Standard repository 
    Then I see branding elements 
      | foo1 | gold |
      | foo2 | dev  |
      | foo3 | dev  |

  Scenario Outline : As a <role>, I want to see only the blessed Gold Standard branding elements so that I can understand what the branding looks like

    Given I am logged in with role <role>
    When I browse the Gold Standard repository
    Then I see branding element <element> with status <status>
    Examples:
      | role           | element | status |
      | ContentCreator | foo1    | gold   |
      | Consultant     | foo1    | gold   |


