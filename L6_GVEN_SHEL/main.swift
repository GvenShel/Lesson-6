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
