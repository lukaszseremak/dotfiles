# Linux info

### 1. Config files location.

- Path to the applications setings.

```sh
/usr/share/applications/
```

- Defult application settings.

```sh
~/.config/mimeapps.list
```

### 2. Usefull comands.

- check desktop parameters
  ```sh
  sudo lshw
  ```
- sort pacman mirrors
  ```sh
  sudo pacman-mirrors -f 0
  ```
- recv keys with proxy
  ```sh
  gpg --keyserver-options "timeout=10 http-proxy=$http_proxy" --recv-keys "key_here"
  ```
- change icons and themes
  ```sh
  lxappearance
  ```
- check name and class of the runnning program
  ```sh
  xprop
  ```
- how to find/identify large commits in git history
  ```sh
  git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  sed -n 's/^blob //p' |
  sort --numeric-sort --key=2 |
  cut -c 1-12,41- |
  $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
  ```
- how to remove a large file from commit history in the git repository

  ```sh
  git filter-branch --force --index-filter 'git rm --cached -r --ignore-unmatch <path_to_the_file>' --prune-empty --tag-name-filter cat -- --all
  rm -rf .git/refs/original/
  git reflog expire --expire=now --all
  git gc --prune=now
  git gc --aggressive --prune=now
  git push --all --prune --force
  ```

### 3. nvim with pyenv:

    - add file `pyrightconfig.json` in the root of the project with info:
    ```json
    {
        "venvPath": "/home/USERNAME/.pyenv/versions/",
        "venv": "venv_name"
    }
    ```

### 4. nvim with pyenv and pipenv:

- create venv with python version set by pyenv

```bash
pipenv --python $(pyenv which python)
```

- install required packages after creating new venv

```bash
pipenv install --dev neovim pynvim
```

### 5. Proxy
- set in /etc/profile.d/proxy.sh
```sh
proxy() {
    export auto_proxy="http://proxyconf.../proxy.pac"
    export http_proxy="http://address:8080"
    export https_proxy="${http_proxy}"
    export ftp_proxy="${http_proxy}"
    export rsync_proxy="${http_proxy}"
    export no_proxy="0.0.0.0,localhost,127.0.0.1,..."
    export AUTO_PROXY="${auto_proxy}"
    export HTTP_PROXY="${http_proxy}"
    export HTTPS_PROXY="${http_proxy}"
    export FTP_PROXY="${http_proxy}"
    export RSYNC_PROXY="${http_proxy}"
    export NO_PROXY="${no_proxy}"
}

noproxy() {
    unset $(env | awk -F'=' '/_proxy/ { print $1 }')
}

proxy
```
