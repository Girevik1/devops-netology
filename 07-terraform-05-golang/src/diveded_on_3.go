package main

import "fmt"

func div3(xs [100]int) []int {
  var x3 []int
  for i, _ := range xs {
    if (i+1)%3 == 0 {
      x3 = append(x3, i+1)
    }
  }
  return x3
}

func main() {
  x := [100]int{}
  x3 := div3(x)
  fmt.Println(x3)
}