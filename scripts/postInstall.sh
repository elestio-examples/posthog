#set env vars
set -o allexport; source .env; set +o allexport;

sleep 300s;

target=$(docker-compose port web 8000)

url="http://${target}/preflight"
response=$(curl -s -I "$url")

cookie=$(echo "$response" | grep -i 'Set-Cookie' | sed -e 's/Set-Cookie: //I' | awk '{print $1}')
csrftoken_value=$(echo "$cookie" | grep -oP 'posthog_csrftoken=\K[^;]*')


curl http://${target}/api/signup/ \
  -H 'accept: */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'cookie: posthog_csrftoken='${csrftoken_value}';' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
  -H 'x-csrftoken: '${csrftoken_value}'' \
  --data-raw '{"email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'","first_name":"admin","organization_name":"admin","role_at_organization":"","referral_source":""}' \
  --compressed