@api @event
  Feature: context API testing feature.
    Test entity aware hooks in context classes.

    @javascript
    Scenario: Test EventContentContext where BeforeParseEntityFields alterations are done.
      Given I am logged in as a user with the "edit any oe_event content, access content, view published skos concept entities, manage corporate content entities" permission
      And the following image:
        | name              | file            |
        | Image placeholder | example_1.jpeg  |
      And the following Event Content entity:
        | Title                   | My event                                                      |
        | Type                    | Exhibitions                                                   |
        | Introduction            | Short intro                                                   |
        | Description summary     | Event description summary                                     |
        | Description             | Event description                                             |
        | Featured media          | Image placeholder                                             |
        | Featured media legend   | Event media legend                                            |
        | Summary for report      | Event summary for report                                      |
        | Report text             | Report text                                                   |
        | Registration start date | 2020-03-01 12:30:00                                           |
        | Registration end date   | 2020-03-10 18:30:00                                           |
        | Start date              | 2020-06-15 12:30:00                                           |
        | End date                | 2020-06-20 18:30:00                                           |
        | Registration URL        | http://example.com                                            |
        | Registration capacity   | Event capacity                                                |
        | Entrance fee            | 1234                                                          |
        | Online type             | facebook                                                      |
        | Online time start       | 2019-02-21 09:15:00                                           |
        | Online time end         | 2019-02-21 14:00:00                                           |
        | Online description      | Event online description                                      |
        | Online link             | uri: http://ec.europa.eu/info - title: Info site              |
        | Languages               | Valencian                                                     |
        | Organiser is internal   | Yes                                                           |
        | Internal organiser      | Directorate-General for Informatics                           |
        | Status                  | as_planned                                                    |
        | Event website           | uri: https://ec.europa.eu/inea/ - title: INEA                 |
        | Social media links      | uri: http://example.com - title: Twitter - link_type: twitter |

      When I visit node "My event" edit page
      Then I should see the text "My event"
      And I should see the text "Exhibitions"
      And I should see the text "Short intro"
      And I should see the text "Event description summary"
      And I should see the text "Event description"
      And the "Featured media legend" field should contain "Event media legend"
      And I press "Event report"
      And I should see the text "Event summary for report"
      And I should see the text "Report text"
      And I press "Registration"
      And I should see the text "http://example.com"
      And the "Registration capacity" field should contain "Event capacity"
      And the "Entrance fee" field should contain "1234"
      And I should see the text "Facebook"
      And the "oe_event_registration_dates[0][value][day]" field should contain "1"
      And the "oe_event_registration_dates[0][value][month]" field should contain "3"
      And the "oe_event_registration_dates[0][value][year]" field should contain "2020"
      And the "oe_event_registration_dates[0][value][hour]" field should contain "12"
      And the "oe_event_registration_dates[0][value][minute]" field should contain "30"
      And the "oe_event_registration_dates[0][end_value][day]" field should contain "10"
      And the "oe_event_registration_dates[0][end_value][month]" field should contain "3"
      And the "oe_event_registration_dates[0][end_value][year]" field should contain "2020"
      And the "oe_event_registration_dates[0][end_value][hour]" field should contain "18"
      And the "oe_event_registration_dates[0][end_value][minute]" field should contain "30"
      And I press "Online"
      And the "Online description" field should contain "Event online description"
      And the "oe_event_online_dates[0][value][day]" field should contain "21"
      And the "oe_event_online_dates[0][value][month]" field should contain "2"
      And the "oe_event_online_dates[0][value][year]" field should contain "2019"
      And the "oe_event_online_dates[0][value][hour]" field should contain "9"
      And the "oe_event_online_dates[0][value][minute]" field should contain "15"
      And the "oe_event_online_dates[0][end_value][day]" field should contain "21"
      And the "oe_event_online_dates[0][end_value][month]" field should contain "2"
      And the "oe_event_online_dates[0][end_value][year]" field should contain "2019"
      And the "oe_event_online_dates[0][end_value][hour]" field should contain "14"
      And the "oe_event_online_dates[0][end_value][minute]" field should contain "0"
      And the "oe_event_online_link[0][title]" field should contain "Info site"
      And the "oe_event_online_link[0][uri]" field should contain "http://ec.europa.eu/info"
      And the "oe_event_languages[0][target_id]" field should contain "Valencian (http://publications.europa.eu/resource/authority/language/0D0)"
      And the "Internal organiser" field should contain "Directorate-General for Informatics (http://publications.europa.eu/resource/authority/corporate-body/DIGIT)"
      And I should see the text "As planned"
      And I should see the text "http://example.com"
      And I should see the text "Twitter"
      And the "oe_event_featured_media[0][target_id]" field contains "Image placeholder"
      And the "oe_event_dates[0][value][day]" field should contain "15"
      And the "oe_event_dates[0][value][month]" field should contain "6"
      And the "oe_event_dates[0][value][year]" field should contain "2020"
      And the "oe_event_dates[0][value][hour]" field should contain "12"
      And the "oe_event_dates[0][value][minute]" field should contain "30"
      And the "oe_event_dates[0][end_value][day]" field should contain "20"
      And the "oe_event_dates[0][end_value][month]" field should contain "6"
      And the "oe_event_dates[0][end_value][year]" field should contain "2020"
      And the "oe_event_dates[0][end_value][hour]" field should contain "18"
      And the "oe_event_dates[0][end_value][minute]" field should contain "30"
      And the "oe_subject[0][target_id]" field should contain "financing (http://data.europa.eu/uxp/1000)"
      And the "oe_author[0][target_id]" field should contain "Directorate-General for Communication (http://publications.europa.eu/resource/authority/corporate-body/COMMU)"
      And the "oe_content_content_owner[0][target_id]" field should contain "Directorate-General for Communication (http://publications.europa.eu/resource/authority/corporate-body/COMMU)"

      # Add related entities, such as venues and contacts and reload the page.
      When the following Default Venue entity:
        | Name     | DIGIT                                                                                      |
        | Address  | country_code: BE - locality: Brussels - address_line1: Rue Belliard 28 - postal_code: 1000 |
        | Capacity | 12 people                                                                                  |
        | Room     | B-28 03/A150                                                                               |
      And the following Press Contact entity:
        | Name               | A press contact                                                                          |
        | Address            | country_code: HU - locality: Szeged - address_line1: Press contact 1 - postal_code: 6700 |
        | Email              | press@example.com                                                                        |
        | Phone number       | +32477777778                                                                             |
        | Social media links | uri: http://facebook.com - title: Facebook - link_type: facebook                         |
      And the following General Contact entity:
        | Name               | A general contact                                                                            |
        | Address            | country_code: HU - locality: Budapest - address_line1: General contact 1 - postal_code: 1011 |
        | Email              | general@example.com                                                                          |
        | Phone number       | +32477792933                                                                                 |
        | Social media links | uri: http://instagram.com - title: Instagram - link_type: instagram                          |
      And the Event Content "My event" is updated as follows:
        | Venue                 | DIGIT                               |
        | Contact               | A press contact, A general contact  |
        | Organiser is internal | No                                  |
        | Organiser name        | Name of the organiser               |
      And I reload the page
      And the "Organiser name" field should contain "Name of the organiser"

      And I press "Edit" in the "A general contact" row
      And I wait for AJAX to finish
      And the "Phone number" field should contain "+32477792933"
      And the "Country" field should contain "HU"

    @javascript
    Scenario: Test ProjectContentContext and BeforeParseEntityFields alterations are done.
      Given I am logged in as a user with the "edit any oe_project content, access content, view published skos concept entities, manage corporate content entities, view published oe_organisation" permission

      When the following Stakeholder Organisation entity:
        | Name    | A Stakeholder                                                                            |
        | Acronym | AAAAA                                                                                    |
        | Address | country_code: HU - locality: Szeged - address_line1: Press contact 1 - postal_code: 6700 |
        | Website | uri: http://facebook.com - title: Facebook                                               |

      And the following Stakeholder Organisation entity:
        | Name    | A Participant                                                                            |
        | Acronym | PPPPP                                                                                    |
        | Address | country_code: HU - locality: Szeged - address_line1: Press contact 1 - postal_code: 6700 |
        | Website | uri: http://facebook.com - title: Facebook                                               |

      And the following General Contact entity:
        | Name               | A general contact                                                                            |
        | Address            | country_code: HU - locality: Budapest - address_line1: General contact 1 - postal_code: 1011 |
        | Email              | general@example.com                                                                          |
        | Phone number       | +32477792933                                                                                 |
        | Social media links | uri: http://instagram.com - title: Instagram - link_type: instagram                          |

      And the following image:
        | name              | file            |
        | Image placeholder | example_1.jpeg  |

      And the following document:
        | name                 | file          |
        | Document placeholder | document.pdf  |

      And the following Project Content entity:
        | Title                     | My project                                       |
        | Summary                   | My Summary                                       |
        | Reference                 | My Reference                                     |
        | Project period start date | 2020-01-01                                       |
        | Project period end date   | 2020-01-02                                       |
        | Overall budget            | 100000                                           |
        | EU contribution           | 50000                                            |
        | Website                   | uri: http://ec.europa.eu/info - title: Info site |
        | Body text                 | My Body text                                     |
        | Call for proposals        | uri: http://ec.europa.eu/info - title: Info site |
        | Results                   | My Results                                       |
        | Teaser                    | My teaser                                        |
        | Coordinators              | A Stakeholder                                    |
        | Departments               | Asian Development Bank                           |
        | Featured media            | Image placeholder                                |
        | Funding programme         | Anti Fraud Information System (AFIS)             |
        | Participants              | A Participant                                    |
        | Project contact           | A general contact                                |
        | Documents                 | Document placeholder                             |
        | Result files              | Document placeholder                             |

      When I visit node "My project" edit page
      Then I should see the text "My project"
      And I should see the text "My Summary"
      And the "Reference" field should contain "My Reference"
      And the "oe_project_dates[0][value][day]" field should contain "1"
      And the "oe_project_dates[0][value][month]" field should contain "1"
      And the "oe_project_dates[0][value][year]" field should contain "2020"
      And the "oe_project_dates[0][end_value][day]" field should contain "2"
      And the "oe_project_dates[0][end_value][month]" field should contain "1"
      And the "oe_project_dates[0][end_value][year]" field should contain "2020"
      And the "Overall budget" field should contain "100000"
      And the "EU contribution" field should contain "50000"
      And the "oe_project_website[0][uri]" field should contain "http://ec.europa.eu/info"
      And the "oe_project_website[0][title]" field should contain "Info site"
      And the "Body text" field should contain "My Body text"
      And the "oe_project_calls[0][uri]" field should contain "http://ec.europa.eu/info"
      And the "oe_project_calls[0][title]" field should contain "Info site"
      And the "Results" field should contain "My Results"
      And the "Teaser" field should contain "My teaser"
      And I should see the text "A Stakeholder"
      And I should see the text "A Participant"
      And I should see the text "A general contact"
      And the "oe_departments[0][target_id]" field should contain "Asian Development Bank (http://eurovoc.europa.eu/6336)"
      And the "oe_project_funding_programme[0][target_id]" field should contain "Anti Fraud Information System (AFIS) (http://publications.europa.eu/resource/authority/eu-programme/AFIS2020)"

    @javascript
    Scenario: Test CallForTendersContentContext and BeforeParseEntityFields alterations are done.
      Given I am logged in as a user with the "edit any oe_call_tenders content, access content, view published skos concept entities, manage corporate content entities" permission

      And the following document:
        | name                 | file          |
        | Document placeholder | document.pdf  |

      And the following "Call for tenders" Content entity:
        | Title                  | My Call for tenders    |
        | Body text              | My Body text           |
        | Publication date       | 2020-01-01             |
        | Opening date           | 2020-01-01             |
        | Deadline date          | 2020-01-01 10:00:00    |
        | Introduction           | My Introduction        |
        | Reference              | My Reference           |
        | Teaser                 | My teaser              |
        | Documents              | Document placeholder   |
        | Responsible department | Asian Development Bank |

      When I visit node "My Call for tenders" edit page
      Then I should see the text "My Call for tenders"
      And the "Introduction" field should contain "My Introduction"
      And the "oe_publication_date[0][value][day]" field should contain "1"
      And the "oe_publication_date[0][value][month]" field should contain "1"
      And the "oe_publication_date[0][value][year]" field should contain "2020"
      And the "oe_call_tenders_opening_date[0][value][day]" field should contain "1"
      And the "oe_call_tenders_opening_date[0][value][month]" field should contain "1"
      And the "oe_call_tenders_opening_date[0][value][year]" field should contain "2020"
      And the "oe_call_tenders_deadline[0][value][day]" field should contain "1"
      And the "oe_call_tenders_deadline[0][value][month]" field should contain "1"
      And the "oe_call_tenders_deadline[0][value][year]" field should contain "2020"
      And the "oe_call_tenders_deadline[0][value][hour]" field should contain "10"
      And the "oe_call_tenders_deadline[0][value][minute]" field should contain "0"
      And the "Reference" field should contain "My Reference"
      And the "Body text" field should contain "My Body text"
      And the "Teaser" field should contain "My teaser"
      And the "oe_departments[0][target_id]" field should contain "Asian Development Bank (http://eurovoc.europa.eu/6336)"

    @javascript
    Scenario: Test OrganisationContentContext and BeforeParseEntityFields alterations are done.
      Given I am logged in as a user with the "edit any oe_organisation content, access content, view published skos concept entities" permission

      And the following General Contact entity:
        | Name               | A general contact                                                                            |
        | Address            | country_code: HU - locality: Budapest - address_line1: General contact 1 - postal_code: 1011 |
        | Email              | general@example.com                                                                          |
        | Phone number       | +32477792933                                                                                 |
        | Social media links | uri: http://instagram.com - title: Instagram - link_type: instagram                          |

      And the following image:
        | name              | file            |
        | Image placeholder | example_1.jpeg  |

      And the following "Organisation" Content entity:
        | Title             | My Organisation             |
        | Introduction      | My Introduction             |
        | Body text         | My Body text                |
        | Acronym           | My acronym                  |
        | Alternative title | My Alternative Organisation |
        | Contact           | A general contact           |
        | EU organisation   | Arab Common Market          |
        | Organisation type | eu                          |
        | Logo              | Image placeholder           |
        | Teaser            | My teaser                   |

      When I visit node "My Organisation" edit page
      Then I should see the text "My Organisation"
      And the "Introduction" field should contain "My Introduction"
      And the "Body text" field should contain "My Body text"
      And the "Acronym" field should contain "My acronym"
      And the "Alternative title" field should contain "My Alternative Organisation"
      And I should see the text "A general contact"
      And the "oe_organisation_eu_org[0][target_id]" field should contain "Arab Common Market (http://eurovoc.europa.eu/1793)"
      And the "oe_organisation_org_type" field should contain "eu"
      And the "Teaser" field should contain "My teaser"