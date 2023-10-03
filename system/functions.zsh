print_info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

print_user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

print_success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

print_fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    # echo ''
    # exit
}

killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

if [ -z "\${which tree}" ]; then
    tree () {
        find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
    }
fi

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

shell () {
    ps | grep `echo $$` | awk '{ print $4 }'
}

confirm () {
    # call with a prompt string or use a default
    read -q "RESPONSE?Are you sure? [y/N]"
    # read -r -p "${1:-Are you sure? [y/N]} " response
    case $RESPONSE in
        [yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

tob64() {
    echo -n ${1} | base64
}

fromb64() {
    echo -n ${1} | base64 -d
}

replace() {
    grepr $1 -l | xargs sed -i "s/$1/$2/g"
}

shapass() {
    echo -n $1 | sha256sum | cut -f1 -d\ | xxd -r -p | base64 | cut -c -${2:-32}
}

# cat-certs main-cert.pem intermediate1.pem intermediate2.pem
cat-certs() {
    echo "Combining the files: $@"
    filename=$1
    filename="${filename%%.*}-combined.pem"
    echo "Writing output to '${filename}'"
    cat "$@" > "${filename}"
    # echo "" > "${filename}"
    # for var in "$@"
    # do
    #     cat "${var}" >> "${filename}"
    #     printf "\n" >> "${filename}"
    # done
}

cert-info() {
    openssl x509 -in $1 -text -noout
}

cert-info-domains() {
    cert-info $1 | grep DNS
}

# curl-cert-expiration mconf.com
cert-expiration() {
    curl -k https://$1 -vI 2>&1 | grep -e "expire date" -e "O="
}
alias curl-cert-expiration='cert-expiration'
