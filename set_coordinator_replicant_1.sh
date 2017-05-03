# This script sets replicant to 1 (instead of 2 by default).
source ./env.sh
curl -H "Content-Type: application/json" -X POST -d '[{"tieredReplicants":{"_default_tier":1},"type":"loadForever"}]' http://localhost:${LOCAL_COORDINATOR_PORT}/druid/coordinator/v1/rules/_default
