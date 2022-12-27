DD_API_KEY?=''

ifdef CHAIN_ID
	TARGET_OPTS = 'target=$(CHAIN_ID)'
	TARGET_HOST_OPTS = '-l $(CHAIN_ID)'
	CHAIN_ID_OPTS = 'chain_id=$(CHAIN_ID)'
endif

ifdef SERVICE_ID
	TARGET_OPTS = 'target=$(SERVICE_ID)'
	TARGET_HOST_OPTS = '-l $(SERVICE_ID)'
endif

ifdef REPLICAS
	REPLICAS_OPTS = 'replicas=$(REPLICAS)'
endif

ifdef SEEDS
	SEED_OPTS = 'seeds=$(SEEDS)'
endif

ifdef STATE_SYNC_HOST
	RESTORE_OPTS = 'state_sync_host=$(STATE_SYNC_HOST)'
endif

ifdef SNAPSHOT_URL
	RESTORE_OPTS = 'snapshot_url=$(SNAPSHOT_URL)'
endif

ifdef NODE
	NODE_OPTS = 'node=$(NODE)'
endif

ifdef DB_BACKEND
	DB_BACKEND_OPTS = 'db_backend=$(DB_BACKEND)'
endif

ifdef DD_API_KEY
	DD_OPTS = 'dd_api_key=$(DD_API_KEY)'
endif

launch:
	@ansible-playbook -i inventory/hosts -e '$(TARGET_OPTS) $(CHAIN_ID_OPTS) image=$(IMAGE) $(REPLICAS_OPTS) $(SEED_OPTS) service_type=$(SERVICE_TYPE) $(RESTORE_OPTS) $(NODE_OPTS) $(DB_BACKEND_OPTS) $(DD_OPTS)' $(TARGET_HOST_OPTS) launch.yml

upgrade:
	@ansible-playbook -i inventory/hosts -e '$(TARGET_OPTS) image=$(IMAGE) $(REPLICAS_OPTS) service_type=$(SERVICE_TYPE) $(NODE_OPTS) $(DB_BACKEND_OPTS) $(DD_OPTS)' $(TARGET_HOST_OPTS) upgrade.yml
