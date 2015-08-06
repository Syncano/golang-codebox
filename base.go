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

var ARGS = _unmarshall_json([]byte(`{"this":"That", "other":42}`))
var META = _unmarshall_json([]byte(`{"executed_by": "webhook", "executor": "webhook_slug"}`))
var CONFIG = _unmarshall_json([]byte(`{"apiKey":"xxxxxxxx", "concurrency":4}`))

func _unmarshall_json_string(data_raw []byte) map[string]interface{{}} {{
    var data map[string]interface{{}}
    json.Unmarshal(data_raw, &data)
    return data
}}
