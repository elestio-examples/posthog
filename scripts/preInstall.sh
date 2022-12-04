#set env vars
#set -o allexport; source .env; set +o allexport;

mkdir -p ./postgres-data
# chown -R 999:999 ./postgres-data

mkdir -p ./posthog
# chown -R 999:999 ./posthog

mkdir -p ./zookeeper-datalog
# chown -R 999:999 ./zookeeper-datalog

mkdir -p ./zookeeper-data
# chown -R 999:999 ./zookeeper-data

mkdir -p ./zookeeper-logs
# chown -R 999:999 ./zookeeper-logs

mkdir -p ./compose
# chown -R 999:999 ./compose

mkdir -p ./object_storage
# chown -R 999:999 ./object_storage

mkdir -p ./clickhouse-data
# chown -R 999:999 ./clickhouse-data

mkdir -p ./idl
# chown -R 999:999 ./clickhouse-data

mkdir -p ./Caddyfile
# chown -R 999:999 ./clickhouse-data

