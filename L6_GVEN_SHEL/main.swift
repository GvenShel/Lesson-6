//
//  main.swift
//  L6_GVEN_SHEL
//
//  Created by Admin on 05.03.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation


protocol Intable {
    var number: Int {get set}
}

class IntNumbers: Intable {
    var number: Int
    
    init(_ number: Int) {
        self.number = number
    }
}

extension IntNumbers: CustomStringConvertible {
    var description: String {
        return "\(number)"
    }
    
    
}

struct Queue<T: Intable> {
    
    private var elements: [T] = []
//    private var square:(Int) -> (Int) = {(s1: Int) -> Int in
//    return s1 * s1
//    }
    
    
    
    mutating func toSquare() -> ([Int]){
        return elements.map({$0.number * $0.number})
        }
    
    mutating func toFilterEven() -> ([T]){
        return elements.filter{$0.number % 2 == 0}
        }
    
    mutating func toSort() -> ([T]) {
        return elements.sorted(by: {$0.number < $1.number })
    }
    
    mutating func add(_ element: T) {
        elements.append(element)
    }
    
    mutating func add(_ element: [T]) {
        elements.append(contentsOf: element)
       }
    
    
    mutating func remove() -> T? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeFirst()
    }
    
    func peek() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            return elements[0]
        }
    }
    
    subscript(s1: Int...) -> Int? {
        
        let arr = s1
        
        for i in 0...arr.count-1 {
            if !elements.indices.contains(arr[i]) {
            return nil}
            }
        return s1.reduce(0) { $0 + self.elements[$1].number
        }
       
    }
    
}
    
var startsWithLetter: (String) -> Bool = {
    (l1: String) -> Bool in
    let firstLetter = Array(l1)[0]
    return firstLetter == "S"
}

var lengthChecker: (String) -> Bool = { (w1: String) -> Bool in
    return w1.count > 3
}

var toLowerCase: (String) -> String = { (w1: String) -> String in
    return w1.lowercased()
}

var toAddPrefix: (String) -> String = { (w1: String) -> String in
    return "Name is " + "\(w1)"
}


func nameChecker(namesArray: [String], predicate: (String) -> Bool) -> [String] {
    var tmpArray = [String]()
    for i in namesArray {
        if predicate(i) {
        tmpArray.append(i)
        }
    }
    return tmpArray
}

    func nameModifier(namesArray: [String], predicate: (String) -> String) -> [String] {
        var tmpArray = [String]()
        for i in namesArray {
            tmpArray.append(predicate(i))
        }
        return tmpArray
    }


var queue: Queue<IntNumbers> = Queue()

var s1: IntNumbers = IntNumbers(12)
var s2: IntNumbers = IntNumbers(13)
var s3: IntNumbers = IntNumbers(150)
var s4: IntNumbers = IntNumbers(14)
var s5: IntNumbers = IntNumbers(1500)
var s6: IntNumbers = IntNumbers(15)




queue.add([s1, s2, s3, s4, s5, s6])

print(queue.toSquare())

print(queue.toFilterEven())

print(queue)

print(queue[0, 2])

print(queue.toSort())


var arrayOfNames = ["Andrew", "Samson", "Sergei", "Bob", "Sam", "Antony", "Sol"]

print(nameChecker(namesArray: arrayOfNames, predicate: lengthChecker))

print(nameModifier(namesArray: arrayOfNames, predicate: toLowerCase))
