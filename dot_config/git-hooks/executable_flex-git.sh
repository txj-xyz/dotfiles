#!/bin/bash

RED='\033[31m'
YELLOW='\033[33m'
NC='\033[0m'

# ----- Functions -----
check_git_repo() {
  if [[ -s ".git" ]]; then
    return 0
  else
    echo -e "${RED}Not a git repo, Exiting.${NC}"
    exit 1
  fi
}

check_jira_issue() {
  issue_string="$1"
  jira_issue_number=$(echo "$issue_string" | grep -oiE '[A-Z]+-[0-9]+')
  if [[ -z "$jira_issue_number" ]]; then
    return 1
  else
    # Make sure the issue number is uppercase
    jira_issue_number=$(echo $jira_issue_number | tr '[:lower:]' '[:upper:]');
    return 0
  fi
}

prompt_jira_issue() {
  echo -e "${YELLOW}Enter Jira URL or issue number:${NC}"; read jira_issue;
  check_jira_issue "$jira_issue"
  if [[ $? -eq 1 ]]; then
    echo -e "${RED}[Error] Failed to locate issue number, Try again.${NC}"
    prompt_jira_issue;
  fi
}

# --------------------
# set -xe

# First check if we are in a git repo
check_git_repo

# Prompt for Jira issue and validate it against regex to make sure we have a number
prompt_jira_issue

# Set the fix purpose
purposes=("minorbugfix" "majorbugfix" "minorenhancement" "majorenhancement" "newfeature")
echo -e "${YELLOW}Select the purpose of this branch:${NC}"
select purpose in "${purposes[@]}"; do
  if [[ -n $purpose ]]; then
    break
  else
    echo -e "${RED}[Error] Invalid option, Try again.${NC}"
  fi
done

# Prompt for the branch name
echo -e "${YELLOW}Branch name:${NC}"; read branch_name

# Final result

git switch -c "$jira_issue_number/$purpose/$branch_name"
