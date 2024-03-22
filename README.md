# GitHub Repository Transfer Guide

This guide helps you transfer multiple repositories from your personal GitHub account to a new organization using the GitHub CLI.

## Prerequisites

- GitHub CLI (`gh`) installed and authenticated
- `transfer_repos.sh` script provided in this repository

## Setup

1. **Clone this repository:**

   ```bash
   git clone https://github.com/yourusername/github-repo-transfer-guide.git
   cd github-repo-transfer-guide
   ```

2. **Install GitHub CLI:**

   If not already installed, follow the instructions in the [GitHub CLI documentation](https://cli.github.com/manual/gh_auth_login).

3. **Authentication:**

   Ensure you are authenticated with GitHub CLI:

   ```bash
   gh auth login
   ```

## Usage

1. **Create a New Organization on GitHub:**

   - Visit [GitHub](https://github.com) and log in.
   - Click your profile picture at the top right and select "Settings".
   - From the left sidebar, choose "Organizations", then click "New organization".
   - Follow the prompts to establish your new organization.

2. **Prepare the List of Repositories:**

   Choose an appropriate method to prepare your repository list, considering your specific requirements:

   - **All Repositories:** Use `gh repo list --limit 1000 > all_repos.txt` to list all your repositories. Manually remove any from `all_repos.txt` you want to keep in your personal account.

   - **Custom List:** Manually create a `repos.txt` and list the repositories in the format `username/repository` you wish to transfer, one per line.

   - **Filtered List:** Utilize `grep` or similar to filter `all_repos.txt`. For example, to keep only original repositories (not forks), use: `grep -v fork all_repos.txt > repos.txt`.


3. **Transfer Repositories:**

   Before running the transfer script, set the target organization name as an environment variable. Optionally, you can list your existing organizations to ensure you use the correct name:

   ```bash
   gh org list
   export ORGANIZATION_NAME="Your-Chosen-Organization-Name"
   chmod +x transfer_repos.sh
   ./transfer_repos.sh
   ```


4. **Verify the Transfer:**

   After running the `transfer_repos.sh` script, confirm that all repositories have been successfully transferred to your new organization:

   1. Navigate to your [organizations settings page on GitHub](https://github.com/settings/organizations) to view all your organizations.
   2. Click on the name of your new organization to go to its GitHub page.
   3. Check the 'Repositories' tab in your organization's GitHub page to see all the repositories currently under this organization.

   Ensure all repositories you intended to transfer are listed. If any are missing, recheck the `repos.txt` file and ensure the `transfer_repos.sh` script executed without errors.


## Conclusion

After transferring, update the local remotes for the cloned repositories to ensure that your future interactions (`git push` or `git pull`) are directed to the new repository locations under your organization:

```bash
git remote set-url origin https://github.com/$ORGANIZATION_NAME/repository-name.git
```

Replace `https://github.com/$ORGANIZATION_NAME/repository-name.git` with the actual URL of your transferred repository. Review the settings and permissions within your new organization to ensure they meet your requirements.


## Contributing

Feel free to fork this repository and customize the scripts to fit your specific needs. Contributions are welcome!
