# Nile - Starknet project written in Cairo

Reference: https://github.com/OpenZeppelin/nile


### Create a virtualenv and activate it
```sh 
python3 -m venv env
source env/bin/activate
```

### Run a local node
```sh 
nile node --port 5050
```

### Compile
```sh 
nile compile
```

### Deploy
```sh 
nile deploy user_balance --alias user_balance_contract
nile deploy user_balance --alias user_balance_contract --network goerli
```

### Setup account
```sh 
nile setup <private_key_alias>
nile setup PKEY1 
```

### Send
```sh 
nile send <private_key_alias> <contract_identifier> <method> [PARAM_1, PARAM2...]
nile send PKEY1 user_balance_contract increase_balance 150
```

### Call and invoke
```sh
nile <command> <contract_identifier> <method> [PARAM_1, PARAM2...]
nile call user_balance_contract get_balance <user_address>
```

### Dubug
```sh 
nile debug <transaction_hash> [CONTRACTS_FILE, NETWORK]
```