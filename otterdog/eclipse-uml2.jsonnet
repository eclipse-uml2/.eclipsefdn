local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-uml2') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/modeling.mdt.uml2",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Eclipse UML2 is an EMF-based implementation of the UMLTM 2.x metamodel for the Eclipse platform.",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse MDT UML2",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: true,
    },
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
    orgs.newRepo('uml2') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('.github') {
      allow_auto_merge: true,
      allow_merge_commit: false,
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main'),
      ],
    },
    orgs.newRepo('uml2-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "The UML2 project website",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
