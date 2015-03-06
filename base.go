package main

import "encoding/json"
import "fmt"

// YOUR CUSTOM CODEBOX CODE AREA

// you can define your functions here

// don't forget to include main function
func main() {
        config, args := initialize()
        fmt.Println("Hello from go!")
        fmt.Println(config)
        fmt.Println(args)
        concurrency := config["concurrency"].(float64)
        fmt.Println(concurrency)
}

// END OF CUSTOM AREA

// helper that will parse codebox config and args for you

func initialize() (map[string]interface{}, map[string]interface{}) {
        config_raw := []byte(`{"apiKey":"xxxxxxxx", "concurrency":4}`)
        args_raw := []byte(`{"this":"That", "other": 42}`)
        var config map[string]interface{}
        var args map[string]interface{}
        json.Unmarshal(config_raw, &config)
        json.Unmarshal(args_raw, &args)
        return config, args
}
