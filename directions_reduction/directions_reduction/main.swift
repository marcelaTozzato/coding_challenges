//
//  main.swift
//  directions_reduction
//
//  Created by Marcela Limieri Tozzato on 02/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

let teste = ["SOUTH", "EAST", "EAST", "NORTH", "EAST", "NORTH", "EAST", "SOUTH", "WEST", "WEST", "WEST", "NORTH", "NORTH"]

let matches: [String: String] = ["NORTH": "SOUTH", "SOUTH": "NORTH", "WEST": "EAST", "EAST": "WEST"]

func dirReduc(_ arr: [String]) -> [String] {

    var stack: [String] = []
    
    for value in arr {
        if stack.isEmpty {
            stack.append(value)
        } else {
            if matches[value] == stack.last {
                stack.removeLast()
            } else {
                stack.append(value)
            }
        }
    }
    
    return stack
}

print(dirReduc(teste))
