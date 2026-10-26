# Varbase functional testing suite

Playwright and Cucumber through [`@vardot/varbase-e2e`](https://www.npmjs.com/package/@vardot/varbase-e2e), on a
Varbase 11 site with this recipe applied.

| Feature | Covers |
| --- | --- |
| `01-01-ai-context-items.feature` | The webmaster finds the three starter context items and adapts the brand guidelines |
| `01-02-ai-context-access.feature` | Editorial roles read published items but cannot change or list them; visitors cannot read them |
| `01-03-ai-context-accessibility.feature` | The context items list and an item page have no serious accessibility violations |

## Run it

```bash
npm install
LAUNCH_URL=https://your-site.ddev.site npm test
```

The site needs the webmaster (`webmaster`) and one user per role, named after the role (`content_editor`,
`content_admin`, `seo_admin`, `site_admin`), all with the password in `LOGIN_PASS` (default `dD.123123ddd`).
`.gitlab-ci.yml` shows the whole setup.

## AI provider

CI applies Drupal CMS AI before the recipe. It sets up an amazee.ai trial as the default provider, so no key is
needed. The suite makes no AI calls of its own.

The item edit form is left out of the accessibility gate: its CKEditor toolbar buttons have no names, which
comes from the editor, not this recipe.
