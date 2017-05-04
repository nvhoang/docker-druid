./set_coordinator_replicant_1.sh
curl -X 'POST' -H 'Content-Type:application/json' -d @wikiticker-index.json localhost:8090/druid/indexer/v1/task
