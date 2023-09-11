#set env vars
set -o allexport; source .env; set +o allexport;


POSTHOG_SECRET=$(head -c 28 /dev/urandom | sha224sum -b | head -c 56)

cat << EOT >> ./.env

POSTHOG_SECRET=${POSTHOG_SECRET}
EOT

cat << EOT >> ./Caddyfile

{
    acme_ca https://acme-staging-v02.api.letsencrypt.org/directory
}
    ${DOMAIN}, :80, :443 {
    reverse_proxy http://web:8000
}

EOT