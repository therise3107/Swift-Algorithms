/*
 
 Loop through the array and store values in a dictonary with key same as number and value as index and occurance
 
 */

import Foundation

//func countTripletss(arr: [Int], r: Int) -> Int {
//    var triplets: Int = 0
//    var dictionary = [Int:Array<Int>]()
//
//    for index in 0..<arr.count {
//        let key = arr[index]
//
//        dictionary[key, default: []].append(index)
//    }
//
//    for key in Set(arr) {
//        let firstValue = dictionary[key]!
//        if let secondValue = dictionary[r*key] {
//            if let thirdValue = dictionary[r*r*key] {
//                for index in firstValue {
//                    for nextIndex in secondValue {
//                        if nextIndex > index {
//                            for lastIndex in thirdValue {
//                                if lastIndex > nextIndex {
//                                    triplets += 1
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    return triplets
//}

//func countTriplets(arr: [Int], r: Int) -> Int {
//    var triplets: Int = 0
//    var dictionaryWithKeys = [Int:[Int]]()
//    var dictionaryWithValues = [Int:[[Int]]]()
//
//    for (index, key) in arr.enumerated() {
//        dictionaryWithKeys[key, default: []].append(index)
//    }
//
//    for (index, key) in arr.enumerated() {
//        if let nextValue = dictionaryWithKeys[key * r] {
//            if let lastValue = dictionaryWithKeys[key * r * r] {
//                for nextIndex in nextValue {
//                    if nextIndex > index {
//                        for lastIndex in lastValue {
//                            if lastIndex > nextIndex {
//                                dictionaryWithValues[key, default: []].append([index, nextIndex, lastIndex])
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//
//    for values in dictionaryWithValues.values {
//        triplets &+= values.count
//    }
//
//    return triplets
//}
func countTriplets(arr: [Int], r: Int) -> Int {
    var triplets = 0
    var leftMap = [Int:Int]()
    var rightMap = [Int:Int]()
    
    for value in arr {
        rightMap[value] = (rightMap[value] ?? 0) + 1
    }
    
    for index in 0..<arr.count {
        let midValue = arr[index]
        
        if let midValuefreq = rightMap[arr[index]] {
            rightMap[arr[index]] = max(midValuefreq - 1, 0)

            if let leftValuefreq = leftMap[midValue / r] {
                if let rightValuefreq = rightMap[midValue * r] {
                    triplets += leftValuefreq * rightValuefreq
                }
            }
            
            leftMap[arr[index]] = (leftMap[arr[index]] ?? 0) + 1
        }
        
    }
    
    return triplets
}


//let arr = [1, 3, 9, 9, 27, 81]
//print(countTriplets(arr: arr, r: 3))
let newArr = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
//countTriplets(arr: newArr, r: 1)
//print(countTriplets(arr: [1, 2, 1, 2, 4], r: 2))
//print(countTriplets(arr: [1, 1, 1, 1], r: 1))
//print(countTriplets(arr: newArr, r: 1))

let largeArr = [1, 2, 3]

print(countTriplets(arr: largeArr, r: 3))

