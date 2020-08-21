@api
Feature: Project content creation
  In order to have projects on the site
  As an editor
  I need to be able to create and see project items

  @javascript
  Scenario: Creation of a Project content through the UI.
    Given I am logged in as a user with the "create oe_project content, access content, edit own oe_project content, view published skos concept entities, manage corporate content entities" permission
    And the following images:
      | name          | file           | alt                |
      | Image 1       | example_1.jpeg | Alternative text 1 |
      | Image 2       | example_1.jpeg | Alternative text 2 |
      | Image 3       | example_1.jpeg | Alternative text 3 |
      | Contact image | example_1.jpeg | Alternative text 4 |
    And the following remote video:
      | url                                         |
      | https://www.youtube.com/watch?v=YaUGTOnf6k0 |

    # Create a document, to be referenced later on.
    And the following document:
      | name          | file       |
      | My Document 1 | sample.pdf |
      | My Document 2 | document.pdf |

    When I visit "the Project creation page"
    # Fill in mandatory fields.
    And I fill in "Title" with "My Project"
    And I fill in "Subject" with "EU financing"
    And I fill in "Author" with "European Patent Office"
    And I fill in "Body text" with "Body text"
    And I fill in "Teaser" with "Project teaser text" in the "Alternative titles and teaser" region
    And I fill in "Content owner" with "Committee on Agriculture and Rural Development"

    # Fill in Stakeholder fields by inline entity form for Coordinators field.
    And I fill in "Name" with "Coordinators stakeholder" in the "Project coordinators" region
    And I fill in "Acronym" with "Acronym of the Coordinator" in the "Project coordinators" region
    And I fill in "Use existing media" with "Image 1" in the "Project coordinators" region
    And I select "Belgium" from "Country" in the "Project coordinators" region
    And I wait for AJAX to finish
    And I fill in "Street address" with "Rue belliard 28" in the "Project coordinators" region
    And I fill in "Postal code" with "1000" in the "Project coordinators" region
    And I fill in "City" with "Brussels" in the "Project coordinators" region
    And I fill in "Website" with "https://ec.europa.eu/website" in the "Project coordinators" region
    And I fill in "Contact page URL" with "https://ec.europa.eu/contact" in the "Project coordinators" region

    # Fill in Stakeholder fields by inline entity form for Participants field.
    And I fill in "Name" with "Participants stakeholder" in the "Project participants" region
    And I fill in "Acronym" with "Acronym of the Participant" in the "Project participants" region
    And I fill in "Use existing media" with "Image 2" in the "Project participants" region
    And I select "Belgium" from "Country" in the "Project participants" region
    And I wait for AJAX to finish
    And I fill in "Street address" with "Rue belliard 28" in the "Project participants" region
    And I fill in "Postal code" with "1000" in the "Project participants" region
    And I fill in "City" with "Brussels" in the "Project participants" region
    And I fill in "Website" with "https://ec.europa.eu/website" in the "Project participants" region
    And I fill in "Contact page URL" with "https://ec.europa.eu/contact" in the "Project participants" region

    # Fill in optional fields.
    And I fill in "Summary" with "Summary text"
    And I fill in "Reference" with "Reference text"
    And I set "23-02-2019" as the "Start date" of "Project period"
    And I set "24-02-2019" as the "End date" of "Project period"
    And I fill in "Overall budget" with "1000" in the "Budget" region
    And I fill in "EU contribution" with "200" in the "Budget" region
    And I fill in "Funding programme" with "Anti Fraud Information System (AFIS) (http://publications.europa.eu/resource/authority/eu-programme/AFIS2020)"
    And I fill in "URL" with "http://project.website" in the "Project Website" region
    And I fill in "Link text" with "Website" in the "Project Website" region
    And I fill in "Media item" with "Image 3" in the "featured media form element"
    And I fill in "Caption" with "Here is my featured image text caption." in the "featured media form element"
    And I fill in "URL" with "http://example.com" in the "Call for proposals" region
    And I fill in "Link text" with "Example proposal" in the "Call for proposals" region
    And I fill in "Use existing media" with "My Document 2" in the "Project documents" region
    And I fill in "Results" with "Result 1 text" in the "Result" region
    And I fill in "Use existing media" with "My Document 1" in the "Result" region
    And I fill in "Alternative title" with "My alternative title text" in the "Alternative titles and teaser" region
    And I fill in "Navigation title" with "My navigation title text" in the "Alternative titles and teaser" region
    And I fill in "Departments" with "Audit Board of the European Communities"

    # Project contact field group.
    When I press "Add new contact"
    And I wait for AJAX to finish
    Then I fill in "Name" with "Name of the project contact" in the "Project contact" region
    And I fill in "Organisation" with "Project contact organisation" in the "Project contact" region
    And I fill in "Body text" with "Project contact body text" in the "Project contact" region
    And I fill in "Website" with "http://www.example.com/project_contact" in the "Project contact" region
    And I fill in "Email" with "project_contact@example.com" in the "Project contact" region
    And I fill in "Phone number" with "0488779033" in the "Project contact" region
    And I fill in "Mobile number" with "0488779034" in the "Project contact" region
    And I fill in "Fax number" with "0488779035" in the "Project contact" region
    And I select "Hungary" from "Country" in the "Project contact" region
    And I wait for AJAX to finish
    And I fill in "Street address" with "Project contact street" in the "Project contact" region
    And I fill in "Postal code" with "9000" in the "Project contact" region
    And I fill in "City" with "Budapest" in the "Project contact" region
    And I fill in "Office" with "Project contact office" in the "Project contact" region
    And I fill in "URL" with "mailto:project_contact_social@example.com" in the "Project contact social media links" region
    And I fill in "Link text" with "Project contact social link email" in the "Project contact social media links" region
    And I fill in "Media item" with "Contact image" in the "Project contact" region
    And I fill in "Caption" with "Project contact caption" in the "Project contact" region
    And I fill in "Press contacts" with "http://example.com/press_contacts" in the "Project contact" region

    When I press "Save"
    Then I should see "My Project"
    And I should not see "EU financing"
    And I should see "European Patent Office"
    And I should see "Body text"

    # Assert project coordinators field values.
    And I should see "Coordinators stakeholder" in the "Project coordinators" region
    And I should see "Acronym of the Coordinator" in the "Project coordinators" region
    And I should see "Logo" in the "Project coordinators" region
    And I should see "Belgium" in the "Project coordinators" region
    And I should see "Rue belliard 28" in the "Project coordinators" region
    And I should see "1000" in the "Project coordinators" region
    And I should see "Brussels" in the "Project coordinators" region
    And I should see "https://ec.europa.eu/website" in the "Project coordinators" region
    And I should see "https://ec.europa.eu/contact" in the "Project coordinators" region

    # Assert project participants field values.
    And I should see "Participants stakeholder" in the "Project participants" region
    And I should see "Acronym of the Participant" in the "Project participants" region
    And I should see "Logo" in the "Project participants" region
    And I should see "Belgium" in the "Project participants" region
    And I should see "Rue belliard 28" in the "Project participants" region
    And I should see "1000" in the "Project participants" region
    And I should see "Brussels" in the "Project participants" region
    And I should see "https://ec.europa.eu/website" in the "Project participants" region
    And I should see "https://ec.europa.eu/contact" in the "Project participants" region

    # Assert project field values.
    And I should see "Summary text"
    And I should see "Image 3" in the "featured media form element" region
    And I should see "Here is my featured image text caption." in the "featured media form element" region
    And I should see "Reference text"
    And I should see "2019-02-23"
    And I should see "2019-02-24"
    And I should see "1000"
    And I should see "200"
    And I should see "Anti Fraud Information System (AFIS)"
    And I should see "Website"
    And I should see "Example proposal"
    And I should see "Result 1 text"
    And I should see "document.pdf" in the "Project documents" region
    And I should see "sample.pdf" in the "Project result files" region
    And I should see "Audit Board of the European Communities"

    # Assert project contact values.
    And I should see the text "Name of the project contact"
    And I should see the text "Project contact body text"
    And I should see the text "Project contact organisation"
    And I should see the link "http://www.example.com/project_contact"
    And I should see the text "project_contact@example.com"
    And I should see the text "0488779033"
    And I should see the text "0488779034"
    And I should see the text "0488779035"
    And I should see the text "Project contact street"
    And I should see the text "Budapest"
    And I should see the text "9000"
    And I should see the text "Hungary"
    And I should see the link "Project contact social link email"
    And I should see the text "Project contact office"
    And I should see the link "Contact image"
    And I should see the text "Project contact caption"
    And I should see the link "http://example.com/press_contacts"
    # Test remote video for Featured media.
    When I click "Edit"
    Then I fill in "Media item" with "Plant health in the EU" in the "featured media form element"
    And I fill in "Caption" with "Here is my featured video text caption." in the "featured media form element"
    When I press "Save"
    Then I should see "Plant health in the EU" in the "featured media form element" region
    And I should see "Here is my featured video text caption." in the "featured media form element" region
