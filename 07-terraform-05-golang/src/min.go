package main

import "fmt"

func min(xs []int) int {
	var xm int
	xm = xs[0]
	for _, xi := range xs {
		if xi < xm {
			xm = xi
		}
	}
	return xm
}

func main() {
	x := []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17}
	xm := min(x)
	fmt.Println(xm)
}