@varbase-ai-context @ai @recipes @a11y @local @development @staging @production
Feature: Varbase AI Recipe - AI Context - Accessible context pages
  As a site administrator who uses assistive technology
  I want the context item pages to work with a keyboard and a screen reader
  So that I can adapt the AI context like anyone else

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario Outline: Check the "<page>" page has no serious accessibility violations
     When I go to "<path>"
     Then the page should have no serious accessibility violations

    Examples:
      | page                      | path                                   |
      | context items             | /admin/config/ai/context/items         |
      | brand guidelines          | /admin/config/ai/context/items/3       |
