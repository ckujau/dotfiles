These dotfiles are usually executed in this order:

1) `.bash_profile, .zprofile`     - For login shells
2) `.profile`                     - For login shells (KSH)
2) `.bashrc/.kshrc/.zshrc`        - depending on the shell being used
3) `.aliases`                     - called by the RC files
4) `.shell.local`                 - called by the RC files

Install them all, as [dangerously](https://unix.stackexchange.com/a/339276 "What's the difference between `curl | sh` and `sh -c “$(curl)”`?") as possible:

    ftp   -o-  https://raw.githubusercontent.com/ckujau/dotfiles/master/install-dot.sh | sh
    fetch -o-  https://raw.githubusercontent.com/ckujau/dotfiles/master/install-dot.sh | sh
    curl  -Ls  https://raw.githubusercontent.com/ckujau/dotfiles/master/install-dot.sh | sh
    wget  -qO- https://raw.githubusercontent.com/ckujau/dotfiles/master/install-dot.sh | sh

Missing root certificates and the commands above fail? Install as needed:

 * FreeBSD: `ca_root_nss`
 * Linux:   `ca-certificates`
 * NetBSD:  `mozilla-rootcerts`
 * OpenBSD: `/etc/ssl/cert.pem` 
