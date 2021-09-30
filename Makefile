# Load enviroment variables
# include .env

# Export enviroment variables to commands
export

# Variables
protosFolder=proto/*.proto
docsFolder=docs

help:: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | sort | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

docs-generate:: ## Command for generate the docs of grpc files
	@ protoc --doc_out=$(docsFolder) --doc_opt=html,index.html $(protosFolder)

docs-open:: ## Open documentation
	@ xdg-open docs/index.html

proto-generate:: ## Command for generate the pb.go files
	@ protoc \
		--go_out=. \
		--go_opt=paths=source_relative \
		--go-grpc_out=. \
		--go-grpc_opt=paths=source_relative \
		$(protosFolder)

run-server:: ## Run go Application with watcher
	@ go run server/main.go

run-client:: ## Run go Application with watcher
	@ go run client/main.go
