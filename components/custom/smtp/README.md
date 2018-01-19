In order to generate the required data for the SMTP server, it's mandatory generate some files witch contain configuration for the SMTP:

All config is already generate in this folder, but if you need to regenerate again:

1º Create your mail accounts
    touch postfix-accounts.cf
    docker run --rm \
    -e MAIL_USER=universiaid@universiaid.com \
    -e MAIL_PASS=universiaid \
    -ti tvial/docker-mailserver:latest \
    /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' > postfix-accounts.cf

2º Generate DKIM keys
    docker run --rm \
    -v "$(pwd)":/tmp/docker-mailserver \
    -ti tvial/docker-mailserver:latest generate-dkim-config
