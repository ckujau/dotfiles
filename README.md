These dotfiles are [usually](https://superuser.com/a/183980/218574 "Difference between .bashrc and .bash_profile") executed in [this](https://unix.stackexchange.com/a/71258/31256 "What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?") order:

 dotfile                    | purpose
--------------------------- | -----------------------------------
`.profile`                  | for login shells
`.bash_profile / .zprofile` | for login shells
`.bashrc / .kshrc / .zshrc` | depending on the shell being used
`.aliases`                  | called by our RC files
`.shell.local`              | called by our RC files

Install them all, as [dangerously](https://unix.stackexchange.com/a/339276 "What's the difference between `curl | sh` and `sh -c “$(curl)”`?") as possible:

```
ftp   -o-  https://raw.githubusercontent.com/ckujau/dotfiles/main/install-dot.sh | sh
fetch -o-  https://raw.githubusercontent.com/ckujau/dotfiles/main/install-dot.sh | sh
curl  -Ls  https://raw.githubusercontent.com/ckujau/dotfiles/main/install-dot.sh | sh
wget  -qO- https://raw.githubusercontent.com/ckujau/dotfiles/main/install-dot.sh | sh
```

Missing root certificates and the commands above fail? Install as needed:

* FreeBSD: `ca_root_nss`
* Linux:   `ca-certificates`
* NetBSD:  `mozilla-rootcerts`
* OpenBSD: `/etc/ssl/cert.pem`
