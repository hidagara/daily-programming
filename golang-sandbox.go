package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)

func main() {

	http.HandleFunc("/home", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
	})

	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", Index)
	router.HandleFunc("/todos", TodoIndex)
	router.HandleFunc("todos/{todoId}", TodoShow)

	log.Fatal(http.ListenAndServe("192.168.3.17:8080", nil))
}

type Todo struct {
	Name      string
	Completed bool
	Due       time.Time
}
