---
"@common-fate/terraform-aws-common-fate-deployment": patch
---

Fix error handling for slack integrations in the event handler. In some cases a database error would be reported as having no integrations configured.