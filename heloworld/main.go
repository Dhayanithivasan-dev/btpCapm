package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Hi this is my first app")
	})

	fmt.Println("Starting server on port", port)
	http.ListenAndServe(":"+port, nil)
}
