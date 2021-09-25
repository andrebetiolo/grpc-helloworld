package main

import (
	"context"
	"log"
	"os"
	"time"

	pb "hello/proto"

	"google.golang.org/grpc"
)

const (
	GRPCServerAddress = "localhost:7000"
	defaultName       = "world"
)

func main() {
	// Set up a connection to the server.
	conn, err := grpc.Dial(GRPCServerAddress, grpc.WithInsecure(), grpc.WithBlock())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewHelloClient(conn)

	// Contact the server and print out its response.
	name := defaultName
	if len(os.Args) > 1 {
		name = os.Args[1]
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()
	r, err := c.SayHello(ctx, &pb.SayHelloRequest{Name: name})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Printf("Greeting: %s", r.GetMessage())
}
