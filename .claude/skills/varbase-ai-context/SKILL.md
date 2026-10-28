---
name: varbase-ai-context
description: "Apply, repair and verify Varbase AI Context on a Varbase 11 site: the Context Control Center (ai_context) with starter brand, editorial and safety items for every AI agent (Varbase AI Context). Install and apply commands, inputs, config, post-apply steps, browser checks, traps and versions, read from the recipe code. Use when adding, fixing or checking Varbase AI Context."
---

# Varbase AI Context

Read from `recipe.yml`, `composer.json`, README, CHANGELOG and `git log` at the latest tag, 28 October 2026. Re-check versions on drupal.org before relying on them. For the full Varbase AI apply order, see the Varbase AI recipes docs page.

## Recipes

| Recipe | Latest | Stability | Require |
|---|---|---|---|
| `varbase_ai_context` | 1.0.2 | stable | `drupal/varbase_ai_context:~1` |

Docs (the code wins where they differ):
- https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-context

## What it does

- Installs `ai_context` (strict import of its config). Creates and publishes three starter items: Varbase Brand and Identity Guidelines, Varbase AI Editorial Rules, AI Safety Guardrails. Sets `ai_context.settings` and the global scope; grants the four Varbase roles.
- Composer: `drupal/core ~11.4.0`, `ai_context ~1.0` (1.0.0-rc1). No inputs. Applied by Varbase AI Base and Figma Base.

## Apply

All commands in DDEV, from the project root; recipes are applied from the docroot path `../recipes/<name>`. Take a snapshot first: `ddev snapshot --name before-varbase-ai-context`. Add each recipe to `extra.drupal-recipe-unpack.ignore` in `composer.json` before requiring it (read the list first: `composer config --json` replaces it).

```bash
ddev composer require drupal/varbase_ai_context:~1
ddev drush cr
ddev drush recipe ../recipes/varbase_ai_context -y
```

## After the apply

- Set each item's scope in Admin > AI > Context (Global, use cases such as Writing Words and Working In Canvas, languages, tags, sections, target entities), and replace the starter text with the site's own brand and rules.

## Verify

- Admin > AI > Context lists the three items as published; an AI review or a Canvas AI answer reflects the brand voice.

Test as a real editor or visitor, not user 1: a superuser bypasses permissions.

## Traps

- 1.0.0 left the items unpublished; 1.0.1 publishes them (#3628827).

## History

Started May 2026, 1.0.0 on 5 Sep 2026, 1.0.1 10 Oct, 1.0.2 27 Oct (functional tests #3633123).
