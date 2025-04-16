//
// SelectSort.swift
//
// Created by Noah Smith
// Created on 2025-04-15
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The Select Sort program will read a set of integers between 0 and 100.
// It will populate the set of integers into an array.
// It will then sort the arrays using the selection sort algorithm.
// It will write the sorted array to the output file.

// Import foundation library
import Foundation

// Function to sort the array using selection sort
func selectSort(_ arrayInt: [Int]) -> [Int] {

    // initialize array
    // Create a copy of the array in order to not modify the original
    var arrayInt = arrayInt

    // Get array size
    let arraySize = arrayInt.count

    // Selection sort algorithm
    // Start of the selection sort algorithm
    // Iterate through the array to sort it
    for pass in 0..<arraySize - 1 {

        // Set the minimum index to the pass number
        var indexMin = pass

        // Iterate through the unsorted part of the array to find the min
        for counter in pass + 1..<arraySize {

            // if the current number is less than the current minimum
            if arrayInt[counter] < arrayInt[indexMin] {
                // Set the min's index equal to the counter
                indexMin = counter
            }
        }

        // If the min is not already in correct position
        if indexMin != pass {

            // swap the min with the current number
            let temp = arrayInt[indexMin]
            arrayInt[indexMin] = arrayInt[pass]
            arrayInt[pass] = temp
        }
    }

    // return the sorted array
    return arrayInt
}

// Greeting and instructions
print("Welcome to the select sort program!")
print("This program gets a set of integers")
print("from 'input.txt'.")
print("It then sorts the integers using selection sort.")
print("The sorted set will be written to 'output.txt'.")

// initialize output string
var outputStr = ""

// open input file for reading
let inputPath = "./input.txt"

// Create output file
let outputPath = "./output.txt"

do {
    let numbers = try String(contentsOfFile: inputPath)

    // Split up the numbers by spaces
    // Source: 
    // https://developer.apple.com/documentation/foundation/nsstring/components(separatedby:)-238fy
    let arrayNumStr = numbers.components(separatedBy: " ")

    // Create array of numbers
    var arrayNumInt = [Int]()

    // convert the array of strings to ints
    // one number at a time
    for numStr in arrayNumStr {
        if let num = Int(numStr) {
            // add the number to the end of the array
            arrayNumInt.append(num)
        }
    }

    // call the select sort function
    let sortedArray = selectSort(arrayNumInt)

    // Add the numbers to the output string
    // one number at a time, separated by a space
    for num in sortedArray {
        outputStr += "\(num) "
    }

    // write the output string to the output file
    try outputStr.write(toFile: outputPath, atomically: true, encoding: .utf8)

    // Display success message
    print("\nSuccessfully wrote to file 'output.txt'.")

// If there's a file error
} catch {
    // Display file error message
    print("A file error occurred.")
}
