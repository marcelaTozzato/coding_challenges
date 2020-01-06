//
//  main.swift
//  primes_in_numbers
//
//  Created by Marcela Limieri Tozzato on 06/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

let divisiveis = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]

func factors(_ number: Int) -> String {
    var p: [Int] = []
    var n: [Int] = []
    var contador = 0
    var numero = number
    
    for value in divisiveis {
        while numero % value == 0 {
            contador += 1
            numero = numero / value
        }
        if contador != 0 {
            p.append(value)
            n.append(contador)
        }
        contador = 0
    }
    
    if numero != 1 {
        p.append(numero)
        n.append(1)
    }
    
    return retorno(p: p, n: n)
}

func retorno(p: [Int], n: [Int]) -> String {
    var resultado: String = ""
    for index in 0..<p.count {
        if n[index] != 1 {
            resultado += "(\(p[index])**\(n[index]))"
        } else {
            resultado += "(\(p[index]))"
        }
    }
    return resultado
}



print(factors(627632763))

