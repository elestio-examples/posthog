#set env vars
#set -o allexport; source .env; set +o allexport;

mkdir -p ./postgres-data
# chown -R 1000:1000 ./postgres-data

mkdir -p ./posthog
# chown -R 1000:1000 ./posthog

mkdir -p ./zookeeper-datalog
# chown -R 1000:1000 ./zookeeper-datalog

mkdir -p ./zookeeper-data
# chown -R 1000:1000 ./zookeeper-data

mkdir -p ./zookeeper-logs
# chown -R 1000:1000 ./zookeeper-logs

mkdir -p ./compose
# chown -R 1000:1000 ./compose

mkdir -p ./object_storage
# chown -R 1000:1000 ./object_storage

mkdir -p ./posthog
# chown -R 1000:1000 ./posthog

