package main

import "encoding/json"

// YOUR CUSTOM CODEBOX CODE AREA

import "fmt"
// you can define your functions here

// don't forget to include main function
func main() {
        config, args, meta := initialize()
        fmt.Println("Hello from go!")
        fmt.Println(config)
        fmt.Println(args)
        fmt.Println(meta)
        concurrency := config["concurrency"].(float64)
        fmt.Println(concurrency)
}

// END OF CUSTOM AREA

// helper that will parse codebox config and args for you

func initialize() (map[string]interface{}, map[string]interface{}, map[string]interface{}) {
        config_raw := []byte(`{"apiKey":"xxxxxxxx", "concurrency":4}`)
        args_raw := []byte(`{"this":"That", "other":42}`)
        meta_raw := []byte(`{"executed_by": "webhook", "executor": "webhook_slug"}`)
        var config map[string]interface{}
        var args map[string]interface{}
        var meta map[string]interface{}
        json.Unmarshal(config_raw, &config)
        json.Unmarshal(args_raw, &args)
        json.Unmarshal(meta_raw, &meta)
        return config, args, meta
}
