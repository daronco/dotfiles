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

# Concatenate multiple certificate files into one combined PEM file
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

# Display detailed information about a certificate file
cert-info() {
    openssl x509 -in $1 -text -noout
}

# List all DNS domains from a certificate file
cert-info-domains() {
    cert-info $1 | grep DNS
}

# Show the SSL certificate expiration date for a given domain
cert-expiration() {
    curl -k https://$1 -vI 2>&1 | grep -e "expire date" -e "O="
}
alias curl-cert-expiration='cert-expiration'

# Find large files in a directory (default: /, size: 1000M)
find_large_files() {
    local path=${1:-"/"}
    local size=${2:-"1000M"}

    /usr/bin/sudo find "$path" -xdev -type f -size "+$size"
}

# # find_largest_files / 20
# find_largest_files() {
#     local path=${1:-"/"}
#     local num=${2:-"20"}

#     find "$path" -xdev -type f -exec du -h {} + | sort -rh | head -n "$num"
#     # sudo du -h -aBm "$path" 2>/dev/null | sort -nr | head -n "$num"
# }

compare_files() {
    if cmp -s "$1" "$2"; then
        printf 'The file "%s" is the same as "%s"\n' "$1" "$2"
    else
        printf 'The file "%s" is different from "%s"\n' "$1" "$2"
    fi
}

# Setup all ssh keys available on keychain/ssh-agent
ssh-keys-setup() {
    local ask=${1:-true}
    for possiblekey in ${HOME}/.ssh/*id_*; do
        if grep -q PRIVATE "$possiblekey"; then
            if [ "$ask" = true ]; then
                eval $(keychain --eval $possiblekey)
            else
                eval $(keychain --noask -q --eval $possiblekey)
            fi
            # ssh-add "$possiblekey"
        fi
    done
}
alias ssh-keys="ssh-keys-setup"

# Reload all .zsh files in ~/.dotfiles
dot-reload() {
    for file in $(find $HOME/.dotfiles -type f -name "*.zsh"); do
        source "$file"
    done
    echo "Reloaded all .zsh files in ~/.dotfiles"
}

# List all function names and their description
zsh-ls-func() {
    find "$HOME/.dotfiles" -mindepth 2 -maxdepth 2 -type f -name "*.zsh" | while read -r file; do
        awk '
        {
            lines[NR] = $0
        }
        /^[a-zA-Z0-9_-]+[ ]*\(\)[ ]*\{/ {
            funcname = $1
            sub(/[ ]*\(\)[ ]*\{.*/, "", funcname)
            desc = ""
            for (i = NR - 1; i > 0; i--) {
                if (lines[i] ~ /^#[ ]?/) {
                    desc = lines[i] " " desc
                } else if (lines[i] !~ /^\s*$/) {
                    break
                }
            }
            if (funcname != "") print funcname "|" desc
        }' "$file"
    done | sort -t'|' -k1,1 -u | awk -F'|' '{printf "%-30s %s\n", $1, $2}'
}

# List all alias names and their definitions
zsh-ls-alias() {
    find "$HOME/.dotfiles" -mindepth 2 -maxdepth 2 -type f -name "*.zsh" | while read -r file; do
        awk '/^alias[ ]+[a-zA-Z0-9_-]+=/ {
            # Extract alias name and definition
            match($0, /^alias[ ]+([a-zA-Z0-9_-]+)=/, arr)
            aliasname = arr[1]
            def = $0
            sub(/^alias[ ]+[a-zA-Z0-9_-]+=[\\'\''"]?/, "", def)
            print aliasname "|" def
        }' "$file"
    done | sort -t'|' -k1,1 -u | awk -F'|' '{printf "%-30s %s\n", $1, $2}'
}
