package main

import (
 "bufio"
 "fmt"
 "os"
 "strings"
 "strconv"
 "gonum.org/v1/gonum/mat"
)

func main() {
 file, _ := os.Open("input.txt")
 defer file.Close()

 var lines []string
 scanner := bufio.NewScanner(file)
 for scanner.Scan() {
  lines = append(lines, scanner.Text())
 }

 matrixSize := len(lines)
 matrix := mat.NewDense(matrixSize, matrixSize, nil)

 for i, line := range lines {
  numbers := strings.Fields(line)
  for j, number := range numbers {
   num, _ := strconv.ParseFloat(number, 64)
   matrix.Set(i, j, num)
  }
 }

 var inverse mat.Dense
 inverse.Inverse(matrix)

 outputFile, _ := os.Create("output.txt")
 defer outputFile.Close()
 
 for i := 0; i < matrixSize; i++ {
  for j := 0; j < matrixSize; j++ {
   outputFile.WriteString(fmt.Sprintf("%f ", inverse.At(i, j)))
  }
  outputFile.WriteString("\n")
 }
}