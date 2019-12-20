//
//  main.swift
//  give_me_a_diamond
//
//  Created by Marcela Limieri Tozzato on 17/12/19.
//  Copyright © 2019 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

func diamond(_ size: Int) -> String {
    if (size % 2 == 0) || (size <= 0) {
        return ""
    }
    var number = 1
    var string = ""
    var diamond = ""
    var space = ""
    
    while number < size {
        string = asterisco(number: number)
        space = spaces(size: size, number: number)
        diamond += space + string + "\n"
        number += 2
    }
    
    if number == size {
        string = asterisco(number: number)
        diamond += string + "\n"
        number -= 2
    }
    
    while number > 0 {
        string = asterisco(number: number)
        space = spaces(size: size, number: number)
        diamond += space + string + "\n"
        number -= 2
    }
        return diamond
}

func asterisco(number: Int) -> String {
    var string = ""
    for _ in 0..<number {
        string += "*"
    }
    return string
}

func spaces(size: Int, number: Int) -> String {
    var space = ""
    for _ in 0..<((size - number)/2){
        space += " "
    }
    
    return space
}


print(diamond(11))
