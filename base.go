package main

import "encoding/json"

// YOUR CUSTOM CODEBOX CODE AREA

import "fmt"
// you can define your functions here

// don't forget to include main function
func main() {
        fmt.Println("Hello from go!")
        fmt.Println(CONFIG)
        fmt.Println(ARGS)
        fmt.Println(META)
        concurrency := CONFIG["concurrency"].(float64)
        fmt.Println(concurrency)
}

// END OF CUSTOM AREA

// helper that will parse codebox config and args for you

var (
        ARGS = unmarshallJSON([]byte(`{"this":"That", "other":42}`))
        META = unmarshallJSON([]byte(`{"executed_by": "webhook", "executor": "webhook_slug"}`))
        CONFIG = unmarshallJSON([]byte(`{"apiKey":"xxxxxxxx", "concurrency":4}`))
)

func unmarshallJSON(dataRaw []byte) map[string]interface{} {
    var data map[string]interface{}
    json.Unmarshal(dataRaw, &data)
    return data
}
