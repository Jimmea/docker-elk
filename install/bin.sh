# Check version
curl http://localhost:9200

#
curl -X PUT "localhost:9200/.kibana_1/_settings?pretty" -H 'Content-Type: application/json' -d'
{
  "index": {
    "blocks": {
        "read_only_allow_delete": "false"
    }
  }
}
'
