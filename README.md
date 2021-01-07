# Install
1. Edit `hooks/config.sh`
2. Run `./install.sh`

# How to use
1. Create branch name with task id (pattern defined: `BRANCH_REGEXP` in the `hooks/config.sh` file)
2. git commit. After commit the task id is append in the beggining of the commit message.

If you has already exist repository need update old prepare-commit-msg template run: `REPO_DIR=/var/www/my_repo_dir ./update.sh`

Update all repositories:
```sh
export all_repos_dir="/var/www/my_all_repos/" && for repo_dir in $(find $all_repos_dir -type d -name '.git' | sed 's/\/\.git$//'); do REPO_DIR=$repo_dir ./update.sh; done
```
