[![Varbase](https://raw.githubusercontent.com/Vardot/varbase/11.0.x/images/varbase-logo.png)](https://www.drupal.org/project/varbase)

# Varbase AI Context
[![pipeline status](https://git.drupalcode.org/project/varbase_ai_context/badges/1.0.x/pipeline.svg)](https://git.drupalcode.org/project/varbase_ai_context/-/pipelines)
[![Varbase AI Context](https://img.shields.io/badge/Varbase%20AI%20Context-1.0.1-0d6efc?labelColor=001d38&style=flat-square)](https://git.drupalcode.org/project/varbase_ai_context/-/pipelines?ref=1.0.1)
[![Automated Functional Testing](https://git.drupalcode.org/project/varbase_project/badges/11.0.x/pipeline.svg)](https://git.drupalcode.org/project/varbase_project/-/pipelines)

A recipe to install the Context Control Center (CCC) module and pre-populate starter context items for every Varbase site.

## Documentation

Read the [Varbase AI Context documentation](https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-context) on the Varbase docs site.

## Installation

Add the recipe using composer:
```
composer require drupal/varbase_ai_context:~1
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

## Automated testing

GitLab CI on [git.drupalcode.org](https://git.drupalcode.org/project/varbase_ai_context) (`.gitlab-ci.yml`) builds
a Varbase 11 site, applies this recipe twice and runs the Varbase functional testing suite in `tests/` on it. See
[tests/README.md](tests/README.md) to run it against a site of your own.
