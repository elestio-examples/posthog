#set env vars
#set -o allexport; source .env; set +o allexport;

mkdir -p ./postgres-data
chown -R 1001:1001 ./postgres-data

mkdir -p ./posthog
chown -R 1001:1001 ./posthog

mkdir -p ./zookeeper-datalog
chown -R 1001:1001 ./zookeeper-datalog

mkdir -p ./zookeeper-data
chown -R 1001:1001 ./zookeeper-data

mkdir -p ./zookeeper-logs
chown -R 1001:1001 ./zookeeper-logs

mkdir -p ./compose
chown -R 1001:1001 ./compose

mkdir -p ./object_storage
chown -R 1001:1001 ./object_storage

mkdir -p ./clickhouse-data
chown -R 1001:1001 ./clickhouse-data

