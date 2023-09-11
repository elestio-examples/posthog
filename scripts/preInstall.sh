#set env vars
set -o allexport; source .env; set +o allexport;


POSTHOG_SECRET=$(head -c 28 /dev/urandom | sha224sum -b | head -c 56)

cat << EOT >> ./.env

POSTHOG_SECRET=${POSTHOG_SECRET}
EOT

cat << EOT > ./Caddyfile

{
    acme_ca https://acme-staging-v02.api.letsencrypt.org/directory
}
    ${DOMAIN}, :80, :443 {
    reverse_proxy http://web:8000
}

EOT

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 8245,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT

chmod +x ./Caddyfile
chmod +x ./compose/start
chmod +x ./compose/temporal-django-worker
chmod +x ./compose/wait