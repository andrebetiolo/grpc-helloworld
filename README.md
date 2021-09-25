# gRPC HelloWorld example #
Repositório com o objetivo de compartilhar um exemplo de Hello World com gRPC

```sh
git clone github.com/andrebetiolo/grpc-helloworld
```
## Exemplo da Doc gerada ##

https://andrebetiolo.github.io/grpc-helloworld/index.html

## CLI ##

Fiz uma cli com `make` para ajudar

```sh
make
```

```sh
docs-generate         # Command for generate the docs of grpc files
docs-open             # Open documentation
help                  # Show this help
proto-generate        # Command for generate the pb.go files
run-client            # Run go Application with watcher
run-server            # Run go Application with watcher
```

Pastas

```sh
├── client
│   └── main.go # Exemplo de um client comunicando com um servidor gRPC em GO
├── docs
│   └── index.html # Exemplo de uma documentação gerada através de um arquivo .proto
├── go.mod
├── go.sum
├── Makefile # Arquivo do make que faço a CLI
├── proto
│   ├── hello_grpc.pb.go # Arquivo gerado através do .proto, utilizado pelo o client e pelo o server gRPC
│   ├── hello.pb.go # Arquivo gerado através do .proto, utilizado pelo o client e pelo o server gRPC
│   └── hello.proto # Arquivo de base para geração do Server e do Client e que gera os dois arquivos acima
├── README.md
└── server
    └── main.go # Exemplo de criação de um servidor gRPC instanciado através dos arquivos gerados pelo o .proto
```