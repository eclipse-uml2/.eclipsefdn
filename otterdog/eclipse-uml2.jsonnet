local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uml2') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/modeling.mdt.uml2",
    description: "Eclipse UML2 is an EMF-based implementation of the UMLTM 2.x metamodel for the Eclipse platform.",
    name: "Eclipse MDT UML2",
    web_commit_signoff_required: false,
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/uml2/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_auto_merge: true,
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main'),
      ],
    },
    orgs.newRepo('uml2') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "An EMF-based implementation of the UML 2.x metamodel for the Eclipse platform.",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('uml2-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "The UML2 project website",
      web_commit_signoff_required: false,
    },
  ],
}
