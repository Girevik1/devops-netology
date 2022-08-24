package main

import "fmt"

func m2f(a float64) float64 {
    var x float64
    x = a / 0.3048
    return x
}

func main() {
    fmt.Print("Enter a number: ")
    var input float64
    fmt.Scanf("%f", &input)

    output := m2f(input)

    fmt.Println(output)
}