# Linux info

### 1. Config files location.

  * Path to the applications setings.
  ```sh
  /usr/share/applications/
  ```

  * Defult application settings.
  ```sh
  ~/.config/mimeapps.list
  ```

### 2. Usefull comands.
  * check desktop parameters
    ```sh
    $ sudo lshw
    ```
  * sort pacman mirrors
    ```sh
    $ sudo pacman-mirrors -f 0
    ```
  * recv keys with proxy
    ```sh
    $ gpg --keyserver-options "timeout=10 http-proxy=$http_proxy" --recv-keys "key_here"
    ```
  * change icons and themes
    ```sh
    $ lxappearance
    ```
  * check name and class of the runnning program
    ```sh
    $ xprop
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
  $ pipenv --python $(pyenv which python)
  ```
  - install required packages after creating new venv
  ```bash
  $ pipenv install --dev neovim pynvim
  ```
