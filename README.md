[![Varbase](https://raw.githubusercontent.com/Vardot/varbase/11.0.x/images/varbase-logo.png)](https://www.drupal.org/project/varbase)

# Varbase AI Context
[![pipeline status](https://git.drupalcode.org/project/varbase_ai_context/badges/1.0.x/pipeline.svg)](https://git.drupalcode.org/project/varbase_ai_context/-/pipelines)
[![Varbase AI Context](https://img.shields.io/badge/Varbase%20AI%20Context-1.0.0--beta3-0d6efc?labelColor=001d38&style=flat-square)](https://git.drupalcode.org/project/varbase_ai_context/-/pipelines?ref=1.0.0-beta3)
[![Automated Functional Testing](https://git.drupalcode.org/project/varbase_project/badges/11.0.x/pipeline.svg)](https://git.drupalcode.org/project/varbase_project/-/pipelines)

A recipe to install the Context Control Center (CCC) module and pre-populate starter context items for every Varbase site.

This recipe provides a complete CCC setup including:
- Context Control Center ([`ai_context`](https://www.drupal.org/project/ai_context)) module installation
- Pre-configured starter context items shipped with Varbase brand knowledge, editorial standards, and AI safety limits
- Bundle, scope settings, form/view displays, and views from `ai_context` module's install configs

## Included Context Items

This recipe creates the following context items, used by every Varbase AI agent (Page Builder, Template Builder, Title Generation, Orchestrator, Field Agent, Taxonomy Agent, Editor Assistant, Image Alt, Taxonomy Tagging):

- **Varbase Brand & Identity Guidelines**: Core brand identity, terminology, and positioning rules — product name, version, vendor, tone of voice, key terminology, content rules.
- **Varbase AI Editorial Rules**: Content types & entities available in Varbase (Blog post, Utility page, Canvas page, Media, Webform submissions, Taxonomy), writing standards, content moderation workflow, SEO rules, forbidden content.
- **AI Safety Guardrails — Varbase**: Hard stops, content safety rules, scope limits, disclosure requirement, incident reporting.

## Post-Install Step

After applying this recipe, set scope on each item via **Admin → AI → Context → Context Items**:
- Toggle **Global** to apply to all AI agents
- Set **Use Cases** (Writing Words, Working In Canvas) to scope per agent type
- Set **Languages**, **Tags**, **Site Sections**, or **Target Entities** for finer control

The scope (`map` field) cannot be set via Drupal core's `Importer` because `MapItem` field type has no static property definitions. See https://www.drupal.org/project/drupal/issues/3478669 for upstream tracking.

## Compatible With

- Drupal core `~11.3.0`
- Varbase
- [`drupal/ai_context`](https://www.drupal.org/project/ai_context) `~1.0`

## Apply the Recipe

Add the recipe using composer:
```
composer require drupal/varbase_ai_context:~1.0.0
```

Change directory to `/web` or `/docroot`

Run the Drupal recipe bash script:
```
bash core/scripts/drupal recipe recipes/contrib/varbase_ai_context
```

or

Run the Drush recipe command:
```
drush recipe recipes/contrib/varbase_ai_context
```

or

Apply via the Project Browser UI at `/admin/modules/browse/varbase_recipes` → click **Install** on **Varbase AI Context**.

## Known Issue (Upstream)

`ai_context_install()` in `ai_context.install` calls `_ai_context_add_to_workflow()` which assumes the bundle entity (`ai_context.ai_context_item_type.default`) exists. When installed via Drupal Recipes, `ConfigInstaller::setSyncing(TRUE)` skips config-entity install during module install, causing `LogicException: Missing bundle entity, entity type ai_context_item_type, entity id default.` at `EntityType::getBundleConfigDependency()`.

Workaround: patch `ai_context.install` to early-return from `_ai_context_add_to_workflow()` when the bundle is missing. File issue at https://www.drupal.org/project/ai_context.
