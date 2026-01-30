# .github

Organization-wide default configuration for all repositories in the **ict-crew** organization.

## 📋 Issue Templates

We provide 4 issue templates that apply to all repositories:

### 1. Bug Report
- Required fields: What happened, Steps to reproduce, Version
- Optional: Environment details
- Auto-labels: `bug`

### 2. Feature Request
- Required fields: Feature description, Problem it solves, Proposed solution
- Optional: Alternatives considered
- Auto-labels: `enhancement`

### 3. Documentation Issue
- Required fields: Issue description
- Optional: Documentation URL, Suggested fix
- Auto-labels: `documentation`

### 4. Question
- Required fields: Your question
- Optional: Additional context
- Auto-labels: `question`

**How to use**: Go to any repo's Issues → New issue → Choose a template

---

## 🔀 Pull Request Template

All PRs automatically include a template with:
- Description and type of change
- Changes made checklist
- Testing checklist
- Code review checklist
- Related issues section with closing keywords
- Labels to add to issues
- Screenshots section

### Closing Issues from PRs

Use these keywords in your PR description to **automatically close** issues when merged:
```markdown
Closes #123
Fixes #456
Resolves #789
```

### Labeling Issues from PRs

Reference issues and check labels to automatically apply them when PR is merged:

**Example 1 - Close and label:**
```markdown
Closes #123

## Labels to Add
- [x] Fixed
- [x] To Be Tested
```

**Example 2 - Label without closing:**
```markdown
#123

## Labels to Add
- [x] Work In Progress
- [x] High Priority
```

---

## 🏷️ Standard Labels

All repositories use these standard labels:

### Issue Type Labels (auto-applied by templates)
- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Documentation improvements
- `question` - Further information requested

### Status Labels (manually added or via PR)
- `Fixed` - Issue has been resolved
- `Need to Discuss` - Requires discussion
- `Hold` - On hold
- `To Be Tested` - Ready for testing
- `High Priority` - High priority item
- `Work In Progress` - Currently being worked on

**Removed labels**: `duplicate`, `invalid`, `wontfix` (cleaned up organization-wide)

---

## 🤖 Automated Workflows

### 1. Auto Label Issues from PR
**Trigger**: When a PR is merged  
**What it does**: Automatically adds checked labels to referenced issues

**Location**: `.github/workflows/auto-label-issues.yml`

**Note**: This workflow must be copied to each repository where you want the automation.

### 2. Cleanup Labels (Manual)
**Trigger**: Manual workflow dispatch  
**What it does**: Removes unwanted default labels from the current repository

**Location**: `.github/workflows/cleanup-labels.yml`

**Note**: This workflow is for single-repo cleanup. For organization-wide cleanup, use the script below.

---

## 🛠️ Maintenance Scripts

### cleanup-labels.sh
Removes unwanted labels (`duplicate`, `invalid`, `wontfix`) from all organization repositories.

**Usage**:
```bash
./cleanup-labels.sh
```

**When to run**:
- After creating new repositories
- To clean up default GitHub labels organization-wide

---

## 📦 Setup for New Repositories

When creating a new repository in the organization:

### Automatic Setup ✅
- Issue templates (automatic)
- PR template (automatic)

### Manual Setup Required ⚠️
1. **Clean up labels**: Run `./cleanup-labels.sh` or manually trigger the cleanup workflow
2. **Add workflow automation** (optional): Copy `.github/workflows/auto-label-issues.yml` to enable automatic issue labeling from PRs

---

## 🚀 Quick Start Guide

### Creating an Issue
1. Go to any repo's Issues tab
2. Click "New issue"
3. Select appropriate template (Bug Report, Feature Request, etc.)
4. Fill in required fields
5. Submit

### Creating a Pull Request
1. Create PR as normal
2. Template auto-fills in description
3. Reference issues:
   - To close: `Closes #123`
   - To just label: `#123`
4. Check labels you want to add to issues
5. Merge PR → labels auto-apply

### Adding New Labels
Labels must be created in each repository. Common labels are listed above.

---

## 📁 Repository Structure

```
.github/
├── ISSUE_TEMPLATE/
│   ├── bug_report.yml
│   ├── feature_request.yml
│   ├── documentation.yml
│   ├── question.yml
│   └── config.yml
├── workflows/
│   ├── auto-label-issues.yml
│   └── cleanup-labels.yml
├── pull_request_template.md
└── README.md
cleanup-labels.sh
```

---

## 🔧 Configuration Files

- **config.yml**: Disables blank issues, forces template usage
- **pull_request_template.md**: Organization-wide PR template
- **auto-label-issues.yml**: Workflow for automated issue labeling
- **cleanup-labels.yml**: Workflow for label cleanup
- **cleanup-labels.sh**: Bash script for organization-wide label cleanup

---

## 📝 Notes

- Issue templates and PR template apply **organization-wide automatically**
- Workflows only work in repos where they exist (must be copied)
- Labels must be created in each repository individually
- Use the cleanup script after creating new repos to remove unwanted default labels