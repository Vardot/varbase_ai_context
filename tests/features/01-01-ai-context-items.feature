@varbase-ai-context @ai @recipes @local @development @staging @production
Feature: Varbase AI Recipe - AI Context - Starter context items for every AI agent
  As a site administrator
  I want the recipe to add the Varbase brand, editorial and safety context items for every AI agent
  So that the AI writes with the site's voice and limits from the first day, and I can adapt them

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Check the webmaster finds the three starter context items ready to adapt
     When I go to "/admin/config/ai/context/items"
     Then I should see "Varbase AI Editorial Rules"
      And I should see "Varbase AI Safety Guardrails"
      And I should see "Varbase Brand & Identity Guidelines"

  Scenario: Verify the webmaster adapts the brand guidelines and the change is kept
     When I go to "/admin/config/ai/context/items"
      And I open the "Edit" link in the "Varbase Brand & Identity Guidelines" row
      And I fill in "Description" with "Brand rules every AI call follows, adapted for this site."
      And I press "Save"
     Then I should see "Varbase Brand & Identity Guidelines"
     When I click "Varbase Brand & Identity Guidelines"
     Then I should see "Brand rules every AI call follows, adapted for this site."
